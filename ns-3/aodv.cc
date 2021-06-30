#include "ns3/aodv-module.h"
#include "ns3/core-module.h"
#include "ns3/network-module.h"
#include "ns3/internet-module.h"
#include "ns3/mobility-module.h"
#include "ns3/wifi-module.h" 
#include "ns3/applications-module.h"
#include "ns3/netanim-module.h"
#include "ns3/flow-monitor-module.h"

#include <iostream>
#include <fstream>
#include <vector>
#include <string>
#include <cmath>

using namespace ns3;

int packetsSent = 0;
int packetsReceived = 0;
uint32_t SentPackets=0; //var for sending packets
  uint32_t ReceivedPackets=0; // to receive packets 
void ReceivePacket (Ptr<Socket> socket)
{
  Ptr<Packet> packet;
  while ((packet = socket->Recv ()))
    {
	  packetsReceived++;
      std::cout<<"Received packet - "<<packetsReceived<<" and Size is "
    		  <<packet->GetSize ()<<" Bytes."<<std::endl;
    }
}

static void GenerateTraffic (Ptr<Socket> socket, uint32_t pktSize,
                             uint32_t pktCount, Time pktInterval )
{
  if (pktCount > 0)
    {
      socket->Send (Create<Packet> (pktSize));
      packetsSent++;
      std::cout<<"Packet sent - "<<packetsSent<<std::endl;

      Simulator::Schedule (pktInterval, &GenerateTraffic,
                           socket, pktSize,pktCount-1, pktInterval);
    }
  else
    {
      socket->Close ();
    }
}

