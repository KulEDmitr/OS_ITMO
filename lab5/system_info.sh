#!/bin/bash

#system config

> config
awk '$1 == "MemTotal:" {print "The total amount of RAM: " $2 " " $3}' /proc/meminfo >> config
awk '$1 == "SwapTotal:" {print "The size of the swap partition: " $2 " " $3}' /proc/meminfo >> config
echo "Virtual memory page size: $(getconf PAGE_SIZE) B" >> config
awk '$1 == "MemFree:" {print "The amount of free RAM on an unloaded system: " $2 " " $3}' /proc/meminfo >> config
awk '$1 == "SwapFree:" {print "The amount of free space in the swap partition on an unloaded system: " $2 " " $3}' /proc/meminfo >> config

