<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="_ads_7843_serial_driver"></span>ADS 7843 Serial Driver

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    ADS7843_Init

    ADS7843_GetXY

    ADS7843_SetPrecision
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers. Requires the inclusion of the
following:

``` screen
    #include <ADS7843.h>
```

<span class="strong">**Explanation:**</span>

The ADS7843 device is a 12-bit sampling Analog-to-Digital Converter
(ADC) with a synchronous serial interface and low on resistance switches
for driving touch screens.

The GCBASIC driver is integrated with the SDD1289 GLCD driver. To use
the ADS7843 driver the following is required to added to the GCBASIC
source file.

`ADS7843_Init` is required to initialise the touch screen. This is
mandated.

`ADS7843_GetXY` this sub-routine returns the X and Y coordinates of
touched point.

`ADS7843_SetPrecision` this sub-routine sets the level of precision of
the touch screen.

<span class="strong">**Required Constants:**</span>

<div class="informaltable">

| <span class="strong">**Constants**</span> | <span class="strong">**Controls/Direction**</span> | <span class="strong">**Default Value**</span> |
|:------------------------------------------|:---------------------------------------------------|:----------------------------------------------|
| ADS7843\_DOUT (IN)                        | The chip output pin                                | Mandated                                      |
| ADS7843\_IRQ (IN)                         | The interrupt pin                                  | Mandated                                      |
| ADS7843\_CS (OUT)                         | The chip select pin                                | Mandated                                      |
| ADS7843\_CLK (OUT)                        | The clock pin                                      | Mandated                                      |
| ADS7843\_DIN (OUT)                        | The chip input pin                                 | Mandated                                      |

</div>

The GCBASIC commands supported for this chip are:

<div class="informaltable">

<table data-border="1">
<thead>
<tr class="header">
<th style="text-align: left;"><span class="strong"><strong>Command</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Purpose</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Example</strong></span></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><p>ADS7843_Init</p></td>
<td style="text-align: left;"><p>Initialise the device.</p></td>
<td style="text-align: left;"><p>ADS7843_Init [Optional precision = PREC_EXTREME]</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>ADS7843_GetXY</p></td>
<td style="text-align: left;"><p>Returns the X and Y coordinates of touched point.</p></td>
<td style="text-align: left;"><p>ADS7843_GetXY (TP_X, TP_Y )</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>ADS7843_SetPrecision</p></td>
<td style="text-align: left;"><p>Set the precision of the conversion result.</p></td>
<td style="text-align: left;"><p>ADS7843_SetPrecision(precision)<br />
(with PREC_EXTREME the conversion error is less than 3%)</p></td>
</tr>
</tbody>
</table>

</div>

Precision can be set to four values as shown in the table below. Passing
a parameter of ADS7843\_SetPrecision changes the precision controls.

<div class="informaltable">

| <span class="strong">**Constants**</span> | <span class="strong">**Defined Value**</span> | <span class="strong">**Default Value**</span> |
|:------------------------------------------|:----------------------------------------------|:----------------------------------------------|
| `#define PREC_LOW`                        | `1`                                           |                                               |
| `#define PREC_MEDIUM`                     | `2`                                           |                                               |
| `#define PREC_HI`                         | `3`                                           |                                               |
| `#define  PREC_EXTREME`                   | `4`                                           | Default Value                                 |

</div>

<span class="strong">**Example:**</span>

For more information see <http://www.ti.com/product/ads7843>.

This example shows how to drive a SDD1289 based Graphic LCD module with
ADS7843 touch controller.

``` screen
    'Chip Settings
    #chip mega2560, 16

    'Include for GLCD
    #include <glcd.h>

    'Include for ADS7843
    #include  <ADS7843.h>

    'GLCD Device Selection
    #DEFINE GLCD_TYPE GLCD_TYPE_SSD1289
    'Define ports for the SSD1289 display - ALL are required
    #DEFINE GLCD_WR   PORTG.2
    #DEFINE GLCD_CS   PORTG.1
    #DEFINE GLCD_RS   PORTD.7
    #DEFINE GLCD_RST  PORTG.0

    #DEFINE GLCD_DB0  PORTC.0
    #DEFINE GLCD_DB1  PORTC.1
    #DEFINE GLCD_DB2  PORTC.2
    #DEFINE GLCD_DB3  PORTC.3
    #DEFINE GLCD_DB4  PORTC.4
    #DEFINE GLCD_DB5  PORTC.5
    #DEFINE GLCD_DB6  PORTC.6
    #DEFINE GLCD_DB7  PORTC.7
    #DEFINE GLCD_DB8  PORTA.0
    #DEFINE GLCD_DB9  PORTA.1
    #DEFINE GLCD_DB10 PORTA.2
    #DEFINE GLCD_DB11 PORTA.3
    #DEFINE GLCD_DB12 PORTA.4
    #DEFINE GLCD_DB13 PORTA.5
    #DEFINE GLCD_DB14 PORTA.6
    #DEFINE GLCD_DB15 PORTA.7

    'GLCD font control
    #DEFINE GLCD_EXTENDEDFONTSET1

    'Define ports for ADS7843
    #define ADS7843_DOUT   PORTE.5  ' Arduino Mega D3
    #define ADS7843_IRQ    PORTE.4  ' Arduino Mega D2
    #define ADS7843_CS     PORTE.3  ' Arduino Mega D5
    #define ADS7843_CLK    PORTH.3  ' Arduino Mega D6
    #define ADS7843_DIN    PORTG.5  ' Arduino Mega D4
    #define ADS7843_BUSY   PORTH.4  ' Arduino Mega D7

    Wait 100 ms
    num=0
    Do Forever

      'Library function
      if ADS7843_IRQ=0 then

         num++
         GLCDPrint  10, 15,  str(num),SSD1289_YELLOW, 2

         'Libary sub routine - returns two variables
         ADS7843_GetXY ( TP_X , TP_Y )

         if TP_X>=100 then GLCDPrint  100, 50, Str(TP_X),SSD1289_YELLOW, 2
         if TP_X>=10 and TP_X<100 then GLCDPrint  100, 50, Str(TP_X)+" ",SSD1289_YELLOW, 2
         if TP_X<10 then GLCDPrint  100, 50,  Str(TP_X)+" ",SSD1289_YELLOW, 2
         if TP_Y>=100 then GLCDPrint  100, 70, Str(TP_Y),SSD1289_YELLOW, 2
         if TP_Y>=10 and TP_Y<100 then GLCDPrint  100, 70, Str(TP_Y)+" ", SSD1289_YELLOW, 2
         if TP_Y<10 then GLCDPrint  100, 70,  Str(TP_Y)+" ",SSD1289_YELLOW, 2

         'Set the pixel to yellow using the GLCD PSET sub routine
         Pset TP_X,  TP_Y, SSD1289_YELLOW

      end if
      Wait 1 ms

    Loop
```

</div>
