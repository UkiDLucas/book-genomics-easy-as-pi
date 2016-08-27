## OS image installation

[TOC]



### Download newest OS

http://www.armbian.com/orange-pi-one/

### Unmount SD card

Insert a new SD card, class 10, 8 to 16GB in size should be enough.

Figure out what is the name **/dev/disk*** of your CD card (in the reader):

```shell
> OrangePI $ diskutil list
...
/dev/disk3 (internal, physical):
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:     FDisk_partition_scheme                        *15.9 GB    disk3
   1:                 DOS_FAT_32 ORANGEPIONE             15.9 GB    disk3s1
```

The name of the SD card is **/dev/disk3**

Unmount the SD card (do not remove it), before putting an image on it:

```shell
> OrangePI $ diskutil unmountDisk /dev/disk3
Unmount of all volumes on disk3 was successful
```



### Reformat SD card

Re-format the SD card as FAT32

```shell
$ sudo diskutil eraseDisk FAT32 PI005 MBRFormat /dev/disk3
Started erase on disk3
Unmounting disk
Creating the partition map
Waiting for the disks to reappear
Formatting disk3s1 as MS-DOS (FAT32) with name PI005
512 bytes per physical sector
/dev/rdisk3s1: 31077712 sectors in 1942357 FAT32 clusters (8192 bytes/cluster)
bps=512 spc=16 res=32 nft=2 mid=0xf8 spt=32 hds=255 hid=8192 drv=0x80 bsec=31108096 bspf=15175 rdcl=2 infs=1 bkbs=6
Mounting disk
Finished erase on disk3

```



### Intall Image on SD card

Install the *.raw image on the SD card:

```shell
> OrangePI $ sudo dd bs=1m of=/dev/disk3 if=Armbian_5.14_Orangepione_Debian_jessie_3.4.112.raw
Password:
1498+0 records in
1498+0 records out
1570766848 bytes transferred in 989.683281 secs (1587141 bytes/sec)
```

Wait patiently for a very long time.



Check SD card size

If you had the original image size made for e.g. 16GB SD card and you are using 32 GB card, it may show that you are using only 16GB (or less)

```shell
root@orangepione:~# df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/mmcblk0p1   15G  2.2G   13G  16% /
udev             10M     0   10M   0% /dev
tmpfs           201M  4.5M  196M   3% /run
tmpfs           501M     0  501M   0% /dev/shm
tmpfs           5.0M  4.0K  5.0M   1% /run/lock
tmpfs           501M     0  501M   0% /sys/fs/cgroup
tmpfs           501M   36K  501M   1% /tmp
tmpfs           101M     0  101M   0% /run/user/0
root@orangepione:~# sudo fdisk -uc /dev/mmcblk0

Welcome to fdisk (util-linux 2.25.2).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.


Command (m for help): p
Disk /dev/mmcblk0: 29.7 GiB, 31914983424 bytes, 62333952 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x5faa38c0

Device         Boot Start      End  Sectors  Size Id Type
/dev/mmcblk0p1       2048 30805119 30803072 14.7G 83 Linux
```



In the code above you can see that I have 32GB card (/dev/mmcblk0: 29.7 GiB),

but only 14.7GB Linux partition (/dev/mmcblk0p1       2048 30805119 30803072 14.7G 83 Linux)

- Next we will Delete (d) our 15G partition
- Create New (n) partition 
- Selecte Primary (p) partition to be recreted
- Select first sector which should be EXACTLY SAME sector original deleted partition was starting with
- Select last partition (nothing for default end of the disk)
- Write (w) changes



