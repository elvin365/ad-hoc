

#===================================
#     Simulation parameters setup
#===================================
Phy/WirelessPhy set bandwidth_ 11Mb        ;#Data Rate
Mac/802_11 set dataRate_ 6Mb              ;#Rate for Data Frames
set val(chan)   Channel/WirelessChannel    ;# channel type
set val(prop)   Propagation/TwoRayGround   ;# radio-propagation model
set val(netif)  Phy/WirelessPhy            ;# network interface type
set val(mac)    Mac/802_11                 ;# MAC type
set val(ifq)    Queue/DropTail/PriQueue    ;# interface queue type
set val(ll)     LL                         ;# link layer type
set val(ant)    Antenna/OmniAntenna        ;# antenna model
set val(ifqlen) 50                         ;# max packet in ifq
set val(nn)     10                         ;# number of mobilenodes
set val(rp)     AODV                       ;# routing protocol
set val(x)      10000                      ;# X dimension of topography
set val(y)      10000                      ;# Y dimension of topography
set val(stop)   10.0                         ;# time of simulation end

#===================================
#        Initialization        
#===================================
#Create a ns simulator
set ns [new Simulator]

#Setup topography object
set topo       [new Topography]
$topo load_flatgrid $val(x) $val(y)
create-god $val(nn)

#Open the NS trace file
set tracefile [open godhelp.tr w]
$ns trace-all $tracefile

#Open the NAM trace file
set namfile [open godhelp.nam w]
$ns namtrace-all $namfile
$ns namtrace-all-wireless $namfile $val(x) $val(y)
set chan [new $val(chan)];#Create wireless channel
$ns use-newtrace

#===================================
#     Mobile node parameter setup
#===================================
$ns node-config -adhocRouting  $val(rp) \
                -llType        $val(ll) \
                -macType       $val(mac) \
                -ifqType       $val(ifq) \
                -ifqLen        $val(ifqlen) \
                -antType       $val(ant) \
                -propType      $val(prop) \
                -phyType       $val(netif) \
                -channel       $chan \
                -topoInstance  $topo \
		-energyModel "EnergyModel" \
		-initialEnergy 0.0331 \
		-txPower 0.9 \
		-rxPower 0.9 \
		-idlePower 0.6 \
		-sleepPower 1.0 \
                -agentTrace    ON \
                -routerTrace   ON \
                -macTrace      ON \
                -movementTrace ON

#===================================
#        Nodes Definition        
#===================================
#Create 10 nodes
set n0 [$ns node]
$n0 set X_ 0.0
$n0 set Y_ 0.0
$n0 set Z_ 0.0
$ns initial_node_pos $n0 20
set n1 [$ns node]
$n1 set X_ 0.0
$n1 set Y_ 0.0
$n1 set Z_ 0.0
$ns initial_node_pos $n1 20
set n2 [$ns node]
$n2 set X_ 0.0
$n2 set Y_ 0.0
$n2 set Z_ 0.0
$ns initial_node_pos $n2 20
set n3 [$ns node]
$n3 set X_ 0.0
$n3 set Y_ 0.0
$n3 set Z_ 0.0
$ns initial_node_pos $n3 20
set n4 [$ns node]
$n4 set X_ 0.0
$n4 set Y_ 0.0
$n4 set Z_ 0.0
$ns initial_node_pos $n4 20
set n5 [$ns node]
$n5 set X_ 0.0
$n5 set Y_ 0.0
$n5 set Z_ 0.0
$ns initial_node_pos $n5 20
set n6 [$ns node]
$n6 set X_ 0.0
$n6 set Y_ 0.0
$n6 set Z_ 0.0
$ns initial_node_pos $n6 20
set n7 [$ns node]
$n7 set X_ 0.0
$n7 set Y_ 0.0
$n7 set Z_ 0.0
$ns initial_node_pos $n7 20
set n8 [$ns node]
$n8 set X_ 0.0
$n8 set Y_ 0.0
$n8 set Z_ 0.0
$ns initial_node_pos $n8 20
set n9 [$ns node]
$n9 set X_ 0.0
$n9 set Y_ 0.0
$n9 set Z_ 0.0
$ns initial_node_pos $n9 20

