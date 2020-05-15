https://github.com/OWASP/owasp-mstg/tree/master/Crackmes

https://github.com/OWASP/owasp-mstg/blob/master/Document/0x05c-Reverse-Engineering-and-Tampering.md#debugging-with-jdb

Debugging with jdb

The adb command line tool was introduced in the "Android Basic Security Testing" chapter. 
You can use its adb jdwp command to list the process IDs of all debuggable processes running on the connected device 
(i.e., processes hosting a JDWP transport). 
With the adb forward command, you can open a listening socket on your host machine 
and forward this socket's incoming TCP connections to the JDWP transport of a chosen process.


List debuggable processes:
```
adb jdwp
```
12167

for adb shell ps -ef | grep dgm:

u0_a57        9639  3238 2 12:28:01 ?     00:00:00 com.dgm.smart:monitor
shell         9750  9584 1 12:28:34 pts/2 00:00:00 grep dgm
u0_a57       28838  3238 1 15:16:28 ?     00:09:50 com.dgm.smart
u0_a57       28937  3238 0 15:16:33 ?     00:03:49 com.dgm.smart:DotDogWorker


adb jdwp  (all dbg apps debbugable!)
9639
28838
28937

adb forward tcp:7777 jdwp:9639

You're now ready to attach jdb. Attaching the debugger, however, causes the app to resume, which you don't want. You want to keep it suspended so that you can explore first. To prevent the process from resuming, pipe the suspend command into jdb:

$ { echo "suspend"; cat; } | jdb -attach localhost:7777
Initializing jdb ...
> All threads suspended.