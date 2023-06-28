<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="ks0108_controllers"></span>KS0108 Controllers

</div>

</div>

</div>

This section covers GLCD devices that use the KS0108 graphics
controller.

The KS0108 is an LCD is driven by on-board 5V parallel interface chipset
KS0108 and KS0107. They are extremely common and well documented

The GCBASIC constants shown below control the configuration of the
KS0108 controller.    The only connectivity option is the 8-bit mode
where 8 connections (for the data) are required between the
microcontroller and the GLCD to control the data bus.

The KS0108 is a monochrome device.

To use the KS0108 driver simply include the following in your user code.
This will initialise the driver.

``` screen
    #include <glcd.h>
    #DEFINE GLCD_TYPE GLCD_TYPE_KS0108


    #define GLCD_RW       PORTB.1            'chip specific configuration
    #define GLCD_RESET    PORTB.5            'chip specific configuration
    #define GLCD_CS1      PORTB.3            'chip specific configuration
    #define GLCD_CS2      PORTB.4            'chip specific configuration
    #define GLCD_RS       PORTB.0            'chip specific configuration
    #define GLCD_ENABLE   PORTB.2            'chip specific configuration
    #define GLCD_DB0      PORTC.7            'chip specific configuration
    #define GLCD_DB1      PORTC.6            'chip specific configuration
    #define GLCD_DB2      PORTC.5            'chip specific configuration
    #define GLCD_DB3      PORTC.4            'chip specific configuration
    #define GLCD_DB4      PORTC.3            'chip specific configuration
    #define GLCD_DB5      PORTC.2            'chip specific configuration
    #define GLCD_DB6      PORTC.1            'chip specific configuration
    #define GLCD_DB7      PORTC.0            'chip specific configuration
```

The GCBASIC constants for the interface to the controller are shown in
the table below.

<div class="informaltable">

<table data-border="1">
<thead>
<tr class="header">
<th style="text-align: left;"><span class="strong"><strong>Constants</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Controls</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Options</strong></span></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCD_TYPE</code></p></td>
<td style="text-align: left;"><p><code class="literal">GLCD_TYPE_KS0108</code></p></td>
<td style="text-align: left;"> </td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">GLCD_RS</code></p></td>
<td style="text-align: left;"><p>Specifies the output pin that is connected to Register Select on the GLCD.</p></td>
<td style="text-align: left;"><p>Required</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCD_RW</code></p></td>
<td style="text-align: left;"><p>Specifies the output pin that is connected to Read/Write on the GLCD. The R/W pin can be disabled.</p></td>
<td style="text-align: left;"><p><span class="strong"><strong><span class="emphasis"><em>Must be defined</em></span></strong></span> <span class="emphasis"><em>(unless R/W is disabled)<br />
see</em></span> <code class="literal">GLCD_NO_RW</code></p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">GLCD_CS1</code></p></td>
<td style="text-align: left;"><p>Specifies the output pin that is connected to <code class="literal">CS1</code> on the GLCD.</p></td>
<td style="text-align: left;"><p>Required</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCD_CS2</code></p></td>
<td style="text-align: left;"><p>Specifies the output pin that is connected to <code class="literal">CS2</code> on the GLCD.</p></td>
<td style="text-align: left;"><p>Required</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">GLCD_ENABLE</code></p></td>
<td style="text-align: left;"><p>Specifies the output pin that is connected to <code class="literal">Enable</code> on the GLCD.</p></td>
<td style="text-align: left;"><p>Required</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCD_DB0</code></p></td>
<td style="text-align: left;"><p>Specifies the output pin that is connected to <code class="literal">DB0</code> on the GLCD.</p></td>
<td style="text-align: left;"><p>Required</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">GLCD_DB1</code></p></td>
<td style="text-align: left;"><p>Specifies the output pin that is connected to <code class="literal">DB1</code> on the GLCD.</p></td>
<td style="text-align: left;"><p>Required</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCD_DB2</code></p></td>
<td style="text-align: left;"><p>Specifies the output pin that is connected to <code class="literal">DB2</code> on the GLCD.</p></td>
<td style="text-align: left;"><p>Required</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">GLCD_DB3</code></p></td>
<td style="text-align: left;"><p>Specifies the output pin that is connected to <code class="literal">DB3</code> on the GLCD.</p></td>
<td style="text-align: left;"><p>Required</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCD_DB4</code></p></td>
<td style="text-align: left;"><p>Specifies the output pin that is connected to <code class="literal">DB4</code> on the GLCD.</p></td>
<td style="text-align: left;"><p>Required</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">GLCD_DB5</code></p></td>
<td style="text-align: left;"><p>Specifies the output pin that is connected to <code class="literal">DB5</code> on the GLCD.</p></td>
<td style="text-align: left;"><p>Required</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCD_DB6</code></p></td>
<td style="text-align: left;"><p>Specifies the output pin that is connected to <code class="literal">DB6</code> on the GLCD.</p></td>
<td style="text-align: left;"><p>Required</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">GLCD_DB7</code></p></td>
<td style="text-align: left;"><p>Specifies the output pin that is connected to <code class="literal">DB7</code> on the GLCD.</p></td>
<td style="text-align: left;"><p>Required</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCD_NO_RW</code></p></td>
<td style="text-align: left;"><p>Disables read/write inspection of the device during read/write operations</p></td>
<td style="text-align: left;"><p>Optional, but recommend NOT to set. The R/W pin can be disabled by setting the <code class="literal">GLCD_NO_RW</code> constant. If this is done, there is no need for the R/W to be connected to the chip, and no need for the <code class="literal">LCD_RW</code> constant to be set. Ensure that the R/W line on the LCD is connected to ground if not used.</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">GLCD_DATA_PORT</code></p></td>
<td style="text-align: left;"><p>Not Available for this controller.</p></td>
<td style="text-align: left;"><p>Not applicable.</p></td>
</tr>
</tbody>
</table>

