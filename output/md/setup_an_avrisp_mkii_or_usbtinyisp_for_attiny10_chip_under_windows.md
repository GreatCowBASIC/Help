<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="setup_an_avrisp_mkii_or_usbtinyisp_for_attiny10_chip_under_windows"></span>Setup an AVRISP MKII or USBtinyISP for ATTINY10 chip under Windows

</div>

</div>

</div>

<span class="strong">**AVRISP MKII Windows Driver
Validation/Changing**</span>

Windows 10 and 11 tested.

When using the AVRDUDE, which is used as part of the GCBASIC toolchain,
you need to ensure these programmers are operating with the correct
Windows device driver.   The Windows driver must be `libusbK` not
`libusb or libusb-win32` Windows driver.

You must ensure the Windows driver is `libusbK`.  Using the utility
Zadig enables changing the Windows device driver to `libusbK`.

<div class="itemizedlist">

-   Download and install Zadig Driver Utility software
    <https://zadig.akeo.ie/>
-   Connect the USB cable from the AVRISP MKII to your PC.
-   Open Zadig and from the menu select Options / List All Devices.
-   From the device list select AVRISP MKII.
-   Select the target driver libusbK and click (Install / Replace
    Driver) button.

</div>

After the installation is completed, open Windows Device Manager and
verify the driver installation.

Close Zadig

<div class="informalfigure">

<div class="mediaobject">

![Setup](./images/1%20%20-%20AVRISP%20MKII%20Zadig%20Setup.png)

</div>

</div>

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

### Note

If you use ATMEL Studio you must ensure the Windows device driver is
`libusb or libusb-win32`.

</div>

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

### Note

If you use AVRDUDE then uou must ensure the Windows device driver is
`libusbK`.

</div>

Next in the process is to upgrade the firmware of the AVRISP MKII.

<span class="strong">**Option 1:**</span>

This process shows the installation of Atmel Studio 7, however, you may
have to use Atmel Studio 6 because of operation system constraint.

Download and Install Atmel Studio 7 from the GCBASIC file store
<a href="https://sourceforge.net/projects/gcbasic/files/Support%20Files/ATMELCompilers/" class="link">here</a>

After the installation open ATMEL STUDIO 7

<div class="itemizedlist">

-   Select Tools / Device Programming
-   Make sure the AVRISP MKII is selected
-   At this point ATMEL STUDIO will notified to upgrade the firmware to
    version 1.8
-   Click the Upgrade button
-   Once the firmware is upgraded, close ATMEL STUDIO 7

</div>

<div class="informalfigure">

<div class="mediaobject">

![Studio](./images/2%20%20-%20ATMEL%20STUDIO.png)

</div>

</div>

  
  

<span class="strong">**Option 2:**</span>

To update the firmware please, follow the steps listed below.

<div class="itemizedlist">

-   Connect the programmer to the USB and with a sharp object (needle or
    pin) press the upgrade pin - it is in a small hole at the back of
    the board (this will start the bootloader and will turn off the LED,
    it will also probably show a new unrecognized device in the device
    manager for which we will install drivers in step 3)
-   Download and install the latest version of "Atmel Flip" software (it
    can be downloaded from the Atmel’s web-site, or from the GCBASIC
    file store
    <a href="https://sourceforge.net/projects/gcbasic/files/Support%20Files/ATMELCompilers/AVRISPMk2/" class="link">here</a>
    )
-   Open its install folder and update the software of the unrecognized
    device (usually under the "Other devices" tab) with the drivers from
    folder named "usb"; the device should now be recognized as
    AT90USB162 under "libusb-win32" tab
-   Start "Atmel FLIP" and click "Select a target device" → choose
    AT90USB162
-   Click "Select a Communication Medium" and then USB medium
-   Download the firware and unpack
    <a href="https://www.olimex.com/Products/AVR/Programmers/AVR-ISP-MK2/resources/AVR456-studio-AVRISP-MKII.zip" class="link">Olimex website</a>
    or the GCBASIC files store
    <a href="https://sourceforge.net/projects/gcbasic/files/Support%20Files/ATMELCompilers/AVRISPMk2/" class="link">here</a>
-   From "File → load HEX file" choose the latest HEX and click "RUN" in
    the "Operations Flow" section
-   Disconnect the AVR-ISP-MK2 from the USB and connect it again

</div>

For more information about AVR-ISP-MK2 see this guide
<a href="http://gcbasic.sourceforge.net/library/AVR-ISP-MK2-OpenSourceHardwareBoard.pdf" class="link">here</a>

<span class="strong">**AVRISP MKII to ATTINY10 Connections:**</span>

Connect the AVRISP MKII to the ATTINY10 as show in the Diagram.

<div class="informalfigure">

<div class="mediaobject">

![Connections](./images/3%20%20-%20AVRISP%20MKII%20Connections.png)

</div>

</div>

  
  

<span class="strong">**GCStudio Programmer Setup:**</span>

Open GCStudio and set the Programmers to use as show below

For AVRISP MKII use the AVR ISP XPII \[KANDA\] and drag it to the top of
the list and click OK.

<div class="informalfigure">

<div class="mediaobject">

![4%20%20
%20GCStudio%20AVRISP%20MKII%20use%20the%20AVR%20ISP%20XPII%20%5BKANDA%5D](./images/4%20%20-%20GCStudio%20AVRISP%20MKII%20use%20the%20AVR%20ISP%20XPII%20%5BKANDA%5D.png)

</div>

</div>

  
  

Now you’re ready to upload your first program to an ATTINY10.

<span class="strong">**USBtinyISP Setup:**</span>

<div class="itemizedlist">

-   From Zadig select USBtinyISP in the device list.
-   Select the target driver libusb-win32 and click (Install / Replace
    Driver) button.
-   After the installation, open Windows Device Manager and verify the
    driver installation.
-   Close ZADIG

</div>

<div class="informalfigure">

<div class="mediaobject">

![5%20%20
%20USBtinyISP%20Zadig%20setup](./images/5%20%20-%20USBtinyISP%20Zadig%20setup.png)

</div>

</div>

  
  

<span class="strong">**USBtinyISP to ATTINY10 Connections:**</span>

Connect the USBtinyISP to the ATTINY10 as show in the Diagram.

<div class="informalfigure">

<div class="mediaobject">

![6%20%20
%20USBtinyISP%20Copnections](./images/6%20%20-%20USBtinyISP%20Copnections.png)

</div>

</div>

  
  

<span class="strong">**GCStudio Programmer Setup:**</span>

Open GCStudio and set the Programmers to use as show below

Select and Drag the Avrdude (USBtinyISP) programmer to the top of the
list.

<div class="informalfigure">

<div class="mediaobject">

![7%20%20
%20GCStudio%20Avrdude%20%28USBtinyISP%29](./images/7%20%20-%20GCStudio%20Avrdude%20%28USBtinyISP%29.png)

</div>

</div>

  
  

Now you are ready to upload your first program to an ATTINY10

For more information programming review these resources:

``` literallayout
A guide http://gcbasic.sourceforge.net/library/Programming_an_Attiny10_with_AVRISP_mkII_and_AVR_Studio_5.pdf[here]
```

``` literallayout
A blog http://gcbasic.sourceforge.net/library/Technoblogy_Programming_the_ATtiny10.pdf[here]
```

  
  

</div>
