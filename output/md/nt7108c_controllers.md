<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="nt7108c_controllers"></span>NT7108C Controllers

</div>

</div>

</div>

This section covers GLCD devices that use the NT7108C graphics
controller.  
  
The NT7108C is an GLCD is driven by on-board 5V parallel interface
chipset NT7108C.   They are similar to the KS0108.  
  
The GLCD controller is the Winstar WDG0151-TMI module, which is a 128×64
pixel monochromatic display.    It uses two Neotic display controller
chips: NT7108C and NT7107C, which are similar with Samsung KS0108B and
KS0107B controllers.    The controller uses a dot matrix LCD segment
driver with 64 channel output, and therefore, the WDG0151 module
contains two sets of it to drive 128 segments.  
  
The GCBASIC constants shown below control the configuration of the
NT7108C controller.    The connectivity options are as follows, This is
required between the microcontroller and the GLCD to control the data
bus.:

<div class="itemizedlist">

-   A full port mode.   Where a full data port therefore eight
    contiguous port.bits.   The port is used the data communications.
-   Eight port.bits mode.   This option allows for greater flexibility
    with the configuration but will operate slower then the full port
    mode.   These port.bits are used the data communications.  
    To use the NT7108C driver simply include the following in your user
    code. This will initialise the driver.  
      

</div>

``` screen
    ;Full port mode
    #include <glcd.h>
    #DEFINE GLCD_TYPE GLCD_TYPE_NT7108C


   #define GLCD_DATA_PORT PORTD       'Data Port

   #define GLCD_CS1 PORTC.1           'CS1 control line
   #define GLCD_CS2 PORTC.0           'CS2 control line
   #define GLCD_RS PORTe.0            'RS control line
   #define GLCD_Enable PORTe.2        'Enable control line
   #define GLCD_RW PORTc.3            'RW control line
   #define GLCD_RESET PORTC.2         'Reset control line
```

or

``` screen
    ;Eight port.bits mode
    #include <glcd.h>
    #DEFINE GLCD_TYPE GLCD_TYPE_NT7108C


    ;Defines (Constants)
    ;Define port as 8 port,bit(s)
    #define GLCD_DB0 PORTA.2    'Data Port.bit 0
    #define GLCD_DB1 PORTC.0    'Data Port.bit 1
    #define GLCD_DB2 PORTC.1    'Data Port.bit 2
    #define GLCD_DB3 PORTC.2    'Data Port.bit 3
    #define GLCD_DB4 PORTB.4    'Data Port.bit 4
    #define GLCD_DB5 PORTB.5    'Data Port.bit 5
    #define GLCD_DB6 PORTB.6    'Data Port.bit 6
    #define GLCD_DB7 PORTB.7    'Data Port.bit 7
    ;End of define as 8 port,bit(s)

    #define GLCD_CS1 PORTC.7    'CS1 control line
    #define GLCD_CS2 PORTC.6    'CS2 control line
    #define GLCD_RS PORTC.5     'RS control line
    #define GLCD_ENABLE PORTA.4 'Enable control line
    #define GLCD_RW PORTC.4     'RW control line
    #define GLCD_RESET PORTC.3  'Reset control line
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
<td style="text-align: left;"><p><code class="literal">GLCD_TYPE_NT7108C</code></p></td>
<td style="text-align: left;"> </td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">GLCD_RS</code></p></td>
<td style="text-align: left;"><p>Specifies the output pin that is connected to Register Select on the GLCD.</p></td>
<td style="text-align: left;"><p>Required</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCD_RW</code></p></td>
<td style="text-align: left;"><p>Specifies the output pin that is connected to Read/Write on the GLCD.</p></td>
<td style="text-align: left;"><p>Required</p></td>
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
<td style="text-align: left;"><p>Full port mode</p></td>
<td style="text-align: left;"> </td>
<td style="text-align: left;"> </td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">GLCD_DATA_PORT</code></p></td>
<td style="text-align: left;"><p>Specifies the port that is connected to 8 connections on the GLCD.</p></td>
<td style="text-align: left;"><p>Required when using full port mode</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>Eight port.bits mode</p></td>
<td style="text-align: left;"> </td>
<td style="text-align: left;"> </td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">GLCD_DB0</code><br />
<code class="literal">GLCD_DB1</code><br />
..<br />
<code class="literal">GLCD_DB7</code></p></td>
<td style="text-align: left;"><p>Specifies the port.bit that is connected to a single connection on the GLCD.</p></td>
<td style="text-align: left;"><p>Required when using eight port.bits mode</p></td>
</tr>
</tbody>
</table>

</div>

The GCBASIC constants defined for the controller type are shown in the
table below. The NT7108C is very sensitive to clock timings.   You may
to adjust the clock timing to ensure the display operates correctly.

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
<td style="text-align: left;"><p><code class="literal">NT7108CReadDelay</code></p></td>
<td style="text-align: left;"><p>Read delay</p></td>
<td style="text-align: center;"><p>Default is 7</p>
<p>Can be set to improve overall performance.</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">NT7108CWriteDelay</code></p></td>
<td style="text-align: left;"><p>Write delay</p></td>
<td style="text-align: center;"><p>Default is 7</p>
<p>Can be set to improve performance.</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">NT7108CClockDelay</code></p></td>
<td style="text-align: left;"><p>Clock Delay</p></td>
<td style="text-align: center;"><p>Default is 7</p>
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

For a NT7108C datasheet, please refer
<a href="http://www.farnell.com/datasheets/1878006.pdf" class="link">here.</a>

This example shows how to drive a NT7108C based Graphic LCD module with
the built in commands of GCBASIC. See
<a href="https://github.com/Anobium/Great-Cow-BASIC-Demonstration-Sources/" class="link">Graphic LCD</a>
for details, this is an external web site.

``` screen
  ;Chip Settings
  #chip 16F1939,32
  #option explicit
  #config MCLRE_On

   #include <glcd.h>
   #define GLCD_TYPE GLCD_TYPE_NT7108C               ' Specify the GLCD type
   #define GLCDDirection 0                           ' Flip the GLCD   0 do not flip, 1 flip

   'Setup the device
   #define GLCD_CS1 PORTC.1    'D12 to actually since CS1, CS2 can be reversed on some devices
   #define GLCD_CS2 PORTC.0
   #define GLCD_DATA_PORT PORTD
   #define GLCD_RS PORTe.0
   #define GLCD_Enable PORTe.2
   #define GLCD_RW PORTc.3
   #define GLCD_RESET PORTC.2

   GLCDPrint ( 4,   1, "GCBASIC 2021")                                ; Print some text

   Box  0, 0, 127, 10
   Line 63, 10, 63, 63
   Line 0, 37, 127, 37
   Circle 63, 37, 15

   End
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