int main(int argc, char **argv)
{
  uint32_t size=10;
  double step=100;
  double totalTime=10/*2250*//*2175*/;
  bool asciitracing=true;	
  int packetSize = 1024;
  int totalPackets = totalTime-1;
  double interval = 1;

  Time interPacketInterval = Seconds (interval);

  NodeContainer nodes;
  NetDeviceContainer devices;
  Ipv4InterfaceContainer interfaces;

  std::cout << "Creating " << (unsigned)size << " nodes " << step << " m apart.\n";
  nodes.Create (size);

  MobilityHelper mobility;
  mobility.SetMobilityModel ("ns3::RandomWalk2dMobilityModel",
                             "Bounds", RectangleValue (Rectangle (-0.0000009, 100.0, -0.0000009, 100.0)));
  /*
  mobility.SetPositionAllocator ("ns3::GridPositionAllocator",
                                   "MinX", DoubleValue (0.0),
                                   "MinY", DoubleValue (0.0),
                                   "DeltaX", DoubleValue (step),
                                   "DeltaY", DoubleValue (step),
                                   "GridWidth", UintegerValue (size),
                                   "LayoutType", StringValue ("RowFirst")};
  mobility.SetMobilityModel ("ns3::ConstantPositionMobilityModel");
  */
  mobility.Install (nodes);

  NqosWifiMacHelper wifiMac = NqosWifiMacHelper::Default ();
  wifiMac.SetType ("ns3::AdhocWifiMac");
  YansWifiPhyHelper wifiPhy = YansWifiPhyHelper::Default ();
  YansWifiChannelHelper wifiChannel = YansWifiChannelHelper::Default ();
  wifiPhy.SetChannel (wifiChannel.Create ());
  WifiHelper wifi = WifiHelper::Default ();
  wifi.SetRemoteStationManager ("ns3::ConstantRateWifiManager",
		  "DataMode", StringValue ("OfdmRate6Mbps"), "RtsCtsThreshold", UintegerValue (0));
  devices = wifi.Install (wifiPhy, wifiMac, nodes); 

  AodvHelper aodv;
  InternetStackHelper stack;
  stack.SetRoutingHelper (aodv);
  stack.Install (nodes);
  Ipv4AddressHelper address;
  address.SetBase ("10.0.0.0", "255.0.0.0");
  interfaces = address.Assign (devices);

  Ipv4GlobalRoutingHelper::PopulateRoutingTables ();

  TypeId tid = TypeId::LookupByName ("ns3::UdpSocketFactory");
  Ptr<Socket> recvSink = Socket::CreateSocket (nodes.Get (size-1), tid);
  InetSocketAddress local = InetSocketAddress (Ipv4Address::GetAny (), 8080);
  recvSink->Bind (local);
  recvSink->SetRecvCallback (MakeCallback (&ReceivePacket));

  Ptr<Socket> source = Socket::CreateSocket (nodes.Get (0), tid);
  InetSocketAddress remote = InetSocketAddress (interfaces.GetAddress (size-1,0), 8080);
  source->Connect (remote);

  Simulator::Schedule (Seconds (1), &GenerateTraffic, source, packetSize, totalPackets, interPacketInterval);

  //std::cout << "Starting simulation for " << totalTime << " s ...\n";
  AnimationInterface anim ("scratch/aodv_output.xml");

  /*Ptr<FlowMonitor> flowmon;
  FlowMonitorHelper flowmonHelper;
  flowmon = flowmonHelper.InstallAll ();*/
  FlowMonitorHelper flowmon;
  Ptr<FlowMonitor> monitor = flowmon.InstallAll();
	  

  Simulator::Stop (Seconds (totalTime));
	//to get ascii tracing
	if(asciitracing==true)
	{
		AsciiTraceHelper ascii;
		MobilityHelper::EnableAsciiAll(ascii.CreateFileStream("iitp-trace.tr"));
		wifiPhy.EnableAsciiAll(ascii.CreateFileStream("aodv.tr"));
		//
		//
		
		wifiPhy.EnablePcap("aodv_sec",devices.Get(0),true);
		wifiPhy.EnablePcap("aodv_sec",devices.Get(9),true);
		//wifi.EnablePcap("aodv_sec",csmaDevices.Get(0),true);
	}
  Simulator::Run ();


  /*flowmon->SetAttribute("DelayBinWidth", DoubleValue(0.01));
  flowmon->SetAttribute("JitterBinWidth", DoubleValue(0.01));
  flowmon->SetAttribute("PacketSizeBinWidth", DoubleValue(1));
  flowmon->CheckForLostPackets();
  flowmon->SerializeToXmlFile("scratch/aodv_flow.xml", true, true);*/
  Ptr<Ipv4FlowClassifier> classifier = DynamicCast<Ipv4FlowClassifier> (flowmon.GetClassifier());
std::map<FlowId,FlowMonitor::FlowStats> stats = monitor->GetFlowStats ();
int j =0;
float AvgThroughput =0;
Time Delay;

 NS_LOG_UNCOND("-------------Results output ID wise ----------------------"<<std::endl);

for(std::map<FlowId,FlowMonitor::FlowStats>::const_iterator iter=stats.begin ();iter!=stats.end();++iter)
        {
        Ipv4FlowClassifier::FiveTuple t = classifier->FindFlow(iter->first);
        NS_LOG_UNCOND("-------Flow Id: "<<iter->first);
        NS_LOG_UNCOND("Src Addr " << t.sourceAddress <<" DST Adderss "<< t.destinationAddress);
        NS_LOG_UNCOND("Sent Packets = " << iter->second.txPackets);
        NS_LOG_UNCOND("Received Packets = "<<iter->second.rxPackets);

	NS_LOG_UNCOND("Delay = "<<iter->second.delaySum);
        NS_LOG_UNCOND("Throughput = " <<iter->second.rxBytes*8.0 /(iter->second.timeLastRxPacket.GetSeconds()-iter->second.timeFirstTxPacket.GetSeconds() )/1024<< " Kbps");// this will show the throughput on flow id

	
        SentPackets = SentPackets + (iter->second.txPackets);
        ReceivedPackets=ReceivedPackets +(iter->second.rxPackets);
	AvgThroughput = AvgThroughput + (iter->second.rxBytes * 8.0 / (iter->second.timeLastRxPacket.GetSeconds()-iter->second.timeFirstTxPacket.GetSeconds())/1024); // this variable hold the value of total results of the sim
        Delay=Delay+(iter->second.delaySum);  

        j=j+1;
        }
                         AvgThroughput=AvgThroughput/j;
        NS_LOG_UNCOND("-------Total Resilt of the simulation---------" << std::endl);
        NS_LOG_UNCOND("Total Sent Packets = "<< SentPackets);
        NS_LOG_UNCOND("Total Received Packets = "<< ReceivedPackets);

 	NS_LOG_UNCOND("Average Throughput = " << AvgThroughput);
        NS_LOG_UNCOND(" Delay = "<<Delay );


        NS_LOG_UNCOND("Total Flow Id = "<< j);
        monitor->SerializeToXmlFile("manet-routing-compare.flowmon",true,true);


  Simulator::Destroy ();

  /*std::cout<<"\n\n***** OUTPUT *****\n\n";
  std::cout<<"Total Packets sent = "<<packetsSent<<std::endl;
  std::cout<<"Total Packets received = "<<packetsReceived<<std::endl;*/
  std::cout<<"Packet delivery ratio = "<<(float)(packetsReceived/packetsSent)*100<<" %"<<std::endl;

}
