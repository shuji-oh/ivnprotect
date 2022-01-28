#!/bin/bash

system_map="/proc/kallsyms"
address=`sudo grep "T sys_call_table" ${system_map} | cut -f1 -d ' '`
if [ $? -ne 0 ]; then
  echo "Cannot fount ${system_map} on your env."
  exit -1
fi

echo "0x"$address

#sed -i "s/__SYSCALL_TABLE_ADDRESS__/0x${address}/" mcp251x_ivnprotect/mcp251x_ivnprotect.c