```shell
root@orangepione:~# sudo fdisk -uc /dev/mmcblk0

Welcome to fdisk (util-linux 2.25.2).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.


Command (m for help): p
Disk /dev/mmcblk0: 29.7 GiB, 31914983424 bytes, 62333952 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x5faa38c0

Device         Boot Start      End  Sectors  Size Id Type
/dev/mmcblk0p1       2048 30805119 30803072 14.7G 83 Linux

# Detele (d) original partition 

Command (m for help): d
Selected partition 1
Partition 1 has been deleted.

# Create New (n) partition

Command (m for help): n
Partition type
   p   primary (0 primary, 0 extended, 4 free)
   e   extended (container for logical partitions)
   
# Select Primary (p) partition

Select (default p): p
Partition number (1-4, default 1): 1
First sector (2048-62333951, default 2048): 2048
Last sector, +sectors or +size{K,M,G,T,P} (2048-62333951, default 62333951): 

Created a new partition 1 of type 'Linux' and of size 29.7 GiB.

# Save / Write (w) changes

Command (m for help): w
The partition table has been altered.
Calling ioctl() to re-read partition table.
Re-reading the partition table failed.: Device or resource busy

The kernel still uses the old table. The new table will be used at the next reboot or after you run partprobe(8) or kpartx(8).

# restart the computer

root@orangepione:~# shutdown -r now
```



### Boot up your OrangePi One

Turn off the PI power.

Insert the SD card

Connect the HDMI monitor

Connect USB keyboard (single USB port in this PI)

Power up

Wait 

```shell
orangepione login: root
Password: 1234
Changing password...
```



### Login in remotely with SSH





```shell
$ ssh root@192.168.1.86
     _      _     _             
  __| | ___| |__ (_) __ _ _ __  
 / _` |/ _ \ '_ \| |/ _` | '_ \ 
