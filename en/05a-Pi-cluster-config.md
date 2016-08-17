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
$ sudo apt-get install openjdk-8-jdk
$ java -version
```



### Install Anaconda

```shell
$ wget http://repo.continuum.io/archive/Anaconda2-4.1.1-Linux-x86.sh

$ bash Anaconda3-4.1.1-Linux-x86.sh
```



### Install Scala

```
$ wget http://www.scala-lang.org/files/archive/scala-2.10.4.tgz
$ sudo mkdir /usr/local/src/scala
$ sudo tar xvf scala-2.10.4.tgz -C /usr/local/src/scala/

export SCALA_HOME=/usr/local/src/scala/scala-2.10.4
export PATH=$SCALA_HOME/bin:$PATH

$ scala -version
```



#### Install GIT

```shell
$ sudo apt-get install git
```



### Install Apache Spark

```
$ wget http://d3kbcqa49mib13.cloudfront.net/spark-1.1.0.tgz
$ tar xvf spark-1.1.0.tgz 
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