#===================================
#        Generate movement          
#===================================
$ns at 0.302916 "$n0 setdest 531.924000 84.678900 100 " 
$ns at 0.580994 "$n0 setdest 374.14000  0.5 100 " 
$ns at 0.625751 "$n0 setdest 348.745000 13.628900 100 " 
$ns at 0.754892 "$n0 setdest  0.5 33.698500 100 " 
$ns at 0.946701 "$n0 setdest 517.979000 63.507400 100 " 
$ns at 1.26189 "$n0 setdest 248.409000 159.80500 100 " 
$ns at 1.34352 "$n0 setdest  0.5 158.07200 100 " 
$ns at 1.5 "$n0 setdest 476.158000 154.7500 100 " 
$ns at 1.58972 "$n0 setdest 749.165000 152.84500 100 " 
$ns at 1.75 "$n0 setdest 1133.67000 125.9500 100 " 
$ns at 1.9313 "$n0 setdest 1568.6000 95.527800 100 " 
$ns at 2.19395 "$n0 setdest 965.907000 15.730400 100 " 
$ns at 2.53872 "$n0 setdest 484.273000 103.36800 100 " 
$ns at 2.75 "$n0 setdest 41.5062000 69.867600 100 " 
$ns at 2.76981 "$n0 setdest  0.5 66.727100 100 " 
$ns at 2.91925 "$n0 setdest 313.189000 43.03100 100 " 
$ns at 3.06014 "$n0 setdest  0.5 51.755700 100 " 
$ns at 3.35259 "$n0 setdest 650.128000 69.866600 100 " 
$ns at 3.69348 "$n0 setdest 137.197000  0.5 100 " 
$ns at 3.7459 "$n0 setdest 58.333000 10.74200 100 " 
$ns at 3.8153 "$n0 setdest  0.5 26.80700 100 " 
$ns at 4.15197 "$n0 setdest 282.973000 104.73700 100 " 
$ns at 4.25 "$n0 setdest 5.22186000 77.335300 100 " 
$ns at 4.25184 "$n0 setdest  0.5 76.8200 100 " 
$ns at 4.40321 "$n0 setdest 428.899000 34.506400 100 " 
$ns at 4.65162 "$n0 setdest  0.5 114.30500 100 " 
$ns at 4.6774 "$n0 setdest 44.5253000 122.5900 100 " 
$ns at 4.72714 "$n0 setdest  0.5 133.50500 100 " 
$ns at 4.75 "$n0 setdest 20.4697000 138.52300 100 " 
$ns at 5.09928 "$n0 setdest 333.187000 215.18200 100 " 
$ns at 5.5429 "$n0 setdest 803.052000 303.45600 100 " 
$ns at 5.75 "$n0 setdest 462.838000 247.14800 100 " 
$ns at 5.8577 "$n0 setdest 285.913000 217.86600 100 " 
$ns at 6.34093 "$n0 setdest 502.241000 120.23400 100 " 
$ns at 6.5 "$n0 setdest 1000.42000 114.29800 100 " 
$ns at 6.658 "$n0 setdest 1495.22000 108.40400 100 " 
$ns at 6.75 "$n0 setdest 1575.06000 89.89800 100 " 
$ns at 7.1145 "$n0 setdest 1891.36000 16.584500 100 " 
$ns at 7.22552 "$n0 setdest 1690.49000  0.5 100 " 
$ns at 7.25 "$n0 setdest 1646.2000 3.656700 100 " 
$ns at 7.54072 "$n0 setdest 1120.23000 47.083600 100 " 
$ns at 7.88907 "$n0 setdest 2034.44000 87.60900 100 " 
$ns at 8.15972 "$n0 setdest 2474.81000 177.3900 100 " 
$ns at 8.25 "$n0 setdest 2559.3000 206.57100 100 " 
$ns at 8.45689 "$n0 setdest 2752.9000 273.44600 100 " 
$ns at 8.71344 "$n0 setdest 1971.78000 335.88400 100 " 
$ns at 8.75 "$n0 setdest 2018.59000 345.66500 100 " 
$ns at 9.05061 "$n0 setdest 2403.49000 426.08500 100 " 
$ns at 9.25 "$n0 setdest 2275.84000 380.07900 100 " 
$ns at 9.46823 "$n0 setdest 2136.14000 329.72500 100 " 
$ns at 9.75 "$n0 setdest 1867.06000 263.18400 100 " 
$ns at 9.8608 "$n0 setdest 1761.25000 237.01800 100 "

#NODE 0 is done

$ns at 0.473043 "$n1 setdest 239.35000 97.093100 100 " 
$ns at 0.569144 "$n1 setdest  0.5 92.871500 100 " 
$ns at 0.75 "$n1 setdest 450.448000 84.926700 100 " 
$ns at 0.868443 "$n1 setdest 745.447000 79.723600 100 " 
$ns at 1 "$n1 setdest 754.025000 108.78600 100 " 
$ns at 1.32092 "$n1 setdest 774.95000 179.6800 100 " 
$ns at 1.72033 "$n1 setdest 756.405000 79.697300 100 " 
$ns at 2 "$n1 setdest 956.582000 135.07300 100 " 
$ns at 2.1953 "$n1 setdest 1096.37000 173.74100 100 " 
$ns at 2.5 "$n1 setdest 1399.000 99.465600 100 " 
$ns at 2.5752 "$n1 setdest 1473.7000 81.133500 100 " 
$ns at 2.75 "$n1 setdest 1361.01000 141.88200 100 " 
$ns at 2.85811 "$n1 setdest 1291.31000 179.45600 100 " 
$ns at 3 "$n1 setdest 759.685000 180.62800 100 " 
$ns at 3.12494 "$n1 setdest 291.558000 181.6600 100 " 
$ns at 3.46244 "$n1 setdest 813.858000 96.383800 100 " 
$ns at 3.75 "$n1 setdest 1690.02000 122.47200 100 " 
$ns at 3.777 "$n1 setdest 1772.27000 124.92100 100 " 
$ns at 4 "$n1 setdest 1902.2000 45.399200 100 " 
$ns at 4.05376 "$n1 setdest 1933.52000 26.229900 100 " 
$ns at 4.45659 "$n1 setdest 2929.76000 34.892500 100 " 
$ns at 4.75 "$n1 setdest 2734.72000 101.03400 100 " 
$ns at 4.88209 "$n1 setdest 2646.92000 130.80900 100 " 
$ns at 5.25 "$n1 setdest 3118.77000 67.511400 100 " 
$ns at 5.3481 "$n1 setdest 3244.58000 50.634200 100 " 
$ns at 5.57993 "$n1 setdest 2992.7000  0.5 100 " 
$ns at 5.75 "$n1 setdest 2807.91000 37.146500 100 " 
$ns at 5.75803 "$n1 setdest 2799.19000 38.899500 100 " 
$ns at 5.93179 "$n1 setdest 3351.02000  0.5 100 " 
$ns at 6 "$n1 setdest 3567.63000 15.269500 100 " 
$ns at 6.0154 "$n1 setdest 3616.53000 18.716300 100 " 
$ns at 6.25 "$n1 setdest 4099.77000 29.077300 100 " 
$ns at 6.49008 "$n1 setdest 4594.31000 39.680300 100 " 
$ns at 6.65816 "$n1 setdest 5118.57000  0.5 100 " 
$ns at 6.74572 "$n1 setdest 5391.67000 20.670100 100 " 
$ns at 7 "$n1 setdest 6248.29000 20.56300 100 " 
$ns at 7.04256 "$n1 setdest 6391.67000 20.54500 100 " 
$ns at 7.21488 "$n1 setdest 6718.88000  0.5 100 " 
$ns at 7.25 "$n1 setdest 6785.57000 4.1873800 100 " 
$ns at 7.48856 "$n1 setdest 7238.56000 32.6300 100 " 
$ns at 7.60974 "$n1 setdest 7370.57000  0.5 100 " 
$ns at 7.75 "$n1 setdest 7523.35000 37.767100 100 " 
$ns at 7.83283 "$n1 setdest 7613.58000 60.071500 100 " 
$ns at 8 "$n1 setdest 7595.24000 115.07300 100 " 
$ns at 8.1366 "$n1 setdest 7580.25000 160.01600 100 " 
$ns at 8.5 "$n1 setdest 7617.84000 76.908800 100 " 
$ns at 8.57342 "$n1 setdest 7625.43000 60.118100 100 " 
$ns at 8.98571 "$n1 setdest 8376.16000  0.5 100 " 
$ns at 9 "$n1 setdest 8402.18000 2.083200 100 " 
$ns at 9.0021 "$n1 setdest 8406.000 2.3892600 100 " 
$ns at 9.01145 "$n1 setdest 8424.59000  0.5 100 " 
$ns at 9.31098 "$n1 setdest 9020.2000 76.525400 100 " 
$ns at 9.5 "$n1 setdest 9220.09000 135.64500 100 " 
$ns at 9.61386 "$n1 setdest 9340.49000 171.25700 100 " 
$ns at 9.75 "$n1 setdest 9322.67000 215.58900 100 " 
$ns at 9.9207 "$n1 setdest 9300.32000 271.17700 100 "