| (_| |  __/ |_) | | (_| | | | |
 \__,_|\___|_.__/|_|\__,_|_| |_|
                                

Welcome to ARMBIAN Debian GNU/Linux 8 (jessie) 3.4.112-sun8i 

System load:   0.06            	Up time:       2 min		
Memory usage:  9 % of 494Mb  	IP:            192.168.1.86 
CPU temp:      50°C           	
Usage of /:    9% of 15G    	

Last login: Thu Aug 18 00:57:11 2016

Thank you for choosing Armbian! Support: www.armbian.com

Creating new account. Please provide a username (eg. your forename): Uki ...

follow the steps...
```



### Resize file system

```
orangepi@OrangePI:~$ sudo fs_resize
[sudo] password for orangepi: 

Disk /dev/mmcblk0: 29.7 GiB, 31914983424 bytes, 62333952 sectors
/dev/mmcblk0p1       40960  172031  131072   64M  b W95 FAT32
/dev/mmcblk0p2      172032 4790272 4618241  2.2G 83 Linux

  Max block: 62332928
   Part end: 4790272
 Part start: 172032

WARNING: Do you want to resize "/dev/mmcblk0p2" (y/N)?  y
PARTITION RESIZED.
*********************************************
Rootfs Extended. Please REBOOT to take effect
*********************************************
```



### changing compute'r hostname



```shell
# Mac
> spark $ sudo scutil --set HostName uki

# Debian 
vi /etc/hostname


192.168.1.84    spark_master
127.0.0.1       localhost pi85
...

press ESC : wq
reboot

```



Adjusting Hosts file

```
root@pi85:~/spark# vi  /etc/hosts

```



Adjusting TimeZone

```shell
$ dpkg-reconfigure tzdata
```



### Setting shell prompt

```shell

spark $ vi ~/.bash_profile

export PS1="\u@\h $(ifconfig | grep 192.168.1 | cut -d: -f2 | awk '{ print $1}') \A \W $ "


ESC : wq

# Execute

root@pi002:~/spark# . ~/.bash_profile
root@pi002 192.168.1.88 21:29 spark $ 
```

## Software Tools Installation

### Install Java OpenJDK

```shell
root@orangepione:~# sudo apt-get install openjdk-8-jdk
Reading package lists... Done
Building dependency tree   
...

root@orangepione:~# java -version
openjdk version "1.8.0_91"
OpenJDK Runtime Environment (build 1.8.0_91-8u91-b14-1~bpo8+1-b14)
OpenJDK Zero VM (build 25.91-b14, interpreted mode)
```



### Install Anaconda & Python

```shell
root@orangepione:~# wget http://repo.continuum.io/archive/Anaconda2-4.1.1-Linux-x86.sh
root@orangepione:~# bash Anaconda2-4.1.1-Linux-x86.sh
root@orangepione:~# python3
Python 3.4.2 (default, Oct  8 2014, 14:38:51) 
[GCC 4.9.1] on linux
```



### Install Scala

```shell
$ wget http://www.scala-lang.org/files/archive/scala-2.10.4.tgz
$ sudo mkdir /usr/local/src/scala
$ sudo tar xvf scala-2.10.4.tgz -C /usr/local/src/scala/
vi .bashrc
export SCALA_HOME=/usr/local/src/scala/scala-2.10.4
export PATH=$SCALA_HOME/bin:$PATH

root@orangepione:~# vi .bashrc
root@orangepione:~# cat .bashrc 
# ~/.bashrc: executed by bash(1) for non-login shells.

# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.
# PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
# umask 022

# You may uncomment the following lines if you want `ls' to be colorized:
# export LS_OPTIONS='--color=auto'
# eval "`dircolors`"
# alias ls='ls $LS_OPTIONS'
# alias ll='ls $LS_OPTIONS -l'
# alias l='ls $LS_OPTIONS -lA'
#
# Some more alias to avoid making mistakes:
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'

export SCALA_HOME=/usr/local/src/scala/scala-2.10.4
export PATH=$SCALA_HOME/bin:$PATH

root@orangepione:~# . .bashrc 
root@orangepione:~#  scala -version
Scala code runner version 2.10.4 -- Copyright 2002-2013, LAMP/EPFL
```



#### Install GIT

```shell
root@orangepione:~#  sudo apt-get install git
Reading package lists... Done
Building dependency tree       
Reading state information... Done
git is already the newest version.

root@orangepione:~# git version
git version 2.1.4
```



### Apache Spark

#### Install Apache Spark

```shell
$  wget http://d3kbcqa49mib13.cloudfront.net/spark-2.0.0-bin-hadoop2.7.tgz
$ mkdir spark
$ mv spark-2.0.0-bin-hadoop2.7.tgz spark/
$ cd spark
$ root@orangepione:~/spark# tar xvf spark-2.0.0-bin-hadoop2.7.tgz


```

#### Running Apache Spark

```shell
root@orangepione:~/spark/spark-2.0.0-bin-hadoop2.7# ./sbin/start-master.sh
$ tail -F /root/spark/spark-2.0.0-bin-hadoop2.7/logs/spark-root-org.apache.spark.deploy.master.Master-1-orangepione.out

http://192.168.1.86:8080/
URL: spark://orangepione:7077
REST URL: spark://orangepione:6066 (cluster mode)
Alive Workers: 0
Cores in use: 0 Total, 0 Used
Memory in use: 0.0 B Total, 0.0 B Used
Applications: 0 Running, 0 Completed
Drivers: 0 Running, 0 Completed
Status: ALIVE
```



Running Spark Examples on single MacBookPro 2.9 Ghz Intel Core i5 



#### Running Spark Example on single OrangePi One 4 cores 1.2GHz

[bit.ly/SparkPi](Stock Overflow post)

OrangePi One SBC

CPU: 1.6GHz H3 Quad-core Cortex-A7 H.265/HEVC 4K
GPU: Mali400MP2 GPU @600MHz, Supports OpenGL ES 2.0
RAM: 512MB DDR3 (shared with GPU)
Armbian OS Debian GNU/Linux 8 (jessie) 3.4.112-sun8i


My observation is that on OrangePi, the **execution is SINGLE THREADED**. I was expecting 4 parallel tasks, one per core. Please see the data below. I will see what can be optimized for existing cores, or Mali GPU (~7 GigaFLOPS).

```shell


root@orangepione:~/spark/spark-2.0.0-bin-hadoop2.7# ./bin/run-example SparkPi 10

where 10 is number of distributed tasks/partitions/slices/threads

# executed as 1 task on a single 4 core board

took 19.0 s Pi is roughly 3.145951459514595
took 19.0 s Pi is roughly 3.1346713467134673

# executed as 2 tasks on a single 4 core board

took 19.3 s Pi is roughly 3.1420757103785517
took 19.4 s Pi is roughly 3.13639568197841

# executed as 4 tasks on a single 4 core board

took 21.2 s Pi is roughly 3.141427853569634
took 21.5 s Pi is roughly 3.1445478613696536

# executed as 10 tasks on a single 4 core board

took 40.8 s Pi is roughly 3.143983143983144
took 40.4 s Pi is roughly 3.141019141019141

# executed as 50 tasks on a single 4 core board

took 156.5 s Pi is roughly 3.1399118279823655
took 154.7 s Pi is roughly 3.1423286284657257
```

After all system upgrades and software installed

```shell
$ ssh root@192.168.1.86
root@192.168.1.86's password: 
  ___                               ____  _    ___             
 / _ \ _ __ __ _ _ __   __ _  ___  |  _ \(_)  / _ \ _ __   ___ 
| | | | '__/ _` | '_ \ / _` |/ _ \ | |_) | | | | | | '_ \ / _ \
| |_| | | | (_| | | | | (_| |  __/ |  __/| | | |_| | | | |  __/
 \___/|_|  \__,_|_| |_|\__, |\___| |_|   |_|  \___/|_| |_|\___|
                       |___/                                   

Welcome to ARMBIAN Debian GNU/Linux 8 (jessie) 3.4.112-sun8i 
System load:   0.07            	Up time:       11 min		
Memory usage:  9 % of 494Mb  	IP:            192.168.1.86 
CPU temp:      45°C           	
Usage of /:    16% of 15G    	

Last login: Thu Aug 18 15:22:39 2016 from unknownf4f26d40cace
```



### Reboot Linux

```
shutdown -r time "message"
```

### Shutdown Linux

```
orangepi@OrangePI:~$ shutdown now
==== AUTHENTICATING FOR org.freedesktop.login1.power-off ===
Authentication is required for powering off the system.
Authenticating as: orangepi
Password: 

```



## Managing SD Images

Downloading the OS, all the software tools and keeping them up to day is a lengthy process even for a single SD card, doing it for every node in your (massively) distributed computer would be a full time job. 

The best way to approach this is to keep the newest, best image of the SD card and restore it on other nodes. 

### Backup the Image (on Mac)

After making any good changes, system upgrades to SD card, make a clone of it. 

```shell
$  diskutil list

/dev/disk3 (internal, physical):
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:     FDisk_partition_scheme                        *15.9 GB    disk3
   1:                      Linux                         15.8 GB    disk3s1
   
   
 $ diskutil unmountDisk /dev/disk3
Unmount of all volumes on disk3 was successful


$ sudo dd if=/dev/disk3 of=OrangePiOne_20160818_0831.dmg
Password:
31116288+0 records in
31116288+0 records out
15931539456 bytes transferred in 2060.303430 secs (7732618 bytes/sec)
```



### Restore the Backup SC Image to a new card

```shell
$ diskutil list
...
/dev/disk3 (internal, physical):
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:     FDisk_partition_scheme                        *15.9 GB    disk3
   1:                      Linux                         15.8 GB    disk3s1
   
# FORMAT SC CARD!!! with name PI005
$ sudo diskutil eraseDisk FAT32 PI005 MBRFormat /dev/disk3   

$ diskutil unmountDisk /dev/disk3
Unmount of all volumes on disk3 was successful


> Spark2 $ sudo dd bs=1m if=OrangePiOne_20160818_0831.dmg of=/dev/disk3  
Password:

NOTHING IS HAPPENING, WAIT A VERY LONG TIME: 50 minutes?!?

C8585+0 records in
8584+0 records out
9000976384 bytes transferred in 2676.642025 secs (3362787 bytes/sec)

```



## Running Spark



[TOC]

### Spark Configuration

#### Configuring Spark Enviroment

```shell
## Master 

spark/conf $ cat spark-env.sh 
SPARK_MASTER_IP=192.168.1.86

# use on 2 cores out of 4 for Workers
SPARK_WORKER_CORES=2
SPARK_WORKER_MEMORY=256m
SPARK_EXECUTOR_MEMORY=256m
SPARK_DRIVER_MEMORY=256m

## Slave Worker

$ cat conf/spark-env.sh
PARK_MASTER_IP=192.168.1.86

# use on 4 cores out of 4 for Workers
SPARK_WORKER_CORES=4
SPARK_WORKER_MEMORY=256m
SPARK_EXECUTOR_MEMORY=256m
SPARK_DRIVER_MEMORY=256m
```

#### Configuring Hosts File

```shell
$ cat /etc/hosts
##
# Host Database
#
# localhost is used to configure the loopback interface
# when the system is booting.  Do not change this entry.
##
127.0.0.1			localhost uki
# 192.168.1.85 		localhost
255.255.255.255		broadcasthost
::1             	localhost 
```

#### Configuring Slaves/Workers

```shell
spark/conf $ cat slaves 
# A Spark Worker will be started on each of the machines listed below.
localhost
192.168.1.86
192.168.1.87
192.168.1.88
```



### Running a Test App

```shell
./bin/run-example SparkPi 4 --cores 4 --memory 256M
```

### Stopping Spark

```shell
spark# ./sbin/stop-all.sh
root@localhost's password: 
localhost: no org.apache.spark.deploy.worker.Worker to stop
stopping org.apache.spark.deploy.master.Master
```



### Starting All (Master and Workers)

```shell

> spark $ ./sbin/start-all.sh
```

#### Starting Master

```shell
root@orangepione:~/spark# ./sbin/start-master.sh
starting org.apache.spark.deploy.master.Master, logging to /root/spark/logs/spark-root-org.apache.spark.deploy.master.Master-1-orangepione.out


```



#### Monitoring the Master logs

```shell
root@orangepione:~/spark# tail -f /root/spark/logs/spark-root-org.apache.spark.deploy.master.Master-1-orangepione.out
Spark Command: /usr/lib/jvm/java-8-openjdk-armhf/jre/bin/java -cp /root/spark/conf/:/root/spark/jars/* -Xmx1g org.apache.spark.deploy.master.Master --host orangepione --port 7077 --webui-port 8080
========================================
Using Spark's default log4j profile: org/apache/spark/log4j-defaults.properties
16/08/18 23:59:26 INFO Master: Started daemon with process name: 1831@orangepione
16/08/18 23:59:26 INFO SignalUtils: Registered signal handler for TERM
16/08/18 23:59:26 INFO SignalUtils: Registered signal handler for HUP
16/08/18 23:59:26 INFO SignalUtils: Registered signal handler for INT
16/08/18 23:59:27 WARN Utils: Your hostname, orangepione resolves to a loopback address: 127.0.0.1; using 192.168.1.88 instead (on interface eth0)
16/08/18 23:59:27 WARN Utils: Set SPARK_LOCAL_IP if you need to bind to another address
16/08/18 23:59:36 WARN NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
16/08/18 23:59:40 INFO SecurityManager: Changing view acls to: root
16/08/18 23:59:40 INFO SecurityManager: Changing modify acls to: root
16/08/18 23:59:40 INFO SecurityManager: Changing view acls groups to: 
16/08/18 23:59:40 INFO SecurityManager: Changing modify acls groups to: 
16/08/18 23:59:40 INFO SecurityManager: SecurityManager: authentication disabled; ui acls disabled; users  with view permissions: Set(root); groups with view permissions: Set(); users  with modify permissions: Set(root); groups with modify permissions: Set()
16/08/18 23:59:45 INFO Utils: Successfully started service 'sparkMaster' on port 7077.
16/08/18 23:59:50 INFO Master: Starting Spark master at spark://orangepione:7077
16/08/18 23:59:50 INFO Master: Running Spark version 2.0.0
16/08/18 23:59:53 INFO Utils: Successfully started service 'MasterUI' on port 8080.
16/08/18 23:59:53 INFO MasterWebUI: Bound MasterWebUI to 0.0.0.0, and started at http://192.168.1.88:8080
16/08/18 23:59:53 INFO Utils: Successfully started service on port 6066.
16/08/18 23:59:53 INFO StandaloneRestServer: Started REST server for submitting applications on port 6066
16/08/18 23:59:58 INFO Master: I have been elected leader! New state: ALIVE
16/08/19 00:00:04 INFO Master: Registering worker 192.168.1.88:49380 with 4 cores, 300.0 MB RAM
```

It takes a while, but MasterWebUI can be opened from your Mac/PC 
http://192.168.1.88:8080/

#### Starting Workers

**Spark Master at spark://192.168.1.84:7077**

- **URL:** spark://192.168.1.84:7077
- **REST URL:** spark://192.168.1.84:6066 (cluster mode)
- **Alive Workers:** 4
- **Cores in use:** 16 Total, 0 Used
- **Memory in use:** 18.0 GB Total, 0.0 B Used
- **Applications:** 0 [Running](http://192.168.1.84:8080/#running-app), 2 [Completed](http://192.168.1.84:8080/#completed-app)
- **Drivers:** 0 Running, 2 Completed
- **Status:** ALIVE

```shell
root@pi003 192.168.1.87 20:35 spark $  ./sbin/start-slave.sh spark://192.168.1.86:7077 &


root@pi003 192.168.1.87 20:38 spark $ tail -f /root/spark/logs/spark-root-org.apache.spark.deploy.worker.Worker-1-pi003.out

16/08/26 20:38:59 INFO Worker: Starting Spark worker 192.168.1.87:53009 with 4 cores, 256.0 MB RAM
...
16/08/26 20:39:02 INFO Worker: Connecting to master 192.168.1.86:7077...
...
16/08/26 20:39:05 INFO Worker: Successfully registered with master spark://pi001:7077
```



### Submitting Spark Job

From remote computer (aster 192.168.1.88)

```shell

# REMOTELY
$  ssh root@192.168.1.88 "cd spark ; ./bin/spark-submit --class org.apache.spark.examples.SparkPi --master spark://192.168.1.88:7077 --deploy-mode cluster examples/jars/spark-examples_2.11-2.0.0.jar &"

Running Spark using the REST application submission protocol.
Using Spark's default log4j profile: org/apache/spark/log4j-defaults.properties
16/08/18 16:09:00 INFO RestSubmissionClient: Submitting a request to launch an application in spark://192.168.1.88:7077.
```

from local master (192.168.1.84)

```shell
# LOCALLY 
root@pi001 192.168.1.86 20:33 spark $ ./bin/spark-submit --class org.apache.spark.examples.SparkPi --master spark://192.168.1.86:7077 --deploy-mode cluster ./examples/jars/spark-examples_2.11-2.0.0.jar --executor-memory=256m 

./bin/spark-submit --class org.apache.spark.examples.JavaPageRank --master spark://192.168.1.84:7077 --total-executor-cores 5 --deploy-mode cluster --supervise ./examples/jars/spark-examples_2.11-2.0.0.jar 1000 
```



### Killing a stuck job

```shell
root@orangepione:~/spark# ./bin/spark-class org.apache.spark.deploy.Client kill spark://192.168.1.88:7077 driver-20160819025159-0006
WARNING: This client is deprecated and will be removed in a future version of Spark
Use ./bin/spark-submit with "--master spark://host:port"
...
16/08/19 20:05:47 INFO ClientEndpoint: State of driver-20160819025159-0006 is KILLED
```



### Stopping Spark

```shell
orangepione:~/spark#  ./sbin/stop-all.sh  
```

### 