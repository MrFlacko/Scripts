docker network create
-d macvlan
--subnet 192.168.1.0/24
--gateway 192.168.1.1
-o parent=eth0 mv_eth0

docker run
-d
--hostname {YOUR HOSTNAME}
--memory {MEMORY}
--memory-swap {SWAP MEMORY}
--ip {IP ADDRESS}
--network mv_eth0
--restart unless-stopped
-v 3cx_backup:/mnt/backup
-v 3cx_recordings:/mnt/recordings
-v 3cx_log:/var/log
-v /sys/fs/cgroup:/sys/fs/cgroup:ro
--cap-add SYS_ADMIN
--cap-add NET_ADMIN
--name 3cx
farfui/3cx:18.0.2.314

#/usr/share/zoneinfo
docker exec 3cx timedatectl set-timezone {YOUR ZONE INFO}

docker exec -ti 3cx /usr/sbin/3CXWizard --cleanup
