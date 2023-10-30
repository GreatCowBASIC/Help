<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="overview_raspberry_pi"></span>Overview - Raspberry Pi

</div>

</div>

</div>

<span class="strong">**Introduction:**</span>

GCBASIC can be used when using the Raspberry Pi.

You can install the command-line version of GCBASIC on a Raspberry Pi
(and similar single-board computers) and use it to compile your GCBASIC
programs.

You can also program most PICs and AVRs using only the Pi’s GPIO pins
(see <a href="" class="xref">???</a>), as well as communicate with your
device over the Pi’s serial port. This makes it easy to program, modify,
and communicate with a PIC or AVR using just a Pi and an SSH connection.

GCBASIC is not published for ARM-based computers, there is currently no
pre-compiled version for ARM-based computers, so you will have to
compile it from source. The GCBASIC compiler is written in
<a href="https://www.freebasic.net/" class="link">FreeBASIC</a> (an
open-source version of BASIC), so you will need to first install the
FreeBASIC compiler on your Pi, then use it to compile the GCBASIC
compiler from its source code. This is relatively simple.

FreeBASIC is not included in any of the major Linux repositories, but
there is a customized version for ARMv7 boards like the Raspberry Pi on
their
<a href="https://users.freebasic-portal.de/stw/builds/linux-armv7a-hf-debian/" class="link">web site</a>.

The following procedure will work with any ARMv7 single-board computer
running a Debian derivative like
<a href="https://www.raspberrypi.org/downloads/raspberry-pi-os/" class="link">Raspberry Pi OS</a>
or <a href="https://www.armbian.com/" class="link">Armbian</a>. This
includes the Raspberry Pi 2 and 3, and all single board computers with
an Allwinner H2+ or H3 microprocessor (Orange Pi PC, Orange Pi Zero,
Nano Pi R1, etc). It has not been tested with a Raspberry Pi 4.

<span class="strong">**Instructions:**</span>

All commands should be performed on your Pi board, either through a
remote SSH terminal or using a keyboard and monitor connected to your
Pi.

<span class="emphasis">*Installing FreeBASIC*</span>

<div class="orderedlist">

1.  Install FreeBASIC dependencies

</div>

``` screen
    $ sudo apt-get install libx11-dev libxext-dev libxpm-dev libxrandr-dev libncurses5 libncurses5-dev
```

<div class="orderedlist">

1.  Download the latest version FreeBASIC for ARMv7 from
    <https://users.freebasic-portal.de/stw/builds/linux-armv7a-hf-debian/>
    :

</div>

``` screen
    $ cd ~
    $ wget https://users.freebasic-portal.de/stw/builds/linux-armv7a-hf-debian/fbc_linux_armv7a_hf_debian_0376_2020-09-17.zip
    $ unzip fbc_linux_armv7a_hf_debian_0376_2020-09-17.zip
```

<div class="orderedlist">

1.  Install FreeBASIC

</div>

``` screen
  $ cd fbc_linux_armv7a_hf_debian/
  $ chmod +x install.sh
  $ sudo ./install.sh -i
```

<span class="emphasis">*Installing GCBASIC*</span>

<div class="orderedlist">

1.  Download and extract the GCBASIC sources:

</div>

``` screen
    $ wget "https://downloads.sourceforge.net/project/gcbasic/GCBasic%20-%20Linux%20Distribution/GCB%40Syn.rar"
    $ sudo apt install unar
    # the password when requested in the next step is "GCB"
    $ unar GCBASIC.rar
    $ cd GCBASIC/sources/linuxbuild/
```

<div class="orderedlist">

1.  Build and install the compiler:

</div>

``` screen
    $ chmod +x install.sh
    $ ./install.sh build
    $ sudo ./install.sh install
```

<div class="orderedlist">

1.  Verify the compiler is properly installed and view the full list of
    compiler options

</div>

``` screen
    $ gcbasic
```

Now you can create and compile GCBASIC source files. For example, to
compile a program you created named `myprogram.bas` into
`myprogram.hex`, you could run:

``` screen
    $ gcbasic -A:GCASM -R:none -K:A -WX -V myprogram.bas
```

This will:

<div class="itemizedlist">

-   use GCBASIC’s internal assembler,
-   turn off report creation,
-   preserve all code in the assembly file output (useful for debugging)
-   treat warnings as errors, and
-   print compiler messages in verbose mode

</div>

<span class="strong">**Programming**</span>

To transfer your compiled .hex program files from your Pi to your
microcontroller, you will need additional software.

For most PIC microcontrollers, you should use
<a href="https://pickitplus.co.uk/Typesetter/index.php/PKCMD-Pi-Application" class="link">PICkitPlus for Pi</a>.
PICKitPlus support the widest range of PICs including the latest PICs.
It is fully supported application.

For AVR microcontrollers, you will need `avrdude`. It should be
available in your distribution’s repository. If not, check here:
<http://www.nongnu.org/avrdude/> . Instructions on how to use it can be
found
<a href="https://learn.adafruit.com/program-an-avr-or-arduino-using-raspberry-pi-gpio-pins/overview" class="link">here</a>.

</div>
