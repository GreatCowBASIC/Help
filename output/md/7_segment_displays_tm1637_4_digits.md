<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="7_segment_displays_tm1637_4_digits"></span>7 Segment Displays - TM1637 4 Digits

</div>

</div>

</div>

<span class="strong">**Introduction**</span>

The TM1637 disaplay module is used for displaying numbers on a keyboard
matrix.   The matrix of LEDs consists of four 7- segment displays
working together.  

The TM1637 specification is

<div class="itemizedlist">

-   Two wire interface
-   Eight adjustable luminance levels
-   3.3V/5V interface
-   Supports Four alpha-numeric digits
-   Operating current consumption: 80mA  
      

</div>

<span class="strong">**Why to use TM1637 Display Module?**</span>

The TM1637 can be interfaced to any system using only two ports.   This
is the main reason the module is preferred over other module.

Another reason TM1637 display is preferred is because of its low cost.
   Although there are other display modules present in the market they
cost more.

The module design is robust so it can sustain in tough environments and
still can perform its function for a long time.   The module consumes
low power and can be installed in mobile applications.  

  
  

<span class="strong">**How to use TM1637 Display Module?**</span>

As mentioned earlier the module communication can only be done using the
two pins DIO and CLK respectively.   The data is sent to the module or
received from the module though these two pins.   So the characters to
be displayed are sent in the form of serial data through this interface.
A typical circuit diagram of display module interface to a controller is
shown below.

  
  

<div class="informalfigure">

<div class="mediaobject" align="center">

<img src="./images/Display-Module-Interface-with-Controller.png" height="252" alt="graphic" />

</div>

</div>

  
  

The module can work on +5V regulated power and any higher voltage may
lead to permanent damage.   The interface is established as shown in
figure above.   All you need to do is connect DIO and CLK to any of GPIO
(General Purpose Input Output) pins of controller and establish serial
data exchange through programming.  
  

<span class="strong">**GCBASIC Support**</span>

The GCBASIC 7 segment display methods make it easier for GCBASIC
programs to display numbers and letters on 7 segment LED displays.

The GCBASIC methods support up to four digit 7 segment display devices,
common anode/cathode and inversion of the port logic to support driving
the device(s) via a transistor.

Brightness can be set: 8 is display on minimum bright , 15 is display on
max bright. Less than 8 is display off.

The TM1637 chip supports the reading of the keyboard matrix however that
is not supported in the library.

<span class="strong">**DataSheets**</span>

The datasheets can found here:

English -
<a href="http://gcbasic.sourceforge.net/library/TM1637/TM1637_V2.4_EN.pdf" class="link">here</a>.

Chinese -
<a href="http://gcbasic.sourceforge.net/library/TM1637/TM1637_V2.4.pdf" class="link">here</a>.

<span class="strong">**Usage**</span>

The following will set the display.

<div class="informaltable">

| <span class="strong">**Constant**</span> | <span class="strong">**Description**</span>                                            |
|:-----------------------------------------|:---------------------------------------------------------------------------------------|
| TM1637\_CLK                              | Must be a bi-directional port.   The direction/port setting is managed by the library. |
| TM1637\_DIO                              | Must be a bi-directional port.   The direction/port setting is managed by the library. |

</div>

<span class="strong">**Example program**</span>

``` screen
  #chip mega328p,16
  #include <TM1637a.h>

  #define TM1637_CLK PortD.2      ' Arduino Digital_2
  #define TM1637_DIO PortD.3      ' Arduino Digital_3

  '---- main program --------

    TMWrite4Dig (17, 16, 17, 16, 0) 'clear display
      wait 2 s
    TMWrite4Dig (17, 16, 17, 16, 10,0) '- -
      wait 2 s
    TMchar_Bright = 10
```

  
  
  
  
  
  

</div>