#NODE 1 is done

$ns at 0.313816 "$n2 setdest 453.932000 89.103600 100 " 
$ns at 0.507404 "$n2 setdest  0.5 71.973800 100 " 
$ns at 0.712819 "$n2 setdest 481.666000 53.797400 100 " 
$ns at 1 "$n2 setdest 52.2597000 108.51600 100 " 
$ns at 1.03495 "$n2 setdest  0.5 115.17500 100 " 
$ns at 1.1257 "$n2 setdest 135.688000 132.46600 100 " 
$ns at 1.27269 "$n2 setdest  0.5 172.35700 100 " 
$ns at 1.47456 "$n2 setdest 186.341000 227.13900 100 " 
$ns at 1.55839 "$n2 setdest  0.5 249.78900 100 " 
$ns at 1.75 "$n2 setdest 425.891000 301.55800 100 " 
$ns at 1.76039 "$n2 setdest 448.975000 304.36400 100 " 
$ns at 2.14576 "$n2 setdest 554.876000 403.80100 100 " 
$ns at 2.38006 "$n2 setdest  0.5 475.02200 100 " 
$ns at 2.40527 "$n2 setdest 59.7132000 482.68600 100 " 
$ns at 2.5 "$n2 setdest 166.655000 500.99700 100 " 
$ns at 2.852 "$n2 setdest 564.035000 569.03800 100 " 
$ns at 3.00609 "$n2 setdest  0.5 570.87400 100 " 
$ns at 3.12504 "$n2 setdest 435.434000 572.29100 100 " 
$ns at 3.25 "$n2 setdest 225.818000 607.38800 100 " 
$ns at 3.38462 "$n2 setdest  0.5 645.19700 100 " 
$ns at 3.43072 "$n2 setdest 77.3247000 658.14400 100 " 
$ns at 3.75 "$n2 setdest 492.918000 584.37600 100 " 
$ns at 3.80781 "$n2 setdest 568.168000 571.01900 100 " 
$ns at 4 "$n2 setdest 1063.32000 616.51400 100 " 
$ns at 4.09363 "$n2 setdest 1304.54000 638.67700 100 " 
$ns at 4.5 "$n2 setdest 679.706000 710.49600 100 " 
$ns at 4.52051 "$n2 setdest 648.169000 714.1200 100 " 
$ns at 4.75 "$n2 setdest 1414.68000 714.42100 100 " 
$ns at 4.8199 "$n2 setdest 1648.16000 714.51300 100 " 
$ns at 5 "$n2 setdest 1520.24000 674.93900 100 " 
$ns at 5.25293 "$n2 setdest 1340.59000 619.3600 100 " 
$ns at 5.5 "$n2 setdest 1097.71000 552.9600 100 " 
$ns at 5.60238 "$n2 setdest 997.071000 525.44600 100 " 
$ns at 5.85514 "$n2 setdest 586.145000 616.61200 100 " 
$ns at 6.0086 "$n2 setdest  0.5 609.48200 100 " 
$ns at 6.11504 "$n2 setdest 406.534000 604.53600 100 " 
$ns at 6.25 "$n2 setdest 371.963000 559.47700 100 " 
$ns at 6.41367 "$n2 setdest 330.036000 504.82900 100 " 
$ns at 6.5 "$n2 setdest 262.534000 473.99200 100 " 
$ns at 6.68714 "$n2 setdest 116.202000 407.14200 100 " 
$ns at 6.75 "$n2 setdest 247.015000 398.39800 100 " 
$ns at 7.08665 "$n2 setdest 947.572000 351.5700 100 " 
$ns at 7.48306 "$n2 setdest 952.169000 451.56900 100 " 
$ns at 7.75 "$n2 setdest 821.048000 535.39500 100 " 
$ns at 7.79768 "$n2 setdest 797.627000 550.36800 100 " 
$ns at 8 "$n2 setdest 1442.48000 518.13800 100 " 
$ns at 8.07833 "$n2 setdest 1692.12000 505.6600 100 " 
$ns at 8.43087 "$n2 setdest 1073.51000 584.2300 100 " 
$ns at 8.70899 "$n2 setdest 1802.06000 515.73100 100 " 
$ns at 9.16921 "$n2 setdest 804.208000 522.27600 100 " 
$ns at 9.5 "$n2 setdest 467.724000 451.15400 100 " 
$ns at 9.58963 "$n2 setdest 376.549000 431.88200 100 " 
$ns at 9.75 "$n2 setdest 751.442000 389.31400 100 " 
$ns at 9.87235 "$n2 setdest 1037.47000 356.83600 100 "

#NODE 2 is done

