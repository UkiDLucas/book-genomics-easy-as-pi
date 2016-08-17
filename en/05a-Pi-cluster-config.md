# Orange Pi One Configuration

In this post I will provide OrangePi configuration instructions for Mac.

## OS image installation

Download newest OS from:

http://www.armbian.com/orange-pi-one/

Insert and format a new SD card, class 10.

Figure out what is the name of your CD card (in the reader):

```shell
> OrangePI $ diskutil list
...
/dev/disk3 (internal, physical):
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:      GUID_partition_scheme                        *15.9 GB    disk3
   1:                        EFI EFI                     209.7 MB   disk3s1
   2:       Microsoft Basic Data ORANGEPI                15.7 GB    disk3s2
> OrangePI $ 
```

The name of the SD card is **/dev/disk3**

Unmount the SD card (do not remove it), before putting an image on it:

```shell
> OrangePI $ diskutil unmountDisk /dev/disk3
Unmount of all volumes on disk3 was successful
```



Install the *.raw image on the SD card:

```shell
> OrangePI $ sudo dd bs=1m of=/dev/disk3 if=/Users/ukilucas/Dropbox/OrangePI/Armbian_5.14_Orangepione_Debian_jessie_3.4.112.raw
Password:
```

Wait patiently for a very long time.