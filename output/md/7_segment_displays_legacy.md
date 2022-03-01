<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="7_segment_displays_legacy"></span>7 Segment Displays - Legacy

</div>

</div>

</div>

<span class="strong">**Introduction**</span>

The Great Cow BASIC 7 segment display methods make it easier for Great
Cow BASIC programs to display numbers and letters on 7 segment LED
displays.

The Great Cow BASIC methods support up to four digit 7 segment display
devices, common anode/cathode and inversion of the port logic to support
driving the device(s) via a transistor.

There are three ways that the 7 segment display routines can be set up.

<div class="informaltable">

<table data-border="1">
<thead>
<tr class="header">
<th style="text-align: left;"><span class="strong"><strong>Method</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Description</strong></span></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><p>1</p></td>
<td style="text-align: left;"><p>Connect the microcontroller to the 7 segment display (via suitable resistors) using any eight output bits.</p>
<p>Use <code class="literal">DISP_SEG_x</code> and <code class="literal">DISP_SEL_x</code> constants to specify the outpout ports and the select port(s) to be used.</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>2</p></td>
<td style="text-align: left;"><p>Connect the microcontroller to the 7 segment display (via suitable resistors) using whole port (8 bits) of the microcontroller.</p>
<p>This implies the connections are consectutive in terms of the 8 output bits of the port.</p>
<p>Use the <code class="literal">DISPLAYPORTn</code> and <code class="literal">DISPSELECTn</code> constants to specify the whole port and the select port(s) to be used.</p>
<p>This method will generate the most efficient code.</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>3</p></td>
<td style="text-align: left;"><p>Connect the microcontroller to the 7 segment display (via suitable resistors) using whole port (8 bits) of the microcontroller.</p>
<p>This implies the connections are consectutive in terms of the 8 output bits of the port.</p>
<p>Use the <code class="literal">DISPLAYPORTn</code> and <code class="literal">DISP_SEL_n</code> constants to specify the whole port and the select port(s) to be used.</p></td>
</tr>
</tbody>
</table>

</div>

The Great Cow BASIC methods assume the 7 segment display(s) is to be
connected to a common parallel bus with a Common Cathode. See the
sections
<a href="common_cathode" class="link" title="Common Cathode">Common Cathode</a>
and
<a href="common_anode" class="link" title="Common Anode">Common Anode</a>
for examples of using Great Cow BASIC code to control these different
configurations

Shown below are the differing constants that must be set for the three
connectivity options.

<div class="informaltable">

