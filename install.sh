#!/bin/sh

sudo rmmod mcp251x_ivnprotect
sudo insmod mcp251x_ivnprotect/mcp251x_ivnprotect.ko
sudo ip link set can0 type can bitrate 500000
sudo ifconfig can0 txqueuelen 10000
sudo ifconfig can0 down
sudo ifconfig can0 up