$ns at 0.279517 "$n3 setdest 390.379000 92.065300 100 " 
$ns at 0.5 "$n3 setdest 387.005000 142.93100 100 " 
$ns at 0.71297 "$n3 setdest 383.745000 192.06300 100 " 
$ns at 1 "$n3 setdest 759.906000 246.15400 100 " 
$ns at 1.14863 "$n3 setdest 954.683000 274.16300 100 " 
$ns at 1.42368 "$n3 setdest 238.6000 343.96400 100 " 
$ns at 1.70688 "$n3 setdest 904.04000 418.60900 100 " 
$ns at 1.75 "$n3 setdest 1006.17000 416.52900 100 " 
$ns at 2.12061 "$n3 setdest 1883.91000 398.64800 100 " 
$ns at 2.5 "$n3 setdest 2134.09000 315.70100 100 " 
$ns at 2.55852 "$n3 setdest 2172.68000 302.90800 100 " 
$ns at 2.75 "$n3 setdest 1512.35000 277.67100 100 " 
$ns at 2.82939 "$n3 setdest 1238.57000 267.20700 100 " 
$ns at 3 "$n3 setdest 1254.39000 321.72800 100 " 
$ns at 3.14218 "$n3 setdest 1267.58000 367.16500 100 " 
$ns at 3.48293 "$n3 setdest 1163.46000 466.62100 100 " 
$ns at 3.75 "$n3 setdest 505.115000 505.51700 100 " 
$ns at 3.8322 "$n3 setdest 302.495000 517.48800 100 " 
$ns at 4.12074 "$n3 setdest 998.979000 589.24500 100 " 
$ns at 4.423 "$n3 setdest 372.18000 511.32700 100 " 
$ns at 4.70871 "$n3 setdest 892.803000 596.70600 100 " 
$ns at 4.75 "$n3 setdest 787.246000 604.98400 100 " 
$ns at 5.01649 "$n3 setdest 105.934000 658.41800 100 " 
$ns at 5.07637 "$n3 setdest  0.5 671.17600 100 " 
$ns at 5.25 "$n3 setdest 307.195000 708.17400 100 " 
$ns at 5.37756 "$n3 setdest 532.877000 735.35400 100 " 
$ns at 5.75 "$n3 setdest 1456.68000 761.04500 100 " 
$ns at 5.76598 "$n3 setdest 1496.32000 762.14700 100 " 
$ns at 6 "$n3 setdest 1521.42000 812.28800 100 " 
$ns at 6.23212 "$n3 setdest 1546.32000 862.02200 100 " 
$ns at 6.5 "$n3 setdest 2379.78000 850.21700 100 " 
$ns at 6.55035 "$n3 setdest 2536.44000 847.99800 100 " 
$ns at 6.96213 "$n3 setdest 1685.28000 900.48800 100 " 
$ns at 7.25 "$n3 setdest 2222.16000 951.1400 100 " 
$ns at 7.35214 "$n3 setdest 2412.66000 969.11300 100 " 
$ns at 7.64675 "$n3 setdest 2443.24000 869.15900 100 " 
$ns at 7.75 "$n3 setdest 2603.52000 907.0600 100 " 
$ns at 7.89765 "$n3 setdest 2832.73000 961.26300 100 " 
$ns at 8.35086 "$n3 setdest 2964.99000 1060.3800 100 " 
$ns at 8.5 "$n3 setdest 2746.47000 1101.9600 100 " 
$ns at 8.66838 "$n3 setdest 2499.77000 1148.900 100 " 
$ns at 8.95888 "$n3 setdest 3344.82000 1202.3700 100 " 
$ns at 9.25 "$n3 setdest 2727.27000 1194.4900 100 " 
$ns at 9.42649 "$n3 setdest 2352.87000 1189.7100 100 " 
$ns at 9.72628 "$n3 setdest 1704.31000 1113.5900 100 "

#NODE 3 is done

$ns at 0.267667 "$n4 setdest 877.123000 48.026200 100 " 
$ns at 0.39083 "$n4 setdest 934.124000  0.5 100 " 
$ns at 0.5 "$n4 setdest 984.649000 42.5700 100 " 
$ns at 0.522328 "$n4 setdest 994.982000 51.276700 100 " 
$ns at 0.75 "$n4 setdest 419.632000 111.00200 100 " 
$ns at 0.796864 "$n4 setdest 301.202000 123.29500 100 " 
$ns at 0.893128 "$n4 setdest  0.5 132.20300 100 " 
$ns at 1 "$n4 setdest 334.392000 142.09100 100 " 
$ns at 1.10334 "$n4 setdest 657.744000 151.65400 100 " 
$ns at 1.5 "$n4 setdest 228.242000 69.551700 100 " 
$ns at 1.53143 "$n4 setdest 194.208000 63.045900 100 " 
$ns at 1.58374 "$n4 setdest  0.5 55.314200 100 " 
$ns at 1.75 "$n4 setdest 617.282000 30.739500 100 " 
$ns at 1.78167 "$n4 setdest 734.871000 26.058200 100 " 
$ns at 1.8634 "$n4 setdest 860.028000  0.5 100 " 
$ns at 2 "$n4 setdest 1069.22000 43.554100 100 " 
$ns at 2.06439 "$n4 setdest 1167.82000 64.083500 100 " 
$ns at 2.25 "$n4 setdest 1040.37000 104.32200 100 " 
$ns at 2.5 "$n4 setdest 868.719000 158.51800 100 " 
$ns at 2.50414 "$n4 setdest 865.875000 159.41600 100 " 
$ns at 2.75 "$n4 setdest 805.611000 223.22900 100 " 
$ns at 2.88771 "$n4 setdest 771.855000 258.97300 100 " 
$ns at 3.22209 "$n4 setdest 1001.12000 161.63700 100 " 
$ns at 3.25 "$n4 setdest 950.906000 169.16200 100 " 
$ns at 3.5 "$n4 setdest 501.123000 236.56400 100 " 
$ns at 3.53061 "$n4 setdest 446.05000 244.81700 100 " 
$ns at 3.70731 "$n4 setdest  0.5 296.89700 100 " 
$ns at 3.75 "$n4 setdest 107.751000 309.47800 100 " 
$ns at 3.78831 "$n4 setdest 204.446000 320.76800 100 " 
$ns at 4 "$n4 setdest 4.94451000 238.63700 100 " 
$ns at 4.00525 "$n4 setdest  0.5 236.60100 100 " 
$ns at 4.03877 "$n4 setdest 31.5945000 223.59400 100 " 
$ns at 4.05442 "$n4 setdest  0.5 223.78500 100 " 
$ns at 4.5331 "$n4 setdest 966.575000 229.63800 100 " 
$ns at 4.75 "$n4 setdest 1442.09000 197.14600 100 " 
$ns at 4.90971 "$n4 setdest 1792.23000 173.22100 100 " 
$ns at 5 "$n4 setdest 1928.64000 204.3900 100 " 
$ns at 5.17509 "$n4 setdest 2193.15000 264.83200 100 " 
$ns at 5.46378 "$n4 setdest 2986.06000 325.76600 100 " 
$ns at 5.75 "$n4 setdest 2317.17000 283.38900 100 " 
$ns at 5.82525 "$n4 setdest 2141.32000 272.24800 100 " 
$ns at 6.25 "$n4 setdest 2498.94000 186.12500 100 " 
$ns at 6.28073 "$n4 setdest 2524.81000 179.89400 100 " 
$ns at 6.5 "$n4 setdest 3032.37000 196.29700 100 " 
$ns at 6.6918 "$n4 setdest 3476.36000 210.64500 100 " 
$ns at 7.01912 "$n4 setdest 3020.47000 299.64900 100 " 
$ns at 7.30721 "$n4 setdest 3970.35000 268.38500 100 " 
$ns at 7.5 "$n4 setdest 4199.65000 313.1500 100 " 
$ns at 7.69053 "$n4 setdest 4426.26000 357.38800 100 " 
$ns at 7.94786 "$n4 setdest 3461.36000 383.64900 100 " 
$ns at 8.4021 "$n4 setdest 3636.55000 482.10300 100 " 
$ns at 8.5 "$n4 setdest 3516.47000 500.29400 100 " 
$ns at 8.85124 "$n4 setdest 3085.66000 565.56100 100 " 
$ns at 9 "$n4 setdest 2974.64000 535.13600 100 " 
$ns at 9.25 "$n4 setdest 2788.06000 484.00600 100 " 
$ns at 9.31057 "$n4 setdest 2742.86000 471.6200 100 " 
$ns at 9.5 "$n4 setdest 3054.69000 523.3300 100 " 
$ns at 9.62428 "$n4 setdest 3259.26000 557.25400 100 "