<table data-border="1">
<thead>
<tr class="header">
<th style="text-align: left;"><span class="strong"><strong>Index</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Method</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Description</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Constants</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Default Value</strong></span></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><p>1</p></td>
<td style="text-align: left;"><p><code class="literal">DISP_SEG_x</code> &amp; <code class="literal">DISP_SEL_x</code></p></td>
<td style="text-align: left;"> </td>
<td style="text-align: left;"> </td>
<td style="text-align: left;"> </td>
</tr>
<tr class="even">
<td style="text-align: left;"> </td>
<td style="text-align: left;"> </td>
<td style="text-align: left;"><p><code class="literal">DISP_SEG_x</code></p></td>
<td style="text-align: left;"><p>Specifies the output pin (output bit) used to control a specific segment of the 7 segment display.</p>
<p>There are seven constants that must be specified.</p>
<p><code class="literal">DISP_SEG_A</code> through <code class="literal">DISP_SEG_G</code>. One must be set for each segment.</p>
<p>Typical commands are:</p>
<p><code class="literal">#define DISP_SEG_A portA.0</code></p>
<p><code class="literal">#define DISP_SEG_B portA.1</code></p>
<p><code class="literal">#define DISP_SEG_C portA.2</code></p>
<p><code class="literal">#define DISP_SEG_D portA.3</code></p>
<p><code class="literal">#define DISP_SEG_E portA.4</code></p>
<p><code class="literal">#define DISP_SEG_F portA.5</code></p>
<p><code class="literal">#define DISP_SEG_G portA.6</code></p></td>
<td style="text-align: left;"><p>Must be specified to use this connectivity option.</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"> </td>
<td style="text-align: left;"> </td>
<td style="text-align: left;"><p><code class="literal">DISP_SEG_DOT</code></p></td>
<td style="text-align: left;"><p>Specifies the output pin (output bit) used to control the decimal point on the 7 segment display.</p>
<p>Typical commands are:</p>
<p><code class="literal">#define DISP_SEG_DOT portA.7</code></p></td>
<td style="text-align: left;"><p>Optional.</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"> </td>
<td style="text-align: left;"> </td>
<td style="text-align: left;"><p><code class="literal">DISP_SEL_x</code></p></td>
<td style="text-align: left;"><p>Specifies the output pin (output bit) used to control a specific 7 segment display.</p>
<p>These constants are used to control the specific 7 segment display being addresses.</p>
<p>Typical commands are:</p>
<p><code class="literal">#define DISP_SEL_1 portA.0</code></p>
<p><code class="literal">#define DISP_SEL_2 portA.1</code></p></td>
<td style="text-align: left;"><p>A valid output pin (output bit) must be specified. Must be specified to use this connectivity option.</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>2</p></td>
<td style="text-align: left;"><p><code class="literal">DISPLAYPORTn</code> &amp; <code class="literal">DISPSELECTn</code></p></td>
<td style="text-align: left;"> </td>
<td style="text-align: left;"> </td>
<td style="text-align: left;"> </td>
</tr>
<tr class="even">
<td style="text-align: left;"> </td>
<td style="text-align: left;"> </td>
<td style="text-align: left;"><p><code class="literal">DISPLAYPORTn</code></p></td>
<td style="text-align: left;"><p>Specifies the output port used to control the 7 segment display.</p>
<p>Port.bit &gt;&gt; Segment</p>
<p>port.0 &gt;&gt; A</p>
<p>port.1 &gt;&gt; B</p>
<p>port.2 &gt;&gt; C</p>
<p>port.3 &gt;&gt; D</p>
<p>port.4 &gt;&gt; E</p>
<p>port.5 &gt;&gt; F</p>
<p>port.6 &gt;&gt; G</p></td>
<td style="text-align: left;"><p>Can be <code class="literal">DISPLAYPORTA</code> and/or <code class="literal">DISPLAYPORTB</code> and/or <code class="literal">DISPLAYPORTC</code> and/or <code class="literal">DISPLAYPORTD</code></p>
<p>Where <code class="literal">DISPLAYPORTn</code> can be A, B, C or D which corresponding to displays 1, 2, 3 and 4, respectively.</p>
<p>Must be specified to use this connectivity option.</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"> </td>
<td style="text-align: left;"> </td>
<td style="text-align: left;"><p><code class="literal">DISPSELECTn</code></p></td>
<td style="text-align: left;"><p>Specifies the output command used to <span class="strong"><strong>select</strong></span> a specific 7 segment display addressed by <code class="literal">DISPLAYPORT_n</code>.</p>
<p>Used to control output pin (output bit) when several displays are multiplexed.</p>
<p>Typical commands are: <code class="literal">#define DispSelectA Set portA.0 on</code></p>
<p><code class="literal">#define DispSelectB Set portA.1 on</code></p></td>
<td style="text-align: left;"><p>Can be <code class="literal">DISPSELECTA</code> and/or <code class="literal">DISPSELECTB</code> and/or <code class="literal">DISPSELECTC</code> and/or <code class="literal">DISPSELECTD</code></p>
<p>Must be specified to use this connectivity option.</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"> </td>
<td style="text-align: left;"> </td>
<td style="text-align: left;"><p><code class="literal">DISPDESELECTn</code></p></td>
<td style="text-align: left;"><p>An optional command to specify the output command used to <span class="strong"><strong>deselect</strong></span> a specific 7 segment display addressed by <code class="literal">DISPLAYPORT_n</code>.</p>
<p>Used to control output pin (output bit) when several displays are multiplexed.</p>
<p>Typical commands are:</p>
<p><code class="literal">#define DispDeSelectA Set portA.0 off</code></p>
<p><code class="literal">#define DispDeSelectB Set portA.1 off</code></p></td>
<td style="text-align: left;"><p>Can be <code class="literal">DISPDESELECTA</code> and/or <code class="literal">DISPDESELECTB</code> and/or <code class="literal">DISPDESELECTC</code> and/or <code class="literal">DISPDESELECTD</code></p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>3</p></td>
<td style="text-align: left;"><p><code class="literal">DISPLAYPORTn</code> &amp; <code class="literal">DISP_SEL_n</code></p></td>
<td style="text-align: left;"> </td>
<td style="text-align: left;"> </td>
<td style="text-align: left;"> </td>
</tr>
<tr class="even">
<td style="text-align: left;"> </td>
<td style="text-align: left;"> </td>
<td style="text-align: left;"><p><code class="literal">DISPLAYPORTn</code></p></td>
<td style="text-align: left;"><p>Specifies the output port used to control the 7 segment display.</p>
<p>Port.bit &gt;&gt; Segment</p>
<p>port.0 &gt;&gt; A</p>
<p>port.1 &gt;&gt; B</p>
<p>port.2 &gt;&gt; C</p>
<p>port.3 &gt;&gt; D</p>
<p>port.4 &gt;&gt; E</p>
<p>port.5 &gt;&gt; F</p>
<p>port.6 &gt;&gt; G</p></td>
<td style="text-align: left;"><p>Can be <code class="literal">DISPLAYPORTA</code> and/or <code class="literal">DISPLAYPORTB</code> and/or <code class="literal">DISPLAYPORTC</code> and/or <code class="literal">DISPLAYPORTD</code></p>
<p>Where <code class="literal">DISPLAYPORTn</code> can be A, B, C or D which corresponding to displays 1, 2, 3 and 4, respectively.</p>
<p>Must be specified to use this connectivity option.</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"> </td>
<td style="text-align: left;"> </td>
<td style="text-align: left;"><p><code class="literal">DISP_SEL_n</code></p></td>
<td style="text-align: left;"><p>Specifies the output command used to select a specific 7 segment display addressed by <code class="literal">DISPLAYPORTn</code>.</p>
<p>Typical commands are:</p>
<p><code class="literal">#define DISP_SEL_1 portA.0</code></p>
<p><code class="literal">#define DISP_SEL_2 portA.1</code></p></td>
<td style="text-align: left;"><p>Must be specified to use this connectivity option.</p>
<p>Can be specified as <code class="literal">DISP_SEL_1</code> and/or <code class="literal">DISP_SEL_2</code> and/or <code class="literal">DISP_SEL_3</code> and/or <code class="literal">DISP_SEL_4</code></p></td>
</tr>
</tbody>
</table>

