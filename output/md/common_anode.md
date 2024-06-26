<div class="section">

<div class="titlepage">

<div>

<div>

###### <span id="common_anode"></span>Common Anode

</div>

</div>

</div>

This is a Common Anode 7 Segment display example.

Additional configuration is required when using Common Anode.

When setting up the 7 segment Common Anode display you <span
class="strong">**MUST**</span> use the `7Seg_CommonAnode` constant. You
can optionally use the `7Seg_HighSide` constant to support PFET or PNP
high side driving of the Common Anode displays as follows:

<div class="informaltable">

| <span class="strong">**Constant Name**</span> | <span class="strong">**Controls**</span>             | <span class="strong">**Comment**</span>                              |
|:----------------------------------------------|:-----------------------------------------------------|:---------------------------------------------------------------------|
| `7Seg_CommonAnode`                            | Inverts controls for Common Anode displays           | Required for Common Cathode displays                                 |
| `7Seg_HighSide`                               | Support PFET or PNP high side driving of the display | Inverts Common Cathode addressing pin logic for multiplexed displays |

</div>

<span class="strong">**Example:**</span>

``` screen
    'A Common Anode 7 Segment display example using bs250p pfets
    'Chip model
    #chip 16f1783,8

    'support for Common Cathode
    #define 7Seg_CommonAnode

    'support for pfet or pnp high side drivers
    #define 7Seg_HighSide

    #define DISP_SEG_A PORTC.0
    #define DISP_SEG_B PORTC.1
    #define DISP_SEG_C PORTC.2
    #define DISP_SEG_D PORTC.3
    #define DISP_SEG_E PORTC.4
    #define DISP_SEG_F PORTC.5
    #define DISP_SEG_G PORTC.6
    #define DISP_SEG_DOT PORTC.7

    #define Disp_Sel_1 PortA.1
    #define Disp_Sel_2 PortA.2
    #define Disp_Sel_3 PortA.3

    dim count as word
    dim number as word

    Do Forever
      For count = 0 to 999
          number = count
          Num2 = 0
          Num3 = 0
          If number >= 100 Then
            Num3 = number / 100
            'SysCalcTempX is the remainder after a division has been completed
            number = SysCalcTempX
          End if
          If number >= 10 Then
            Num2 = number / 10
            number = SysCalcTempX
          end if
          Num1 = number
          Repeat 10
            DisplayValue 1, Num1, 1 'Optional third parameter turns on the dp on that digit
            wait 5 ms
            DisplayValue 2, Num2
            wait 5 ms
            DisplayValue 3, Num3
            wait 5 ms
           end Repeat
      Next
    Loop
```

<span class="strong">**Also, see**</span>
<a href="7_segment_displays_overview" class="link" title="7 Segment Displays Overview">7 Degment Display Overview</a>,
<a href="displaychar" class="link" title="DisplayChar">DisplayChar</a>,
<a href="displayvalue" class="link" title="DisplayValue">DisplayValue</a>

</div>