</div>

The GCBASIC constants defined for the controller type are shown in the
table below.

<div class="informaltable">

<table data-border="1">
<thead>
<tr class="header">
<th style="text-align: left;"><span class="strong"><strong>Constants</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Controls</strong></span></th>
<th style="text-align: center;"><span class="strong"><strong>Default</strong></span></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCD_WIDTH</code></p></td>
<td style="text-align: left;"><p>The width parameter of the GLCD</p></td>
<td style="text-align: center;"><p><code class="literal">128</code> This constant cannot be changed</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">GLCD_HEIGHT</code></p></td>
<td style="text-align: left;"><p>The height parameter of the GLCD</p></td>
<td style="text-align: center;"><p><code class="literal">64</code> This constant cannot be changed</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCDDirection</code></p></td>
<td style="text-align: left;"><p>Defining this will invert the Y Axis</p></td>
<td style="text-align: center;"><p>Not defined</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">KS0108ReadDelay</code></p></td>
<td style="text-align: left;"><p>Read delay</p></td>
<td style="text-align: center;"><p>Default is 9</p>
<p>Can be set to improve overall performance.</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">KS0108WriteDelay</code></p></td>
<td style="text-align: left;"><p>Write delay</p></td>
<td style="text-align: center;"><p>Default is 1</p>
<p>Can be set to improve performance.</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">KS0108ClockDelay</code></p></td>
<td style="text-align: left;"><p>Clock Delay</p></td>
<td style="text-align: center;"><p>Default is 1</p>
<p>Can be set to improve performance.</p></td>
</tr>
</tbody>
</table>

</div>

The GCBASIC constants for control display characteristics are shown in
the table below.

<div class="informaltable">

<table data-border="1">
<thead>
<tr class="header">
<th style="text-align: left;"><span class="strong"><strong>Variables</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Controls</strong></span></th>
<th style="text-align: center;"><span class="strong"><strong>Default</strong></span></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCDFontWidth</code></p></td>
<td style="text-align: left;"><p>Width of the current GLCD font.</p></td>
<td style="text-align: center;"><p>Default is 6 pixels.</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">GLCDfntDefault</code></p></td>
<td style="text-align: left;"><p>Size of the current GLCD font.</p></td>
<td style="text-align: center;"><p>Default is 0.</p>
<p>This equates to the standard GCB font set.</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCDfntDefaultsize</code></p></td>
<td style="text-align: left;"><p>Size of the current GLCD font.</p></td>
<td style="text-align: center;"><p>Default is 1.</p>
<p>This equates to the 8 pixel high.</p></td>
</tr>
</tbody>
</table>

</div>

The GCBASIC commands supported for this GLCD are shown in the table
below.

<div class="informaltable">

