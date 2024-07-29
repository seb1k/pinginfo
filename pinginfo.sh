#!/bin/bash


# /etc/systemd/system/pinginfo.service
# systemctl enable pinginfo


date=$(date "+%d/%m %H:%M")
echo $date Started! >> /root/pingtest.txt

pinginfo=1
oldpinginfo=1

# wait 30 secs for network
sleep 30

while true
do
	pingCmd=$(ping 8.8.8.8 -c 1)

	if [[ $pingCmd == *" 0%"* ]]; then
			pinginfo=1
		else 
			pinginfo=0
	fi


	if [[ $oldpinginfo != $pinginfo ]]; then

		
		day_now=$(date +%Y%m%d)
		


		if [[ "$pinginfo" -eq 0 ]]; then
			echo -n "$(date "+%d/%m %H:%M") " >> /root/pingtest.txt
			#day_no_internet=$daysince1970
			day_no_internet=$day_now
		else 
			let day_without_internet=($(date +%s -d $day_now)-$(date +%s -d $day_no_internet))/86400
			#day_without_internet=`expr $daysince1970 - $day_no_internet`
			hour=$(date "+%H:%M")

			if [[ "$day_without_internet" -eq 0 ]]; then
				echo \> $hour PingDown >> /root/pingtest.txt
			else 
				echo \> $hour \(+$day_without_internet\) PingDown >> /root/pingtest.txt
			fi
		fi
		
		oldpinginfo=$pinginfo
	fi


	sleep 60
done