#NODE 4 is done

$ns at 0.350268 "$n5 setdest 954.609000 29.786100 100 " 
$ns at 0.780367 "$n5 setdest 124.351000 85.52400 100 " 
$ns at 1 "$n5 setdest 25.3969000 134.14100 100 " 
$ns at 1.05637 "$n5 setdest  0.5 146.61900 100 " 
$ns at 1.22305 "$n5 setdest 75.0956000 183.51500 100 " 
$ns at 1.69238 "$n5 setdest 1031.68000 154.37100 100 " 
$ns at 1.96616 "$n5 setdest 2031.37000 156.86700 100 " 
$ns at 2.25 "$n5 setdest 2214.11000 81.951800 100 " 
$ns at 2.33425 "$n5 setdest 2268.35000 59.715400 100 " 
$ns at 2.75 "$n5 setdest 3099.85000 93.541800 100 " 
$ns at 2.79739 "$n5 setdest 3194.64000 97.397900 100 " 
$ns at 3 "$n5 setdest 3705.85000 117.78400 100 " 
$ns at 3.16552 "$n5 setdest 4123.5000 134.4400 100 " 
$ns at 3.48403 "$n5 setdest 4424.75000 39.085200 100 " 
$ns at 3.74805 "$n5 setdest 3425.9000 34.300900 100 " 
$ns at 3.96302 "$n5 setdest 2719.95000  0.5 100 " 
$ns at 4 "$n5 setdest 2598.5000 5.9012400 100 " 
$ns at 4.02194 "$n5 setdest 2526.45000 9.4020300 100 " 
$ns at 4.28241 "$n5 setdest 1963.17000 92.028900 100 " 
$ns at 4.5 "$n5 setdest 2581.54000 120.29900 100 " 
$ns at 4.60243 "$n5 setdest 2872.64000 133.60700 100 " 
$ns at 5 "$n5 setdest 1894.5000 130.6100 100 " 
$ns at 5.0087 "$n5 setdest 1873.11000 130.54400 100 " 
$ns at 5.25 "$n5 setdest 2069.19000 83.556500 100 " 
$ns at 5.48263 "$n5 setdest 2258.23000 38.257800 100 " 
$ns at 5.75 "$n5 setdest 2366.41000 132.57900 100 " 
$ns at 5.76425 "$n5 setdest 2372.17000 137.60600 100 " 
$ns at 6.24124 "$n5 setdest 1704.32000 212.03600 100 " 
$ns at 6.5 "$n5 setdest 738.326000 231.4500 100 " 
$ns at 6.50386 "$n5 setdest 723.924000 231.7400 100 " 
$ns at 6.75 "$n5 setdest 663.416000 305.33300 100 " 
$ns at 6.8372 "$n5 setdest 641.981000 331.40400 100 " 
$ns at 7 "$n5 setdest 1044.96000 298.09300 100 " 
$ns at 7.14859 "$n5 setdest 1412.75000 267.69200 100 " 
$ns at 7.47306 "$n5 setdest 565.483000 320.80900 100 " 
$ns at 7.68645 "$n5 setdest  0.5 306.28300 100 " 
$ns at 7.75 "$n5 setdest 168.405000 301.95700 100 " 
$ns at 7.83855 "$n5 setdest 403.071000 295.92900 100 " 
$ns at 8.1352 "$n5 setdest 832.547000 205.62100 100 " 
$ns at 8.40606 "$n5 setdest 810.828000 305.59800 100 " 
$ns at 8.5 "$n5 setdest 522.269000 291.63600 100 " 
$ns at 8.67002 "$n5 setdest  0.5 266.36500 100 " 
$ns at 8.69911 "$n5 setdest 89.3314000 262.04200 100 " 
$ns at 8.75485 "$n5 setdest  0.5 270.69700 100 " 
$ns at 9 "$n5 setdest 392.849000 308.76100 100 " 
$ns at 9.14727 "$n5 setdest 628.854000 331.62700 100 " 
$ns at 9.44849 "$n5 setdest 1355.26000 400.35300 100 " 
$ns at 9.88185 "$n5 setdest 1991.67000 477.48800 100 "

#NODE 5 is done

