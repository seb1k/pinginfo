# pinginfo
Shell script that writes to a file when a server loses internet

Write in /root/pingtest.txt each time the server is started or loses internet (ping on 8.8.8.8 every minute)

Example : (/root/pingtext.txt)

```
18/05 19:22 > 19:23 PingDown
18/05 19:33 > 19:34 PingDown
27/05 18:53 > 18:56 PingDown
04/06 10:30 Started!
12/06 00:34 Started!
17/06 03:52 > 03:55 PingDown
28/06 02:08 > 02:12 PingDown
01/07 13:49 Started!
03/07 02:31 > 02:34 PingDown
13/07 10:27 > 10:30 PingDown
```

### Install :

Create /root/pinginfo.sh

Create a service and enable it :


/etc/systemd/system/pinginfo.service

```
[Unit]
Description=hit service
After=network.target

[Service]
Type=simple
ExecStart=/root/pinginfo.sh

[Install]
WantedBy=multi-user.target
```
```
systemctl enable pinginfo
```
