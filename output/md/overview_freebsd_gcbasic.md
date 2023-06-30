<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="overview_freebsd_gcbasic"></span>Overview - FreeBSD GCBASIC

</div>

</div>

</div>

<span class="strong">**Introduction**</span>

The GCBASIC compiler can be used with the FreeBSD operating system.

<span class="strong">**Instructions for using the GCBASIC install.sh
script**</span>

Complete the following steps to compile and install the GCBASIC compiler
for FreeBSD:

<div class="orderedlist">

1.  Download one of the nightly builds of FreeBASIC 1.06 for the FreeBSD
    32 bit or 64 bit binary compilation from:
    <http://users.freebasic-portal.de/stw/builds/freebsd32/> (32 bit) or
    <http://users.freebasic-portal.de/stw/builds/freebsd64/> (64 bit)
    The filenames are in the format
    fbc\_freebsd\[32\|64\]\_\[BuildNumber\]\_\[Date\].zip.
2.  Download the GCBASIC UNIX Source Distribution from SourceForge at
    <https://gcbasic.sourceforge.net/Typesetter/index.php/Download>
3.  Move the FreeBASIC ZIP file from your download directory to your
    home directory.
4.  Unzip the FreeBASIC ZIP file which will produce a new directory
    called `fbc_freebsd[32|64]`. The FreeBASIC compiler `fbc` is in the
    `bin` subdirectory. You should add the path to `fbc` to your path so
    that the installation script can find it.
5.  Move the GCBASIC compressed tar file from your download directory to
    your home directory.
6.  Unpack the GCBASIC compressed tar file by typing the command below.
    <span class="strong">**Note**</span>: the version number
    (v0\_98\_05) in the filename may change before these instructions
    are updated - adjust depending on the version number of the file you
    downloaded.

</div>

``` screen
   unrar x GCBASIC-UNIX-v0_98_05.rar
```

This will produce a new directory called GCBASIC. <span
class="strong">**Note:**</span> If you do not already have the unrar
program installed you can either compile it from the ports collection or
use the pkg command to install the binary and any required dependancies.

<div class="orderedlist">

1.  Change to the `GCBASIC/Sources` directory.
2.  Execute the FreeBSDBuild/install.sh shell script from the Sources
    directory.

</div>

``` screen
  sh FreeBSDBuild/install.sh [all | build | install]
```

The build script arguments are:

<div class="itemizedlist">

-   <span class="emphasis">*all*</span> - will compile <span
    class="strong">**and**</span> install the GCBASIC compiler and its
    support files.
-   <span class="emphasis">*build*</span> - will just compile the binary
    for the GCBASIC compiler.
-   <span class="emphasis">*install*</span> - will install the GCBASIC
    compiler and its support files.

</div>

When choosing <span class="emphasis">*all*</span> or <span
class="emphasis">*install*</span> you will be prompted for an
installation directory. The default is `/usr/local/gcb-[version]` for
which you will need to run the installation script as root.
Alternatively, you can choose to install in your home directory (eg
`` `~/bin/gcb ``). The installation script will automatically append the
GCBASIC version so that directory would become `~/bin/gcb-[version]`

<div class="orderedlist">

1.  Add the directory where you installed `gcbasic` to your path, or use
    the full path to the `gcbasic` installation directory and confirm
    the proper execution, and the version, of GCBASIC by executing
    `gcbasic`.

</div>

Now you should be able create GCB source files with your favourite
editor and compile those files with the GCBASIC compiler.

<span class="strong">**Programming microcontrollers**</span>

To program your microcontroller with your GCBASIC-created hex file, you
will need additional hardware and software.

<div class="orderedlist">

1.  For Microchip PIC microcontroller programming, you might find what
    you need at:
    <https://www.microchip.com/DevelopmentTools/ProductDetails.aspx?PartNO=pg164120>
    and the FreeBSD version of the `pk2cmd` v1.2 command line
    programming software.
2.  For Atmel AVR microcontroller programming, you will need the
    `avrdude` programming software. avrdude can be compiled and
    installed from the FreeBSD ports directory or the precompiled binary
    and any missing dependancies can be installed using
    `pkg install avrdude`.

</div>

Alternatively, if you use Virtual Machine software such as <span
class="emphasis">*Virtual Box*</span> to run Windows programs, you may
be able to use Windows GUI programming software.

<div class="itemizedlist">

-   For Microchip, the PICKit 2 and PICkit 3 standalone GUI software or
    even better the PICkitPlus software
    (<https://sourceforge.net/projects/pickit3plus/>) for both the
    PICkit 2
    (<https://www.microchip.com/DevelopmentTools/ProductDetails.aspx?PartNO=pg164120>)
    and PICkit 3
    (<https://www.microchip.com/Developmenttools/ProductDetails/PG164130>)
    which has fixed various bugs in those programs and been updated to
    program the latest Microchip 8 bit microcontrollers.

</div>

<span class="strong">**Help**</span>

GCBASIC Help documentation is installed in the Documentation
subdirectory in your GCBASIC directory.

If at any time you encounter an issue and need help, you will find it
over at the friendly GCBASIC discussion forums at
<https://sourceforge.net/p/gcbasic/discussion/>

</div>
