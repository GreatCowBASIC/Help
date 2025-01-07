<div class="section">

<div class="titlepage">

<div>

<div>

###### <span id="_displaychar"></span>DisplayChar

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    DisplayChar (display, character, dot)
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

This command will display the given ASCII character on a seven segment
LED display.

`display` is the number of the display to use. Up to 4 digits.  

`character` is the ASCII character to be shown.

`dot` is an optional parameter. When it is 1 then the decimal point for
that digit is turned on.

This example below is a Common Cathode configuration.

<span class="strong">**Example 1:**</span>

``` screen
   'This program will show " Hello  " on a LED display
    'The display should be connected to PORTB and the Enable on PORTA.0

    #chip 16F877A, 20

    #define DISPLAYPORTA PORTB
    #define DISP_SEL_1 PORTA.0


    Dim Message As String
    Message = " Hello  "
  Do
    For Counter = 1 to len(Message)
      DisplayChar 1, Message(Counter)
      Wait 250 ms
    Next
  Loop
```

This is a Common Anode example There are three different methods for
port specification Note the ports are specified bit by bit in this case
but could be specified like Example 1 See Overview for further
explanation.

<span class="strong">**Example 2:**</span>

``` screen
  'This program will show amessage on a LED display
  'This is a Dual digit Common anode with driver transistors example
   #chip 16F886, 8

    'support for Common Anode
    #define 7Seg_CommonAnode

    'support for pfet or pnp high side drivers
    #define 7Seg_HighSide

  ' Constants
  ' You need to specify the port settings
    #define DISP_SEG_A PORTB.0
    #define DISP_SEG_B PORTB.1
    #define DISP_SEG_C PORTB.2
    #define DISP_SEG_D PORTB.3
    #define DISP_SEG_E PORTB.4
    #define DISP_SEG_F PORTB.5
    #define DISP_SEG_G PORTB.6

    #define DISP_SEL_1 PORTC.5
    #define DISP_SEL_2 PORTC.4

    Dim Message As String
    Message = " Happy Holidays  "
    Do
    For Counter = 1 to len(Message)-2
      Repeat 50
        Displaychar 1, Message(Counter)
        wait 3 ms
        DisplayChar 2, Message(Counter+1)
        wait 3 ms
        end Repeat
      Wait 100 ms
    Next
    Loop
```

<span class="strong">**Also, see**</span>
<a href="_7_segment_displays_overview.html" class="link" title="7 Segment Displays Overview">7 Degment Display Overview</a>,
<a href="_displayvalue.html" class="link" title="DisplayValue">DisplayValue</a>,
<a href="_displaysegment.html" class="link" title="DisplaySegment">DisplaySegment</a>

</div>