| <span class="strong">**Command**</span> | <span class="strong">**Purpose**</span>                                                  | <span class="strong">**Example**</span>                                                        |
|:----------------------------------------|:-----------------------------------------------------------------------------------------|:-----------------------------------------------------------------------------------------------|
| `GLCDCLS`                               | Clear screen of GLCD                                                                     | `GLCDCLS`                                                                                      |
| `GLCDPrint`                             | Print string of characters on GLCD using GCB font set                                    | `GLCDPrint( Xposition, Yposition, Stringvariable )`                                            |
| `GLCDDrawChar`                          | Print character on GLCD using GCB font set                                               | `GLCDDrawChar( Xposition, Yposition, CharCode )`                                               |
| `GLCDDrawString`                        | Print characters on GLCD using GCB font set                                              | `GLCDDrawString( Xposition, Yposition, Stringvariable )`                                       |
| `Box`                                   | Draw a box on the GLCD to a specific size                                                | `Box ( Xposition1, Yposition1, Xposition2, Yposition2, [Optional In LineColour as 0 or 1] )`   |
| `FilledBox`                             | Draw a box on the GLCD to a specific size that is filled with the foreground colour.     | `FilledBox (Xposition1, Yposition1, Xposition2, Yposition2, [Optional In LineColour 0 or 1] )` |
| `Line`                                  | Draw a line on the GLCD to a specific length that is filled with the specific attribute. | `Line ( Xposition1, Yposition1, Xposition2, Yposition2, [Optional In LineColour 0 or 1] )`     |
| `PSet`                                  | Set a pixel on the GLCD at a specific position that is set with the specific attribute.  | `PSet(Xposition, Yposition, Pixel Colour 0 or 1)`                                              |
| `GLCDWriteByte`                         | Set a byte value to the controller, see the datasheet for usage.                         | `GLCDWriteByte ( LCDByte)`                                                                     |
| `GLCDReadByte`                          | Read a byte value from the controller, see the datasheet for usage.                      | `bytevariable = GLCDReadByte`                                                                  |

</div>

For a KS0108 datasheet, please refer
<a href="http://www.vishay.com/docs/37329/37329.pdf" class="link">here.</a>

This example shows how to drive a KS0108 based Graphic LCD module with
the built in commands of GCBASIC. See
<a href="http://www.greatcowbasic.com/sample-projects" class="link">Graphic LCD</a>
for details, this is an external web site.

``` screen
    ;Chip Settings
    #chip 16F886,16
    '#config MCLRE = on 'enable reset switch on CHIPINO
    #include <GLCD.h>

    ;Defines (Constants)
    #define GLCD_RW PORTB.1  'D9 to pin 5 of LCD
    #define GLCD_RESET PORTB.5 'D13 to pin 17 of LCD
    #define GLCD_CS1 PORTB.3 'D12 to actually since CS1, CS2 can be reversed on some devices
    #define GLCD_CS2 PORTB.4 'D11 to actually since CS1, CS2 can be reversed on some devices
    #define GLCD_RS PORTB.0  'D8 to pin 4 D/I pin on LCD
    #define GLCD_ENABLE PORTB.2 'D10 to Pin 6 on LCD
    #define GLCD_DB0 PORTC.7 'D0 to pin 7 on LCD
    #define GLCD_DB1 PORTC.6 'D1 to pin 8 on LCD
    #define GLCD_DB2 PORTC.5 'D2 to pin 9 on LCD
    #define GLCD_DB3 PORTC.4 'D3 to pin 10 on LCD
    #define GLCD_DB4 PORTC.3 'D4 to pin 11 on LCD
    #define GLCD_DB5 PORTC.2 'D5 to pin 12 on LCD
    #define GLCD_DB6 PORTC.1 'D6 to pin 13 on LCD
    #define GLCD_DB7 PORTC.0 'D7 to pin 14 on LCD

    Do forever
        GLCDCLS
        GLCDPrint 0,10,"Hello" 'Print Hello
        wait 5 s
        GLCDPrint 0,10, "ASCII #:" 'Print ASCII #:
        Box 18,30,28,40                    'Draw Box Around ASCII Character
        for char = 15 to 129            'Print 0 through 9
          GLCDPrint 17, 20 , Str(char)+"  "
          GLCDdrawCHAR 20,30, char
          wait 125 ms
        next
        line 0,50,127,50                'Draw Line using line command
        for xvar = 0 to 80            'draw line using Pset command
            pset xvar,63,on                    '
        next                                        '
        Wait 1 s
        GLCDPrint 0,10,"End  " 'Print Hello
        wait 1 s
    Loop
```

<span class="strong">**For more help, see**</span>
<a href="glcdcls" class="link" title="GLCDCLS">GLCDCLS</a>,
<a href="glcddrawchar" class="link" title="GLCDDrawChar">GLCDDrawChar</a>,
<a href="glcdprint" class="link" title="GLCDPrint">GLCDPrint</a>,
<a href="glcdreadbyte" class="link" title="GLCDReadByte">GLCDReadByte</a>,
<a href="glcdwritebyte" class="link" title="GLCDWriteByte">GLCDWriteByte</a>
or <a href="pset" class="link" title="Pset">Pset</a>

Supported in &lt;GLCD.H&gt;

</div>