$ns at 0.356108 "$n6 setdest 998.508000 5.4604400 100 " 
$ns at 0.5 "$n6 setdest 983.29 43.6525 100 " 
$ns at 0.695258 "$n6 setdest 1434.03000 95.478200 100 " 
$ns at 0.963869 "$n6 setdest 1853.61000 4.7063900 100 " 
$ns at 0.984209 "$n6 setdest 1845.09000  0.5 100 " 
$ns at 1 "$n6 setdest 1838.47000 3.6538100 100 " 
$ns at 1.38912 "$n6 setdest 1675.43000 93.693200 100 " 
$ns at 1.75 "$n6 setdest 2522.52000 108.68700 100 " 
$ns at 1.80862 "$n6 setdest 2660.12000 111.12300 100 " 
$ns at 2 "$n6 setdest 2336.49000 69.566700 100 " 
$ns at 2.17196 "$n6 setdest 2045.69000 32.22600 100 " 
$ns at 2.34216 "$n6 setdest 2405.16000  0.5 100 " 
$ns at 2.5 "$n6 setdest 2738.53000 29.886100 100 " 
$ns at 2.5245 "$n6 setdest 2790.28000 34.525800 100 " 
$ns at 2.75 "$n6 setdest 3366.07000 47.871500 100 " 
$ns at 2.90602 "$n6 setdest 3764.46000 57.105600 100 " 
$ns at 3.13617 "$n6 setdest 3808.68000  0.5 100 " 
$ns at 3.25 "$n6 setdest 3830.56000 28.245100 100 " 
$ns at 3.30783 "$n6 setdest 3841.67000 42.595600 100 " 
$ns at 3.42488 "$n6 setdest 3853.01000  0.5 100 " 
$ns at 3.5 "$n6 setdest 3860.28000 27.337200 100 " 
$ns at 3.58252 "$n6 setdest 3868.27000 57.368800 100 " 
$ns at 3.75 "$n6 setdest 4245.37000 37.592500 100 " 
$ns at 3.97584 "$n6 setdest 4753.87000 10.924800 100 " 
$ns at 4.03242 "$n6 setdest 4807.99000  0.5 100 " 
$ns at 4.25 "$n6 setdest 5016.13000 42.012400 100 " 
$ns at 4.43991 "$n6 setdest 5197.79000 78.681600 100 " 
$ns at 4.75 "$n6 setdest 4310.73000 85.181500 100 " 
$ns at 4.78855 "$n6 setdest 4200.46000 85.989500 100 " 
$ns at 5 "$n6 setdest 3574.21000 99.818500 100 " 
$ns at 5.11825 "$n6 setdest 3223.99000 107.55200 100 " 
$ns at 5.25 "$n6 setdest 2979.61000 80.83800 100 " 
$ns at 5.48214 "$n6 setdest 2549.02000 33.767400 100 " 
$ns at 5.60047 "$n6 setdest 2601.47000  0.5 100 " 
$ns at 5.75 "$n6 setdest 2667.76000 42.67200 100 " 
$ns at 5.82841 "$n6 setdest 2702.52000 65.047400 100 " 
$ns at 6.21733 "$n6 setdest 2073.29000 142.7700 100 " 
$ns at 6.25 "$n6 setdest 1943.93000 141.43400 100 " 
$ns at 6.46857 "$n6 setdest 1078.58000 132.50200 100 " 
$ns at 6.5 "$n6 setdest 963.382000 136.75900 100 " 
$ns at 6.72452 "$n6 setdest 140.584000 167.16700 100 " 
$ns at 7.19569 "$n6 setdest 1137.67000 174.79500 100 " 
$ns at 7.5 "$n6 setdest 1004.15000 79.972900 100 " 
$ns at 7.51348 "$n6 setdest 998.237000 75.772100 100 " 
$ns at 7.75 "$n6 setdest 1670.47000 138.43100 100 " 
$ns at 7.77085 "$n6 setdest 1729.74000 143.95600 100 " 
$ns at 8.24774 "$n6 setdest 772.344000 172.83400 100 " 
$ns at 8.5 "$n6 setdest 1200.06000 200.22200 100 " 
$ns at 8.74442 "$n6 setdest 1614.49000 226.75900 100 " 
$ns at 8.99747 "$n6 setdest 660.266000 196.8500 100 " 
$ns at 9.34423 "$n6 setdest 1097.95000 106.93700 100 " 
$ns at 9.5 "$n6 setdest 782.637000 54.681900 100 " 
$ns at 9.59946 "$n6 setdest 581.308000 21.316400 100 " 
$ns at 9.75 "$n6 setdest 1064.93000 15.369400 100 " 
$ns at 9.90841 "$n6 setdest 1573.83000 9.1115700 100 "

#NODE 6 is done