</div>

<span class="strong">**Example 1:**</span>

``` screen
 'A Common Cathode 7 Segment display  2 digit example

 #chip 16F886, 8

    'support for Common Anode
    '#define 7Seg_CommonAnode

    'support for pfet or pnp high side drivers
    '#define 7Seg_HighSide

' ----- Constants
    ' You need to specify the port settings
    ' by one of the following three methods
    'The Directions of the ports are automaically set according to the defines
  '''METHOD 1  Define individual port pins for segments and selects
    #define DISP_SEG_A PORTB.0
    #define DISP_SEG_B PORTB.1
    #define DISP_SEG_C PORTB.2
    #define DISP_SEG_D PORTB.3
    #define DISP_SEG_E PORTB.4
    #define DISP_SEG_F PORTB.5
    #define DISP_SEG_G PORTB.6
    #define DISP_SEG_DOT PORTB.7 '' available on some displays as dp or colon

    #define DISP_SEL_1 PORTC.5
    #define DISP_SEL_2 PORTC.4

  '''METHOD 2  Define DISPLAYPORTA (B,C,D) for up to 4 digit display segments
        ''Define DISPSELECTA (B,C,D) for up to 4 digit display selects
    '#define DISPLAYPORTA PORTB   ' same port name can be assigned
    '#define DISPLAYPORTB PORTB

    '#define DispSelectA Set portC.5 off
    '#define DispSelectB Set portC.4 off
    '#define DispDeSelectA Set portC.5 on
    '#define DispDeSelectB Set portC.4 on

  '''METHOD 3  Define DISPLAYPORTA (B,C,D) for up to 4 digit display segments
        ''Define port pins for the digit display  selects
    '#define DISPLAYPORTA PORTB
    '#define DISPLAYPORTB PORTB

    '#define DISP_SEL_1 PORTC.5
    '#define DISP_SEL_2 PORTC.4



    Dim Message As String
    Message = " HAPPY HOLIDAYS  "
    Do
    For Counter = 1 to len(Message)-1
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

<div class="informalfigure">

<div class="mediaobject" align="center">

![graphic](./images/CC_4dig_7seg_16F886_Schem.jpg)

</div>

</div>

<div class="informalfigure">

<div class="mediaobject" align="center">

![graphic](./images/CA_2Dig_7seg_16F886_schem.jpg)

</div>

</div>

<span class="strong">**Also, see**</span>
<a href="displaychar" class="link" title="DisplayChar">DisplayChar</a>,
<a href="displayvalue" class="link" title="DisplayValue">DisplayValue</a>

</div>
