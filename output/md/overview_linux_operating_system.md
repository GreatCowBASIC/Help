<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="overview_linux_operating_system"></span>Overview - Linux Operating System

</div>

</div>

</div>

<span class="strong">**Introduction:**</span> GCBASIC can be used with
the Linux operating system.

These instructions are not distribution-specific, but are for Linux only
(not Windows).

<span class="strong">**Instructions:**</span> Complete the following
steps to compile and install GCBASIC for Linux:

<div class="orderedlist">

1.  Install FreeBasic from your distribution’s repository or [the
    FreeBASIC wiki](https://www.freebasic.net/wiki/CompilerInstalling)
2.  Download the "GCBASIC - Linux Distribution" from SourceForge at
    [sourceforge.net](https://sourceforge.net/projects/gcbasic/files/)
3.  Unrar/unpack GCBASIC.rar to a location of your choice within your
    home directory (eg. within Downloads) with either a file manager or
    from a console.
4.  From a console, change to the GCBASIC Sources in the unpacked
    directory:

</div>

``` screen
   eg. cd ~/Downloads/sources/linuxbuild/
```

<div class="orderedlist">

1.  Make sure that `install.sh` is set as executable (ie.
    `chmod +x install.sh`), and then execute: `./install.sh build`
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
2.  Confirm proper execution, and the version, of GCBASIC by executing:
    `gcbasic /version`

</div>

Now you can create and compile GCBASIC source files.

<span class="strong">**Programming microcontrollers:**</span>

To program your microcontroller with your GCBASIC-created hex file, you
will need additional programming and programmer software.

For Microchip PIC microcontroller programming, you might find what you
need at: [www.pickitplus.co.uk](https://www.pickitplus.co.uk). The
PICkitPlus Team provide programmers and Linux software.

For Atmel AVR microcontroller programming, you will need `avrdude`. It
should be available in your distribution’s repository. If not, check
here: [avrdude website](https://www.nongnu.org/avrdude/)

  
  
  
  

</div>