$ns at 0.459733 "$n7 setdest 724.753000 68.900700 100 " 
$ns at 0.75 "$n7 setdest 1533.74000 10.592800 100 " 
$ns at 0.75081 "$n7 setdest 1536.000 10.430200 100 " 
$ns at 1.08909 "$n7 setdest 1371.53000 109.06800 100 " 
$ns at 1.25 "$n7 setdest 1119.89000 88.285500 100 " 
$ns at 1.5 "$n7 setdest 728.911000 55.995100 100 " 
$ns at 1.58211 "$n7 setdest 600.492000 45.389100 100 " 
$ns at 1.75 "$n7 setdest 1175.32000 49.500500 100 " 
$ns at 1.87343 "$n7 setdest 1597.94000 52.523300 100 " 
$ns at 2.2161 "$n7 setdest 811.52000  0.5 100 " 
$ns at 2.23577 "$n7 setdest 766.358000 3.0161800 100 " 
$ns at 2.30906 "$n7 setdest 1026.4000  0.5 100 " 
$ns at 2.5 "$n7 setdest 1703.95000 7.8588800 100 " 
$ns at 2.51571 "$n7 setdest 1759.7000 8.505500 100 " 
$ns at 2.93235 "$n7 setdest 1465.82000 104.0900 100 " 
$ns at 3 "$n7 setdest 1502.6000 87.220300 100 " 
$ns at 3.32416 "$n7 setdest 1678.86000 6.3854900 100 " 
$ns at 3.75 "$n7 setdest 824.836000 45.365900 100 " 
$ns at 3.77777 "$n7 setdest 769.144000 47.907900 100 " 
$ns at 4 "$n7 setdest 1060.33000 8.880900 100 " 
$ns at 4.05057 "$n7 setdest 1126.59000  0.5 100 " 
$ns at 4.23416 "$n7 setdest 1367.14000 32.241500 100 " 
$ns at 4.37224 "$n7 setdest 1271.93000  0.5 100 " 
$ns at 4.5 "$n7 setdest 1183.83000 29.830600 100 " 
$ns at 4.6449 "$n7 setdest 1083.92000 63.663700 100 " 
$ns at 4.75 "$n7 setdest 806.105000 81.306900 100 " 
$ns at 4.96426 "$n7 setdest 239.764000 117.27300 100 " 
$ns at 5.02984 "$n7 setdest  0.5 116.18100 100 " 
$ns at 5.23751 "$n7 setdest 759.197000 112.7200 100 " 
$ns at 5.49638 "$n7 setdest 855.562000 212.25500 100 " 
$ns at 5.78508 "$n7 setdest  0.5 216.77600 100 " 
$ns at 5.83335 "$n7 setdest 143.043000 217.53200 100 " 
$ns at 5.87906 "$n7 setdest  0.5 227.42800 100 " 
$ns at 6 "$n7 setdest 378.493000 253.61300 100 " 
$ns at 6.09613 "$n7 setdest 679.338000 274.42600 100 " 
$ns at 6.25 "$n7 setdest 1085.18000 252.31400 100 " 
$ns at 6.42906 "$n7 setdest 1557.46000 226.58300 100 " 
$ns at 6.75 "$n7 setdest 2317.39000 291.28200 100 " 
$ns at 6.75063 "$n7 setdest 2318.88000 291.40900 100 " 
$ns at 7.24012 "$n7 setdest 2706.27000 199.21700 100 " 
$ns at 7.5 "$n7 setdest 3179.33000 165.63400 100 " 
$ns at 7.68808 "$n7 setdest 3521.68000 141.32900 100 " 
$ns at 8 "$n7 setdest 3665.72000 206.15500 100 " 
$ns at 8.15779 "$n7 setdest 3738.59000 238.94800 100 " 
$ns at 8.25 "$n7 setdest 4100.83000 240.8200 100 " 
$ns at 8.41201 "$n7 setdest 4737.26000 244.10700 100 " 
$ns at 8.7303 "$n7 setdest 4533.44000 342.00800 100 " 
$ns at 9 "$n7 setdest 4982.13000 294.27400 100 " 
$ns at 9.14199 "$n7 setdest 5218.34000 269.14500 100 " 
$ns at 9.25 "$n7 setdest 5308.09000 309.3400 100 " 
$ns at 9.40425 "$n7 setdest 5436.25000 366.74200 100 " 
$ns at 9.68658 "$n7 setdest 4631.68000 307.35600 100 "

#NODE 7 is done

$ns at 0.377875 "$n8 setdest 981.266000 19.265700 100 " 
$ns at 0.5 "$n8 setdest 1379.44000 42.784500 100 " 
$ns at 0.64196 "$n8 setdest 1842.28000 70.123300 100 " 
$ns at 0.75 "$n8 setdest 2117.74000 76.393900 100 " 
$ns at 1.0244 "$n8 setdest 2817.34000 92.319900 100 " 
$ns at 1.35912 "$n8 setdest 2779.18000  0.5 100 " 
$ns at 1.38666 "$n8 setdest 2776.04000 7.5945900 100 " 
$ns at 1.5 "$n8 setdest 3208.67000 18.986400 100 " 
$ns at 1.64 "$n8 setdest 3743.07000 33.058100 100 " 
$ns at 1.76561 "$n8 setdest 3467.18000  0.5 100 " 
$ns at 1.93171 "$n8 setdest 3102.33000 43.717500 100 " 
$ns at 2.25 "$n8 setdest 3734.14000 107.61500 100 " 
$ns at 2.28592 "$n8 setdest 3805.44000 114.82600 100 " 
$ns at 2.78417 "$n8 setdest 3382.19000 205.42700 100 " 
$ns at 3 "$n8 setdest 3814.2000 192.17900 100 " 
$ns at 3.25 "$n8 setdest 4314.59000 176.83300 100 " 
$ns at 3.26182 "$n8 setdest 4338.25000 176.10800 100 " 
$ns at 3.5 "$n8 setdest 3921.18000 114.92300 100 " 
$ns at 3.58348 "$n8 setdest 3775.000 93.478700 100 " 
$ns at 3.75 "$n8 setdest 4169.72000 47.562900 100 " 
$ns at 3.85849 "$n8 setdest 4426.89000 17.647300 100 " 
$ns at 4.35683 "$n8 setdest 4067.68000 110.97300 100 " 
$ns at 4.5 "$n8 setdest 3992.33000 141.96800 100 " 
$ns at 4.80567 "$n8 setdest 3831.45000 208.14300 100 " 
$ns at 5 "$n8 setdest 4495.5000 217.18300 100 " 
$ns at 5.09564 "$n8 setdest 4822.31000 221.63300 100 " 
$ns at 5.25 "$n8 setdest 4282.91000 191.60700 100 " 
$ns at 5.34568 "$n8 setdest 3948.56000 172.99600 100 " 
$ns at 5.5 "$n8 setdest 3770.28000 219.98500 100 " 
$ns at 5.65274 "$n8 setdest 3593.82000 266.49200 100 " 
$ns at 6 "$n8 setdest 3662.62000 341.93700 100 " 
$ns at 6.11112 "$n8 setdest 3684.63000 366.07900 100 " 
$ns at 6.25 "$n8 setdest 3414.59000 408.5800 100 " 
$ns at 6.38693 "$n8 setdest 3148.34000 450.48200 100 " 
$ns at 6.75 "$n8 setdest 4019.26000 434.44300 100 " 
$ns at 6.79692 "$n8 setdest 4131.8000 432.37100 100 " 
$ns at 7 "$n8 setdest 4341.83000 362.19400 100 " 
$ns at 7.07416 "$n8 setdest 4418.52000 336.56900 100 " 
$ns at 7.25 "$n8 setdest 4495.16000 296.21500 100 " 
$ns at 7.50225 "$n8 setdest 4605.09000 238.32500 100 " 
$ns at 7.75 "$n8 setdest 4952.41000 311.64600 100 " 
$ns at 7.80762 "$n8 setdest 5033.19000 328.69800 100 " 
$ns at 8 "$n8 setdest 4864.24000 396.01600 100 " 
$ns at 8.08481 "$n8 setdest 4789.77000 425.69100 100 " 
$ns at 8.25 "$n8 setdest 5022.13000 399.76200 100 " 
$ns at 8.55928 "$n8 setdest 5457.15000 351.21900 100 " 
$ns at 8.98912 "$n8 setdest 5297.89000 252.49500 100 " 
$ns at 9.25 "$n8 setdest 5739.41000 170.11700 100 " 
$ns at 9.26824 "$n8 setdest 5770.28000 164.35600 100 " 
$ns at 9.5 "$n8 setdest 6544.8000 196.49100 100 " 
$ns at 9.54463 "$n8 setdest 6693.94000 202.67900 100 " 
$ns at 9.81222 "$n8 setdest 5831.21000 253.24600 100 "

