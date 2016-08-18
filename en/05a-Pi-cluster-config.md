## OS image installation

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

Re-format the SD card as MSDOS in Mac Disk Utility - works better



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



     _      _     _             
  __| | ___| |__ (_) __ _ _ __  
 / _` |/ _ \ '_ \| |/ _` | '_ \ 
| (_| |  __/ |_) | | (_| | | | |
 \__,_|\___|_.__/|_|\__,_|_| |_|
                                

Welcome to ARMBIAN Debian GNU/Linux 8 (jessie) 3.4.112-sun8i 

System load:   0.31            	Up time:       1 min		
Memory usage:  9 % of 494Mb  	IP:            192.168.1.86 
CPU temp:      49°C           	
Usage of /:    9% of 15G    	

uki@orangepione:~$ 
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



### Install Apache Spark

```shell
$  wget http://d3kbcqa49mib13.cloudfront.net/spark-2.0.0-bin-hadoop2.7.tgz
$ tar xvf spark **.tgz 
$ cd spark-1.1.0
$ sbt/sbt assembly
$ ./bin/run-example SparkPi 10
```



### Shutdown Linux

```
orangepi@OrangePI:~$ shutdown now
==== AUTHENTICATING FOR org.freedesktop.login1.power-off ===
Authentication is required for powering off the system.
Authenticating as: orangepi
Password: 

```

## Backup the Image

After making any good changes to SD card, make a clone of it. 

```shell
sudo dd if=/dev/disk3 of=OrangePiOne_date_time.dmg
```

