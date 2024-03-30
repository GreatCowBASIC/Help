<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="setup_an_avrisp_mkii_or_usbtinyisp_for_attiny10_chip_under_windows_10"></span>Setup an AVRISP MKII or USBtinyISP for ATTINY10 chip under Windows 10

</div>

</div>

</div>

<span class="strong">**AVRISP MKII Setup:**</span>

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

  

Next in the process is to upgrade the firmware of the AVRISP MKII.

This process shows the installation of Atmel Studio 7, however, you may
have to use Atmel Studio 6 because of operation system constraint.

Download and Install Atmel Studio 7 from the GCBASIC file store

<https://sourceforge.net/projects/gcbasic/files/Support%20Files/ATMELCompilers/>

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

More informations about ATTiny10 see
<http://gcbasic.sourceforge.net/library/Programming_an_Attiny10_with_AVRISP_mkII_and_AVR_Studio_5.pdf>

  
  

</div>
