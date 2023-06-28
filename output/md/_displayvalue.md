<div class="section">

<div class="titlepage">

<div>

<div>

###### <span id="_displayvalue"></span>DisplayValue

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    DisplayValue (display, data, dot)
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

This command will display the given value on a seven segment LED
display.

`display` is the number of the display to use. Up to 4 digits.  

`data` is the value between 0 and F to be shown.

`dot` is an optional parameter. When it is 1 then the decimal point for
that digit is turned on.

The command also support HEX characters in the range between 0x00 and
0x0F (0 to 15). See example two below for usage.

<span class="strong">**Example 1:**</span>

``` screen
    'This program will count from 0 to 99 on two LED displays
    #chip 16F819, 8

  'See 7 Segment Display Overview for alternate ways of defining Ports
    #define DISP_SEG_A PORTB.0
    #define DISP_SEG_B PORTB.1
    #define DISP_SEG_C PORTB.2
    #define DISP_SEG_D PORTB.3
    #define DISP_SEG_E PORTB.4
    #define DISP_SEG_F PORTB.5
    #define DISP_SEG_G PORTB.6
  '#define DISP_SEG_DOT PORTB.7 ' Optional DP

    #define DISP_SEL_1 PORTA.0
    #define DISP_SEL_2 PORTA.1

    Do
        For Counter = 0 To 99

            'Get the 2 digits
            Number = Counter
            Num1 = 0
            If Number >= 10 Then
                Num1 = Number / 10
                'SysCalcTempX stores remainder after division
                Number = SysCalcTempX
            End If
            Num2 = Number

            'Show the digits
            'Each DisplayValue will erase the other (multiplexing)
            'So they must be called often enough that the flickering
            'cannot be seen.
            Repeat 500
                DisplayValue 1, Num1
                Wait 1 ms
                DisplayValue 2, Num2
                Wait 1 ms
            End Repeat
        Next
    Loop
```

<span class="strong">**Example 2:**</span>

``` screen
    'This program will count from 0 to 0xff on two LED displays
    #chip 16F819, 8

    #define DISP_SEG_A PORTB.0
    #define DISP_SEG_B PORTB.1
    #define DISP_SEG_C PORTB.2
    #define DISP_SEG_D PORTB.3
    #define DISP_SEG_E PORTB.4
    #define DISP_SEG_F PORTB.5
    #define DISP_SEG_G PORTB.6

    #define DISP_SEL_1 PORTA.0
    #define DISP_SEL_2 PORTA.1
    #define DISP_SEL_4 PORTA.2
    #define DISP_SEL_3 PORTA.3

    Do
        For Counter = 0 To 0xff

            'Get the 2 digits
            Number = Counter
            Num1 = 0
            If Number >= 0x10 Then
                Num1 = Number / 0x10
                'SysCalcTempX stores remainder after division
                Number = SysCalcTempX
            End If
            Num2 = Number

            'Show the digits
            'Each DisplayValue will erase the other (multiplexing)
            'So they must be called often enough that the flickering
            'cannot be seen.
            Repeat 500
                DisplayValue 1, Num1
                Wait 1 ms
                DisplayValue 2, Num2
                Wait 1 ms
            End Repeat
        Next
    Loop
```

<span class="strong">**Also, see**</span>
<a href="_7_segment_displays_overview.html" class="link" title="7 Segment Displays Overview">7 Segment Display Overview</a>,
<a href="_displaychar.html" class="link" title="DisplayChar">DisplayChar</a>,
<a href="_displaysegment.html" class="link" title="DisplaySegment">DisplaySegment</a>

</div>
