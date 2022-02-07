# IVNProtect: Isolable and Deployable CAN Bus Kernel-Level Protection for Secure In-Vehicle Communication

[Shuji Ohira, Araya Kibrom Desta, Ismail Arai, Kazutoshi Fujikawa, "IVNProtect: Isolable and Deployable CAN Bus Kernel-Level Protection for Securing In-Vehicle Communication," In Proceedings of the 2022 *** (*** ’22), pp.xx–xx, July. 2022.]()

```
@inproceedings{ohira2022ivnprotect,
  title={IVNProtect: Isolable and Deployable CAN Bus Kernel-Level Protection for Securing In-Vehicle Communication},
  author={Ohira, Shuji and Kibrom Desta, Araya and Arai, Ismail and Fujikawa, Kazutoshi},
  booktitle={},
  pages={},
  year={2022},
  doi={},
  organization={}
}
```

## Introduction  

## Linux kernel version  

5.10.y  

## Required Hardware  

* Raspberry Pi Model B or B+  
* PiCAN 2 Board  

## Install  
At first, you should write Raspberry Pi OS (bullseye) image to your microSD card.  
After that, you can build our protection mechanism with following commands.

### Download kernel source and kernel headers, and build our kernel module
```
$ sudo apt update  
$ sudo apt install git bc bison flex libssl-dev python2 libncurses5-dev  
$ sudo wget https://raw.githubusercontent.com/RPi-Distro/rpi-source/master/rpi-source -O /usr/local/bin/rpi-source && sudo chmod +x /usr/local/bin/rpi-source && /usr/local/bin/rpi-source -q --tag-update  
  
$ git clone https://github.com/shuji-oh/ivnprotect  
$ cd ivnprotect/mcp251x_ivnprotect  
$ make  
$ sudo rmmod mcp251x  
$ sudo insmod mcp251x_ivnprotect.ko  
```

### Enable PiCAN board
```
$ sudo vi /boot/config.txt  
dtparam=spi=on  
dtoverlay=mcp2515-can0,oscillator=16000000,interrupt=25  
dtoverlay=spi-bcm2835-overlay  
$ sudo ip link set can0 up type can bitrate 500000  
$ ifconfig can0  
```

### Extend can interface's txqueue length
The default tx queue length is 10. So, we need to increase the length to 10000 (example).  
```
$ sudo ifconfig can0 txqueuelen 10000  
```

### Build our kernel module for debugging
```
$ cd ivnprotect/mcp251x_ivnprotect  
$ make debug  
$ sudo rmmod mcp251x  
$ sudo insmod mcp251x_ivnprotect.ko  
```

