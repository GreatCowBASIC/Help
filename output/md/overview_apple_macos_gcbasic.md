<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="overview_apple_macos_gcbasic"></span>Overview - Apple macOS GCBASIC

</div>

</div>

</div>

<span class="strong">**Introduction**</span>

The GCBASIC compiler can be used with the Apple macOS operating system.
It should run on any version from Snow Leopard 10.6 and above. It is
guaranteed to run on both High Sierra 10.13 and Mojave 10.14 which have
been extensively tested.

You have a choice to make. You can either:

<div class="orderedlist">

1.  download a macOS installer which will install a precompiled 64 bit
    binary for the GCBASIC compiler along with support files and some
    optional components; or
2.  download, compile and install the GCBASIC compiler from the source
    files.

</div>

There are instructions below for both choices. If I was you, I would use
the macOS GCBASIC Installer and save valuable programming time :-)

<span class="strong">**Instructions for using the GCBASIC
Installer**</span>

<div class="orderedlist">

1.  Download the GCBASIC - macOS Installer disk image (.dmg) file from
    <https://sourceforge.net/projects/gcbasic/files/GCBasic-macOS-Installer.dmg/download>
2.  Double click the .dmg file to mount it on your Desktop and a window
    will open which contains the Installer.
3.  Double click the REAME\_FIRST.txt file and read it for any important
    information you may need before proceeding.
4.  Double click the GCBASIC icon and follow the installer prompts.

</div>

<span class="strong">**Instructions for building your own GCBASIC
binary**</span>

Complete the following steps to compile and install the GCBASIC
compiler:

<div class="orderedlist">

1.  Download the FreeBASIC 1.06 macOS binary compilation from:
    <http://tmc.castleparadox.com/temp/fbc-1.06-darwin-wip20160505.tar.bz2>
2.  Download the GCBASIC UNIX Source Distribution from SourceForge at
    <http://gcbasic.sourceforge.net/Typesetter/index.php/Download>
3.  Note: the following instructions assume the distribution file is
    named GCBASIC-UNIX-v0\_98\_05.rar however the version number
    (v0\_98\_05) may change before these instructions are updated, so
    you may have to adjust the filename to match the version you have
    downloaded.
4.  Unfortunately Apple replaced the gcc compiler with the clang
    compiler and FreeBASIC needs the real gcc due to a certain use of
    goto…​ so, you can compile your own version of gcc following the
    instructions at
    <https://solarianprogrammer.com/2017/05/21/compiling-gcc-macos/> or
    you can take the low road and just download the pre-compiled binary
    version from
    <https://github.com/sol-prog/macos-gcc-binary/releases/download/v8.3/gcc-8.3.macos.tar.bz2>
5.  Open a Terminal window (Terminal can be found in Applications &gt;
    Utilities).
6.  Move gcc-8.3.tar.bz2 from your Downloads directory to your Home
    directory by typing the following command in your Terminal window:

</div>

``` screen
   mv ~/Downloads/gcc-8.3.tar.bz2 ~/
```

<div class="orderedlist">

1.  Unpack the gcc-8.3.tar.bz2 compressed tar file by typing the
    following command into your Terminal window:

</div>

``` screen
   gzcat gcc-8.3.tar.bz2 | tar xvf -
```

This will produce a new directory called gcc-8.3.

<div class="orderedlist">

1.  You now need to link the binary gcc-8.3 to just gcc by typing the
    following commands into your Terminal window:

</div>

``` screen
   cd gcc-8.3
   ln -s gcc-8.3 gcc
   cd ..
```

<div class="orderedlist">

1.  Move the gcc-8.3 directory to the /usr/local/ directory by typing
    the following commands into your Terminal window:

</div>

``` screen
   sudo mv gcc-8.3 /usr/local
```

Note: You will be asked for your password to execute the above command.

<div class="orderedlist">

1.  Ensure that the Apple Developer Xcode app is installed. Xcode can be
    downloaded and installed from the App Store for free.

</div>

<div class="orderedlist">

1.  Ensure that the Xcode command line tools are installed by typing the
    following command in your Terminal window:

</div>

``` screen
   xcode-select --install.
```

<div class="orderedlist">

1.  Move the FreeBASIC compressed tar file from your Downloads directory
    to your home directory by typing the following command in your
    Terminal window:

</div>

``` screen
   mv ~/Downloads/fbc-1.06-darwin-wip20160505.tar.bz2 ~/
```

<div class="orderedlist">

1.  Unpack the FreeBASIC compressed tar file by typing these commands in
    your Terminal window:

</div>

``` screen
   gzcat fbc-1.06-darwin-wip20160505.tar.bz2 | tar xvf -
```

This will produce a new directory called fbc-1.06.

<div class="orderedlist">

1.  Move the GCBASIC compressed tar file from your Downloads directory
    to your home directory by typing the following command in your
    Terminal window:

</div>

``` screen
   mv ~/Downloads/GCBASIC-UNIX-v0_98_05.rar ~/
```

<div class="orderedlist">

1.  Unpack the GCBASIC compressed tar file by typing these commands in
    your Terminal window:

</div>

``` screen
   unrar x GCBASIC-UNIX-v0_98_05.rar
```

This will produce a new directory called GCBASIC. <span
class="strong">**Note:**</span> If you do not currently have the unrar
program which can extract rar file archives you can download and install
it for free from the App Store.

<div class="orderedlist">

1.  Change to the GCBASIC/Sources directory by typing this command in
    your Terminal window:

</div>

``` screen
   cd ~/GCBASIC/Sources
```

<div class="orderedlist">

1.  Compile the GCBASIC binary (gcbasic) by typing the following command
    into your Terminal window:

</div>

``` screen
  sh DarwinBuild/build.sh
```

Note 1: If you did not install the various files with the same names as
in the instructions above into your Home directory, you will need to
edit the build.sh script file and change the file paths and filenames to
the appropriate values.

Note 2: You may need to alter the library and include paths in the
build.sh script depending on your version of macOS (it is currently
setup for the Xcode High Sierra 10.13 and Mojave 10.14 versions of
macOS).

<div class="orderedlist">

1.  Confirm the proper execution, and the version, of GCBASIC by typing
    the following command in the Terminal window:

</div>

``` screen
   gcbasic
```

Now you should be able create GCB source files with your favourite
editor and compile those files with the gcbasic compiler.

<span class="strong">**Programming microcontrollers**</span>

To program your microcontroller with your GCBASIC-created hex file, you
will need additional hardware and software.

<div class="orderedlist">

1.  For Microchip PIC microcontroller programming, you might find what
    you need at:
    <https://www.microchip.com/DevelopmentTools/ProductDetails.aspx?PartNO=pg164120>
    and the macOS version of the `pk2cmd` v1.2 command line programming
    software.
2.  For Atmel AVR microcontroller programming, you will need the
    `avrdude` programming software. Check here:
    <http://www.nongnu.org/avrdude/> for it.

</div>

Alternatively, if you use Virtual Machine software such as <span
class="emphasis">*Parallels*</span> or <span class="emphasis">*VMWare
Fusion*</span> to run Windows programs, you can use Windows GUI
programming software.

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