#NODE 8 is done

$ns at 0.306163 "$n9 setdest 470.084000 88.262200 100 " 
$ns at 0.484861 "$n9 setdest  0.5 116.33400 100 " 
$ns at 0.5 "$n9 setdest 39.8241000 118.71200 100 " 
$ns at 0.632538 "$n9 setdest 388.479000 139.53300 100 " 
$ns at 0.767433 "$n9 setdest  0.5 116.05600 100 " 
$ns at 0.929726 "$n9 setdest 467.377000 87.811600 100 " 
$ns at 1.08382 "$n9 setdest  0.5 63.604800 100 " 
$ns at 1.22248 "$n9 setdest 420.59000 41.821300 100 " 
$ns at 1.5 "$n9 setdest 1295.8000 42.203500 100 " 
$ns at 1.53956 "$n9 setdest 1420.58000 42.25800 100 " 
$ns at 2 "$n9 setdest 1567.86000 133.4800 100 " 
$ns at 2.03785 "$n9 setdest 1579.96000 140.9800 100 " 
$ns at 2.46451 "$n9 setdest 785.702000 201.73700 100 " 
$ns at 2.5 "$n9 setdest 850.04000 195.65500 100 " 
$ns at 2.75 "$n9 setdest 1303.22000 152.81300 100 " 
$ns at 2.86538 "$n9 setdest 1512.38000 133.0400 100 " 
$ns at 3.19298 "$n9 setdest 2477.79000 159.11600 100 " 
$ns at 3.5 "$n9 setdest 1730.79000 215.34600 100 " 
$ns at 3.52135 "$n9 setdest 1678.84000 219.25600 100 " 
$ns at 3.94071 "$n9 setdest 974.137000 290.20700 100 " 
$ns at 4.19398 "$n9 setdest 2.60952000 266.51400 100 " 
$ns at 4.19646 "$n9 setdest  0.5 267.36200 100 " 
$ns at 4.25 "$n9 setdest 56.2847000 285.64600 100 " 
$ns at 4.47384 "$n9 setdest 291.615000 362.08800 100 " 
$ns at 4.75 "$n9 setdest 833.163000 412.65400 100 " 
$ns at 4.84657 "$n9 setdest 1022.52000 430.33500 100 " 
$ns at 5 "$n9 setdest 573.967000 400.71300 100 " 
$ns at 5.132 "$n9 setdest 188.061000 375.22900 100 " 
$ns at 5.19084 "$n9 setdest  0.5 387.10400 100 " 
$ns at 5.25 "$n9 setdest 189.072000 399.04300 100 " 
$ns at 5.39655 "$n9 setdest 657.48000 428.6200 100 " 
$ns at 5.75 "$n9 setdest 1440.22000 374.7800 100 " 
$ns at 5.76859 "$n9 setdest 1481.39000 371.94800 100 " 
$ns at 6 "$n9 setdest 610.033000 363.3300 100 " 
$ns at 6.03288 "$n9 setdest 486.244000 362.10600 100 " 
$ns at 6.25 "$n9 setdest 1312.7000 346.05800 100 " 
$ns at 6.29078 "$n9 setdest 1467.91000 343.04500 100 " 
$ns at 6.5 "$n9 setdest 2044.76000 381.73100 100 " 
$ns at 6.59201 "$n9 setdest 2298.43000 398.74400 100 " 
$ns at 6.75 "$n9 setdest 1898.33000 412.09100 100 " 
$ns at 6.9666 "$n9 setdest 1349.83000 430.3900 100 " 
$ns at 7.21794 "$n9 setdest 2234.92000 476.93300 100 " 
$ns at 7.5 "$n9 setdest 1990.94000 536.37400 100 " 
$ns at 7.65691 "$n9 setdest 1855.21000 569.44300 100 " 
$ns at 7.96343 "$n9 setdest 1218.48000 492.33400 100 " 
$ns at 8.2227 "$n9 setdest 679.65000 408.09300 100 " 
$ns at 8.5 "$n9 setdest 550.146000 353.83100 100 " 
$ns at 8.71978 "$n9 setdest 447.505000 310.82500 100 " 
$ns at 8.99454 "$n9 setdest 705.157000 407.44800 100 " 
$ns at 9.4195 "$n9 setdest  0.5 344.71700 100 " 
$ns at 9.4448 "$n9 setdest 41.9864000 340.98200 100 " 
$ns at 9.47454 "$n9 setdest  0.5 335.44900 100 " 
$ns at 9.5 "$n9 setdest 35.9411000 330.71200 100 " 
$ns at 9.75 "$n9 setdest 388.9000 284.19700 100 " 
$ns at 9.87295 "$n9 setdest 562.491000 261.3200 100 " 
#last done

#===================================
#        Agents Definition        
#===================================
#Setup a TCP connection
set tcp0 [new Agent/TCP]
$ns attach-agent $n0 $tcp0
set sink1 [new Agent/TCPSink]
$ns attach-agent $n9 $sink1
$ns connect $tcp0 $sink1
$tcp0 set packetSize_ 1024


#===================================
#        Applications Definition        
#===================================
#Setup a FTP Application over TCP connection
set ftp0 [new Application/FTP]
$ftp0 attach-agent $tcp0
$ns at 0.0 "$ftp0 start"
$ns at 10.0 "$ftp0 stop"


#===================================
#        Termination        
#===================================
#Define a 'finish' procedure
proc finish {} {
    global ns tracefile namfile
    $ns flush-trace
    close $tracefile
    close $namfile
    exec nam wireless2.nam &
    exit 0
}
for {set i 0} {$i < $val(nn) } { incr i } {
    $ns at $val(stop) "\$n$i reset"
}
$ns at $val(stop) "$ns nam-end-wireless $val(stop)"
$ns at $val(stop) "finish"
$ns at $val(stop) "puts \"done\" ; $ns halt"
$ns run
