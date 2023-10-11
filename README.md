# WiFi_Fix
A Windows cmd script that helps to fix latency spikes with certain Wi-Fi adapters

## Why do you need it
Windows performs WiFi networks scan every ~3-4 seconds and it takes ~2-3 seconds (I didn't measure these intervals)
Some WiFi adapters (for example my ASUS PCE-AXE59BT with its crappy Mediatek chip) have an issue when these WiFi scans performed by Windows causing high latency spikes
You can check those spikes in different ping/latency tests. I used next tools:
- https://packetlosstest.com/ (can capture results in a nice chart and has flexible settings)
- playing CS2 with `cq_netgraph 1` command, it has a nice visual representation during the game, but you will see a lost of lost packets, because in any real-time online game big latency means lost packets.

## How latency spikes look like
On https://packetlosstest.com/ select `Call of Duty: Warzone` preset, increase `Acceptable delay` up to 500 ms (this test has really high ping even with close servers), increase `Duration` to 60 seconds. uou can also increase Frequency for test. For example some applications like Zoom requires way more then 60 pings/sec

If you see this pattern, it means you have systematic latency spikes and this Windows task scheduler script probably can fix them:
![latency_spikes](https://github.com/Zankomag/WiFi_Fix/assets/27448371/647748d3-8306-4aac-af86-4629921ba303)

If you see this pattern, it means you don't have any issues
![regular_ping](https://github.com/Zankomag/WiFi_Fix/assets/27448371/b2bffb02-b352-4710-acd1-c59a6191ef29)
(These two letancy tests were taken at the same time with my WiFi adapter and my phone)

You definitelly need to check this with several different ping/latency tests and also try a different WiFi adapter to make sure the issue is with the adapter itself

## How to fix the issue with the script
The script enables WiFi scan, then waits 3 minutes, then disables it. Disabling WiFi prevent scan spikes to happen, so your latency will be smooth. I added this script in Windows Task Scheduler to ran at startup. The task must run with highest priviliges, because script commands requires Administrator rights. You can also try to import my Task Scheduler Task (`fix_wifi_scan_task.xml`)
Sometimes the Windows Task just does not work at startup and I find out that I'm not connected to WiFi after several minutes since Windows startup. In this case I open Windows Task Scheduler, find this task and run it manually.
