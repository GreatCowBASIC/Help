<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="overview_linux_operating_system"></span>Overview - Linux Operating System

</div>

</div>

</div>

<span class="strong">**Introduction:**</span> Great Cow BASIC can be
used when using the Linux Operating System.

This instructions are not distribution specific, but are for Linux only
(not Windows).

<span class="strong">**Instructions:**</span> Complete the following
steps to compile and install Great Cow BASIC for Linux:

<div class="orderedlist">

1.  Install FreeBasic from your distributions repository or
    <http://www.freebasic.net/wiki/CompilerInstalling>
2.  Download the "Great Cow BASIC - Linux Distribution" from SourceForge
    at <https://sourceforge.net/projects/gcbasic/files/>
3.  Unrar/unpack <GCB@Syn.rar> to a location of your choice within your
    home directory (eg. within Downloads) with either a file manager or
    from a console.
4.  From a console, change to the Great Cow BASIC Sources in the
    unpacked directory:

</div>

``` screen
   eg. cd ~/Downloads/GCB@Syn/GreatCowBasic/Sources/GCBASIC
```

<div class="orderedlist">

1.  Make sure that `install.sh` is set as executable (ie.
    `chmod +x install.sh`), and then execute: ./install.sh build
2.  You will need root privileges for this step. You can switch user
    (su) to root, or optionally use `sudo`.

</div>

``` screen
   Execute: [sudo] ./install.sh install
```

<div class="orderedlist">

1.  If you su’d to root, use `exit` to drop back to your normal user.
    Then, be sure to follow the instructions given by the script for
    updating your path.
2.  Confirm proper execution, and the version, of Great Cow BASIC by
    executing: gcbasic /version

</div>

Now you can create and compile Great Cow BASIC source files.

<span class="strong">**Programming microcontrollers:**</span>

To program your microcontroller with your Great Cow BASIC created hex
file, you will need additional programming and programmer software.

For Microchip PIC microcontroller programming, you might find what you
need at:
<http://www.microchip.com/DevelopmentTools/ProductDetails.aspx?PartNO=pg164120>

For Atmel AVR microcontroller programming, you will need `avrdude`. It
should be available in your distributions repository. If not, check
here: <http://www.nongnu.org/avrdude/>

</div>
