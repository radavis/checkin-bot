## Checkin Bot


## Hardware

* [Beaglebone](http://beagleboard.org/bone-original)
* Motorola N410 Scanner


## Beaglebone

* boots from microSD
* leds
  - USR0 - heartbeat
  - USR1 - microSD access
  - USR2 - CPU activity
  - USR3 - eMMC access
* mac drivers
  - [network](http://beagleboard.org/static/Drivers/MacOSX/RNDIS/HoRNDIS.pkg)
  - [serial](http://beagleboard.org/static/Drivers/MacOSX/FTDI/EnergiaFTDIDrivers2.2.18.pkg)
* ssh: root@192.168.7.2
* default username:password is [debian:temppwd]


## Linux

```no-highlight
$ sudo lshw
USB
beaglebone
    description: Computer
    product: TI AM335x BeagleBone
    width: 32 bits
  *-core
       description: Motherboard
       physical id: 0
       capabilities: ti_am335x-bone ti_am33xx
     *-cpu
          description: CPU
          product: cpu
          physical id: 0
          bus info: cpu@0
          size: 720MHz
          capacity: 720MHz
          capabilities: cpufreq
     *-memory
          description: System memory
          physical id: 1
          size: 238MiB
  *-usbhost
       product: MUSB HDRC host driver
       vendor: Linux 4.1.15-ti-rt-r43 musb-hcd
       physical id: 1
       bus info: usb@1
       logical name: usb1
       version: 4.01
       capabilities: usb-2.00
       configuration: driver=hub slots=1 speed=480Mbit/s
     *-usb
          description: Keyboard
          product: Symbol Bar Code Scanner
          vendor: Symbol Technologies, Inc, 2008
          physical id: 1
          bus info: usb@1:1
          version: 1.00
          serial: S/N:65047AA854EBDD4D862A149AAE4CF742 Rev:PAAASS00-005-R01-3
          capabilities: usb-2.00
          configuration: driver=usbhid maxpower=500mA speed=12Mbit/s
  *-network:0
       description: Ethernet interface
       physical id: 2
       logical name: eth0
       serial: 00:18:32:66:5f:fc
       size: 100Mbit/s
       capacity: 100Mbit/s
       capabilities: ethernet physical tp mii 10bt 10bt-fd 100bt 100bt-fd autonegotiation
       configuration: autonegotiation=on broadcast=yes driver=cpsw driverversion=1.0 duplex=full ip=10.10.11.8 link=yes multicast=yes port=MII speed=100Mbit/s
  *-network:1
       description: Ethernet interface
       physical id: 3
       logical name: usb0
       serial: 00:18:32:66:5f:f0
       capabilities: ethernet physical
       configuration: broadcast=yes driver=g_ether driverversion=29-May-2008 firmware=musb-hdrc ip=192.168.7.2 link=yes multicast=yes
```

```
$ dmsg

[ 7144.579932] usb 1-1: USB disconnect, device number 3
[ 7147.886090] usb 1-1: new full-speed USB device number 4 using musb-hdrc
[ 7148.029146] usb 1-1: New USB device found, idVendor=05e0, idProduct=1200
[ 7148.029214] usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[ 7148.029256] usb 1-1: Product: Symbol Bar Code Scanner
[ 7148.029295] usb 1-1: Manufacturer: Symbol Technologies, Inc, 2008
[ 7148.029334] usb 1-1: SerialNumber: S/N:65047AA854EBDD4D862A149AAE4CF742 Rev:PAAASS00-005-R01-3
[ 7148.074177] input: Symbol Technologies, Inc, 2008 Symbol Bar Code Scanner as /devices/platform/ocp/47400000.usb/47401c00.usb/musb-hdrc.1.auto/usb1/1-1/1-1:1.0/0003:05E0:1200.0003/input/input3
[ 7148.128226] hid-generic 0003:05E0:1200.0003: input,hidraw0: USB HID v1.10 Keyboard [Symbol Technologies, Inc, 2008 Symbol Bar Code Scanner] on usb-musb-hdrc.1.auto-1/input0
```

getting output

* /dev/input/event1
* /dev/usbmon0
* /dev/usbmon1


## logkeys

clone, compile, and install [logkeys](https://github.com/kernc/logkeys)
