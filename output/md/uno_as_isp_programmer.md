<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="uno_as_isp_programmer"></span>UNO as ISP programmer

</div>

</div>

</div>

So, you have brought some ATtiny88 breakout boards online.   They are
advertised as Nano equivalents but are inferior to the Nano in having
low RAM (512 bytes vs 2048) and missing some other features.  
Specifically the lack of a USB comport for programming.  

The ATtiny88 USB interface only works in Arduino IDE with some tweaking,
and, you are not in the mood for learning how to write sketches after
being in the GCB environment for years.  

This is an all-in-one tutorial for programming the ATtiny88 via AVRdude
using GCB.  

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

### Note

The only baud rate that works is 19200. Every other baud rate failed in
testing

</div>

The process described will create a new programmer entry in the GCB
Programmer Options to fully automate the compile & program progress.

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

### Note

This refers to an ATtiny88 but you can use this method for many AVRs
which used in conjunction with AvrDude.

</div>

<span class="strong">**The Process**</span>

<div class="orderedlist">

1.  Obtain an Arduino UNO or mega.   Upload this
    <a href="https://sourceforge.net/p/gcbasic/discussion/chipfileforum/thread/088449090a/ed10/attachment/arduino_As_ISP_adafruit.hex" class="link">hex file</a>
    to convert the UNO into an ISP programmer or follow steps 2 -5
    below.
2.  Download the Arduino IDE software.   This is used to upload a sketch
    to the UNO that converts it into an ISP programmer.
3.  Connect the UNO to your PC via USB.   In Arduino IDE goto Tools →
    Set board and select "Arduino UNO".   Select the correct com port
    for the Arduino Uno as show in device manager.
4.  Goto file → examples → ArduinoISP to select the sketch that will
    convert the UNO to an ISP programmer. I found a better(?) working
    version at adafruit. Simply copy all the text from this link into a
    new sketch
    <https://raw.githubusercontent.com/adafruit/ArduinoISP/master/ArduinoISP.ino>
    (or download the ino file attached and open it in Arduino IDE) and
    goto step 5
5.  Click upload and confirm the sketch uploaded correctly by checking
    the status window at the bottom of the Arduino IDE
6.  Build a cable to connect the ISP headers on the UNO and target
    (ATtiny88) board as described below. Search online for the UNO ISP
    header pinout, the ISP header happens to be labelled underneath the
    ATtiny88 breakout board.
7.  Connect pin 10 of the UNO to the reset pin on target ISP header
8.  Connect VCC to VCC, MOSI to MOSI, MISO to MISO, GND to GND, SCK to
    SCK.
9.  Open Synwrite → "IDE tools" → "GCB tools" → "Edit Programmer
    preferences", or, in GCStudio "Edit Programmer preferences"
10. Click "add" and a program editor window opens
11. Enter name Arduino as ISP or similar
12. In the "Use if" box paste DEF(AVR)
13. In the "File" box paste %instdir%..\\avrdude\\avrdude.exe
14. In the "command line parameters" paste -c avrisp -p t88 -P %Port% -b
    19200 -U flash:w:"%FileName%":a
15. Select the com port that corresponds to the connected UNO port
16. Click ok

</div>

<span class="emphasis">*Enter the sample code here into GCB IDE*</span>

``` screen
    #chip tiny88, 12

    dir portd.0 out

    Do
      set portd.0 on
      wait 500 ms
      set portd.0 off
      wait 500 ms
    Loop
```

Now you can select "Hex/Flash" to upload the code to the Attiny88.   If
all goes well the LED should blink on and off every second

</div>
