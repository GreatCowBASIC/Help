<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="_glcd_overview"></span>GLCD Overview

</div>

</div>

</div>

The GLCD commands are used to control a Graphical Liquid Crystal Display
(GLCD) based on the a number of GLCD chipsets. These are often 128x64
pixel displays but the size can vary. GLCD devices draw graphical
elements by enabling or disabling pixels.

A GLCD is an upgrade from the popular 16x2 LCDs (see
<a href="_lcd_overview.html" class="link" title="LCD Overview">Liquid Crystal Display Overview</a>
) but the GLCD allows full graphical control of the display.

Typical displays are

<div class="itemizedlist">

-   Color or mono displays
-   Low power white LED, OLED with or without back-light
-   e-Paper with low power consumption
-   Driven by on-board interface chipsets amd/or interface controllers
-   The GLCDs are very common and well documented
-   Small to large view areas
-   Typically requires from 3-pin to 36-pin header connections and 10K
    contrast pot
-   Typically have back-lit pixels
-   Require memory in the microcontroller to support graphial operations
    or can be used in text and picture mode

</div>

GCBASIC makes this type of device easier to control with the commands
for the GLCD.

<span class="strong">**Microcontroller Requirements:**</span> Specific
GLCDs require different configurations of a microcontroller. Parameters
include

<div class="itemizedlist">

-   Communications protocol: These incldue 8 wire bus, I2C, SPI etc
-   Operating votlage: These are typically 3.3v or 5.v
-   Memory required: For full GLCD capabilites you will require 1k or
    more, for text only and JPG mode low memory devices are supported

</div>

Review your choice of microcontroller and GLCD carefully before
commencing your project.

<div class="informaltable">

<table data-border="1">
<thead>
<tr class="header">
<th style="text-align: left;"><span class="strong"><strong>#</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>ChipSet</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Size</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Pixels</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Depth</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Type</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>I/O</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Support</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Operating</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Comments</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Requirements</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Assessment</strong></span></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><p>1</p></td>
<td style="text-align: left;"><p>KS0108</p></td>
<td style="text-align: left;"><p>2.9 inch and less. various sizes</p></td>
<td style="text-align: left;"><p>128 * 64</p></td>
<td style="text-align: left;"><p>Large</p></td>
<td style="text-align: left;"><p>Mono</p></td>
<td style="text-align: left;"><p>LCD typically with backlight</p></td>
<td style="text-align: left;"><p>8-bit parallel PIC and AVR: Software device specific protocol</p></td>
<td style="text-align: left;"><p>Typically operates at VCC 5. Always check voltage specifications 8-bit bus required.</p></td>
<td style="text-align: left;"><p>Bit 7 of the bus is read/write – this could cause potential lockup – this is low risk.   Uses the KS0107B (or NT7107C) a 64-channel common driver which generates the timing signal to control the two KS0108B segment drivers.</p></td>
<td style="text-align: left;"><p>Requires 12 ports/connections.</p></td>
<td style="text-align: left;"><p>These are low cost mono devices.</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>2</p></td>
<td style="text-align: left;"><p>ILI9481</p></td>
<td style="text-align: left;"><p>3.2inch</p></td>
<td style="text-align: left;"><p>320 * 240</p></td>
<td style="text-align: left;"><p>Large</p></td>
<td style="text-align: left;"><p>Color</p></td>
<td style="text-align: left;"><p>TFT LCD 8-bit parallel</p></td>
<td style="text-align: left;"><p>PIC: Set per bit. AVR: via Shield set via AND PORT command</p></td>
<td style="text-align: left;"><p>+VCC from 2.7 to 5. Always check voltage specifications</p></td>
<td style="text-align: left;"><p>UNO shield is excellent. Very fast display.</p></td>
<td style="text-align: left;"><p>SPI requires 4 ports plus 2 ports. Typically 6 in total.</p></td>
<td style="text-align: left;"><p>Good GLCD with very good GLCD performance.</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>3</p></td>
<td style="text-align: left;"><p>PCD8544</p></td>
<td style="text-align: left;"><p>1.77inch</p></td>
<td style="text-align: left;"><p>Nokia 3310 or 5110</p></td>
<td style="text-align: left;"><p>160 * 128</p></td>
<td style="text-align: left;"><p>Small Mono LCD with LED</p></td>
<td style="text-align: left;"><p>SPI</p></td>
<td style="text-align: left;"><p>PIC and AVR: Device specific SPI command, all in software.</p></td>
<td style="text-align: left;"><p>Display can operate in text mode only for low RAM microcontrollers as full GLCD capabilities requires 512bytes of RAM. +VCC 3.3. Always check voltage specifications Nice display. Sensitive to operating voltages.</p></td>
<td style="text-align: left;"><p>Minimum RAM required is 512 bytes then add user variables for graphics mode, this display can operate in text mode only for low RAM microcontrollers.</p></td>
<td style="text-align: left;"><p>SPI requires 4 ports plus 2 ports. Typically 6 in total.</p></td>
<td style="text-align: left;"><p>Good for cost and performance</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>4</p></td>
<td style="text-align: left;"><p>ILI9341</p></td>
<td style="text-align: left;"><p>2.8 Inch or 3.2 Inch</p></td>
<td style="text-align: left;"><p>320 * 240</p></td>
<td style="text-align: left;"><p>Medium</p></td>
<td style="text-align: left;"><p>Color TFT</p></td>
<td style="text-align: left;"><p>SPI PIC and AVR: Hardware and software SPI</p></td>
<td style="text-align: left;"><p>Typically operates at VCC 5. Always check voltage specifications</p></td>
<td style="text-align: left;"><p>+VCC from 2.7 to 5. Always check voltage specifications</p></td>
<td style="text-align: left;"><p>Very nice display.</p></td>
<td style="text-align: left;"><p>SPI requires 4 ports plus 2 ports. Typically 6 in total.</p></td>
<td style="text-align: left;"><p>Good for cost and performance</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>5</p></td>
<td style="text-align: left;"><p>SSD1289</p></td>
<td style="text-align: left;"><p>3.2inch</p></td>
<td style="text-align: left;"><p>240 * 320</p></td>
<td style="text-align: left;"><p>Large</p></td>
<td style="text-align: left;"><p>Color</p></td>
<td style="text-align: left;"><p>TFT LCD</p></td>
<td style="text-align: left;"><p>16-bit parallel AVR: Software device specific protocol.</p></td>
<td style="text-align: left;"><p>Typically operates at VCC 5. Always check voltage specifications</p></td>
<td style="text-align: left;"><p>Mega2560 shield required.</p></td>
<td style="text-align: left;"><p>Connectivity requires 20 ports.</p></td>
<td style="text-align: left;"><p>Good for Mega2560 type shields</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>6</p></td>
<td style="text-align: left;"><p>ST7735</p></td>
<td style="text-align: left;"><p>1.8 Inch</p></td>
<td style="text-align: left;"><p>128 * 64</p></td>
<td style="text-align: left;"><p>Large</p></td>
<td style="text-align: left;"><p>Color</p></td>
<td style="text-align: left;"><p>TFT LCD</p></td>
<td style="text-align: left;"><p>SPI</p></td>
<td style="text-align: left;"><p>PIC and AVR: Hardware and software SPI</p></td>
<td style="text-align: left;"><p>Typically operates at VCC 5. Always check voltage specifications Very nice display.</p></td>
<td style="text-align: left;"><p>SPI requires 4 ports plus 2 ports. Typically 6 in total.</p></td>
<td style="text-align: left;"><p>Good for cost and performance</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>7</p></td>
<td style="text-align: left;"><p>ST7735R</p></td>
<td style="text-align: left;"><p>1.8 Inch</p></td>
<td style="text-align: left;"><p>128 * 160</p></td>
<td style="text-align: left;"><p>Large</p></td>
<td style="text-align: left;"><p>Color</p></td>
<td style="text-align: left;"><p>TFT LCD</p></td>
<td style="text-align: left;"><p>SPI</p></td>
<td style="text-align: left;"><p>PIC and AVR: Hardware and software SPI</p></td>
<td style="text-align: left;"><p>Typically operates at VCC 5. Always check voltage specifications Very nice display.</p></td>
<td style="text-align: left;"><p>SPI requires 4 ports plus 2 ports. Typically 6 in total.</p></td>
<td style="text-align: left;"><p>Good for cost and performance</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>8</p></td>
<td style="text-align: left;"><p>ST7735R_160_80</p></td>
<td style="text-align: left;"><p>1.8 Inch</p></td>
<td style="text-align: left;"><p>160 * 80</p></td>
<td style="text-align: left;"><p>Large</p></td>
<td style="text-align: left;"><p>Color</p></td>
<td style="text-align: left;"><p>TFT LCD</p></td>
<td style="text-align: left;"><p>SPI</p></td>
<td style="text-align: left;"><p>PIC and AVR: Hardware and software SPI</p></td>
<td style="text-align: left;"><p>Typically operates at VCC 5. Always check voltage specifications Very nice display.</p></td>
<td style="text-align: left;"><p>SPI requires 4 ports plus 2 ports. Typically 6 in total.</p></td>
<td style="text-align: left;"><p>Good for cost and performance</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>9</p></td>
<td style="text-align: left;"><p>ILI9340</p></td>
<td style="text-align: left;"><p>2.2 Inch</p></td>
<td style="text-align: left;"><p>240 * 320</p></td>
<td style="text-align: left;"><p>Medium</p></td>
<td style="text-align: left;"><p>Mono</p></td>
<td style="text-align: left;"><p>TFT LCD</p></td>
<td style="text-align: left;"><p>SPI</p></td>
<td style="text-align: left;"><p>PIC and AVR: Hardware and software SPI</p></td>
<td style="text-align: left;"><p>Typically operates at VCC 5. Always check voltage specifications</p></td>
<td style="text-align: left;"><p>SPI requires 4 ports plus 2 ports. Typically 6 in total.</p></td>
<td style="text-align: left;"><p>Good for cost and performance</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>10</p></td>
<td style="text-align: left;"><p>ILI9486L or ILI9486</p></td>
<td style="text-align: left;"><p>4inch</p></td>
<td style="text-align: left;"><p>RPI 240 * 320</p></td>
<td style="text-align: left;"><p>Large</p></td>
<td style="text-align: left;"><p>Color</p></td>
<td style="text-align: left;"><p>TFT LCD</p></td>
<td style="text-align: left;"><p>SPI and 8Bit Bus</p></td>
<td style="text-align: left;"><p>PIC and AVR: Hardware and software SPI AVR: 8Bit Bus using an UNO Shield. PIC: 8bit port suppported.</p></td>
<td style="text-align: left;"><p>Typically operates at VCC 5. Always check voltage specifications Great pixel display.</p></td>
<td style="text-align: left;"><p>SPI requires 4 ports plus 2 ports. Typically 6 in total. 8Bit Bus requires 8 ports plus 4 control ports. Typically 13 in total using an 8bit bus solution.</p></td>
<td style="text-align: left;"><p>An expensive option</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>11</p></td>
<td style="text-align: left;"><p>Nexion</p></td>
<td style="text-align: left;"><p>ITEAD Nexion</p></td>
<td style="text-align: left;"><p>240 * 320 to 800 * 480</p></td>
<td style="text-align: left;"><p>Large - 2.4 to 7inches</p></td>
<td style="text-align: left;"><p>Color</p></td>
<td style="text-align: left;"><p>TFT LCD</p></td>
<td style="text-align: left;"><p>Serial - hardware or software serial is supported.</p></td>
<td style="text-align: left;"><p>Nextion specfic and GLCD command set</p></td>
<td style="text-align: left;"><p>Typically operates at VCC 5 with external power supply. Always check voltage specifications Great command set, you need to learn the GUI and then interface to GCBASIC.</p></td>
<td style="text-align: left;"><p>2 ports for the read/write serial operations.</p></td>
<td style="text-align: left;"><p>A very nice option but if you need flexibility then the best!</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>12</p></td>
<td style="text-align: left;"><p>SH1106</p></td>
<td style="text-align: left;"><p>1.3 inch or 0.96inch</p></td>
<td style="text-align: left;"><p>128 * 64</p></td>
<td style="text-align: left;"><p>Small</p></td>
<td style="text-align: left;"><p>Mono OLED</p></td>
<td style="text-align: left;"><p>I2C</p></td>
<td style="text-align: left;"><p>PIC and AVR: Hardware and software I2C</p></td>
<td style="text-align: left;"><p>Always at 3.3v. Always check voltage specifications</p></td>
<td style="text-align: left;"><p>RAM for Full Mode GLCD is 1024 bytes or Low Memory GLCD is 128 bytes or 0 bytes for Text GLCD Mode then add user variables for graphics mode.</p></td>
<td style="text-align: left;"><p>I2C requires 2 ports.</p></td>
<td style="text-align: left;"><p>Good OLED display, excellent value for money</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>13</p></td>
<td style="text-align: left;"><p>SDD1306</p></td>
<td style="text-align: left;"><p>0.96inch</p></td>
<td style="text-align: left;"><p>128 * 64</p></td>
<td style="text-align: left;"><p>Small</p></td>
<td style="text-align: left;"><p>Mono</p></td>
<td style="text-align: left;"><p>OLED</p></td>
<td style="text-align: left;"><p>I2C and SPI</p></td>
<td style="text-align: left;"><p>PIC and AVR: Hardware and software I2C, and software SPI</p></td>
<td style="text-align: left;"><p>RAM for Full Mode GLCD is 1024 bytes or Low Memory GLCD is 128 bytes or 0 bytes for Text GLCD Mode then add user variables for graphics mode. Typically operates at VCC 5. Always check voltage specifications Very good OLED display. Driver supports gaming. Minimum RAM required is 1024 bytes then add user variables for graphics mode.</p>
<p>Display can operate in text mode only for low RAM microcontrollers</p></td>
<td style="text-align: left;"><p>SPI requires 4 ports plus 2 ports. Typically 6 in total.</p>
<p>I2C requires 2 ports.</p></td>
<td style="text-align: left;"><p>Good OLED display, excellent value for money</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>14</p></td>
<td style="text-align: left;"><p>SDD1306 Twin Screen</p></td>
<td style="text-align: left;"><p>0.96inch * 2</p></td>
<td style="text-align: left;"><p>128 * 128</p></td>
<td style="text-align: left;"><p>Small</p></td>
<td style="text-align: left;"><p>Mono</p></td>
<td style="text-align: left;"><p>OLED</p></td>
<td style="text-align: left;"><p>I2C and SPI</p></td>
<td style="text-align: left;"><p>PIC and AVR: Hardware and software I2C, and software SPI</p></td>
<td style="text-align: left;"><p>RAM for Full Mode GLCD is 2048 bytes or Low Memory GLCD is 128 bytes or 0 bytes for Text GLCD Mode then add user variables for graphics mode. Typically operates at VCC 5. Always check voltage specifications Very good OLED display. Driver supports gaming. Minimum RAM required is 1024 bytes then add user variables for graphics mode.</p>
<p>Display can operate in text mode only for low RAM microcontrollers</p></td>
<td style="text-align: left;"><p>SPI requires 4 ports plus 3 ports. Typically 7 in total.</p>
<p>I2C requires 2 ports.</p></td>
<td style="text-align: left;"><p>Good OLED display, excellent value for money</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>15</p></td>
<td style="text-align: left;"><p>SDD1306_32</p></td>
<td style="text-align: left;"><p>0.96inch</p></td>
<td style="text-align: left;"><p>128 * 32</p></td>
<td style="text-align: left;"><p>Very small</p></td>
<td style="text-align: left;"><p>Mono</p></td>
<td style="text-align: left;"><p>OLED</p></td>
<td style="text-align: left;"><p>I2C and SPI</p></td>
<td style="text-align: left;"><p>PIC and AVR: Hardware and software I2C, and software SPI</p></td>
<td style="text-align: left;"><p>RAM for Full Mode GLCD is 512 bytes or Low Memory GLCD is 128 bytes or 0 bytes for Text GLCD Mode then add user variables for graphics mode. Typically operates at VCC 5. Always check voltage specifications Best small OLED display. Driver supports gaming. Minimum RAM required is 512 bytes then add user variables for graphics mode, this display can operate in text mode only for low RAM microcontrollers</p></td>
<td style="text-align: left;"><p>SPI requires 4 ports plus 2 ports. Typically 6 in total.</p>
<p>I2C requires 2 ports.</p></td>
<td style="text-align: left;"><p>Good OLED display, excellent value for money</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>16</p></td>
<td style="text-align: left;"><p>ST7920</p></td>
<td style="text-align: left;"><p>2.9inch</p></td>
<td style="text-align: left;"><p>128 * 64</p></td>
<td style="text-align: left;"><p>Large</p></td>
<td style="text-align: left;"><p>Mono</p></td>
<td style="text-align: left;"><p>LCD typically with backlight 8-bit parallel</p></td>
<td style="text-align: left;"><p>PIC and AVR: Software device specific protocol.</p></td>
<td style="text-align: left;"><p>Typically operates at VCC 5. Always check voltage specifications</p></td>
<td style="text-align: left;"><p>8-bit bus required. Bit 7 of the bus is read/write – this could cause potential lockup – this is low risk.</p>
<p>This looks like a KS0108 but it is NOT! Supports Chinese font set.</p></td>
<td style="text-align: left;"><p>Requires 12 ports.</p></td>
<td style="text-align: left;"><p>A very slow device.</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>17</p></td>
<td style="text-align: left;"><p>HX8347G</p></td>
<td style="text-align: left;"><p>2.2inch</p></td>
<td style="text-align: left;"><p>240 * 320</p></td>
<td style="text-align: left;"><p>Large</p></td>
<td style="text-align: left;"><p>Color</p></td>
<td style="text-align: left;"><p>TFT LCD</p></td>
<td style="text-align: left;"><p>SPI</p></td>
<td style="text-align: left;"><p>AVR 8 bit bus</p></td>
<td style="text-align: left;"><p>Typically operates at VCC 5. Always check voltage specifications Great pixel display.</p></td>
<td style="text-align: left;"><p>Controller requires 8 ports plus 5 control ports. Typically 13 in total with an UNO shield.</p></td>
<td style="text-align: left;"><p>An very nice display</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>18</p></td>
<td style="text-align: left;"><p>SDD1331</p></td>
<td style="text-align: left;"><p>0.96inch</p></td>
<td style="text-align: left;"><p>96 * 48</p></td>
<td style="text-align: left;"><p>Small</p></td>
<td style="text-align: left;"><p>Color</p></td>
<td style="text-align: left;"><p>OLED</p></td>
<td style="text-align: left;"><p>SPI</p></td>
<td style="text-align: left;"><p>PIC and AVR: Hardware and software I2C, and software SPI</p></td>
<td style="text-align: left;"><p>Typically operates at VCC 5. Always check voltage specifications</p></td>
<td style="text-align: left;"><p>SPI requires typically 6 in total.</p></td>
<td style="text-align: left;"><p>Very good color OLED display, excellent value for money</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>19</p></td>
<td style="text-align: left;"><p>ILI9326</p></td>
<td style="text-align: left;"><p>3.00inch</p></td>
<td style="text-align: left;"><p>400 * 320</p></td>
<td style="text-align: left;"><p>Large</p></td>
<td style="text-align: left;"><p>Color</p></td>
<td style="text-align: left;"><p>OLED</p></td>
<td style="text-align: left;"><p>8 bit bus</p></td>
<td style="text-align: left;"><p>PIC and AVR: 8 bit bus</p></td>
<td style="text-align: left;"><p>Typically operates at VCC 3.3. Always check voltage specifications</p></td>
<td style="text-align: left;"><p>Requires typically 13 in total plus 0v, VCC and LED.</p></td>
<td style="text-align: left;"><p>Good color OLED display, good value for money as it is fast. But, the rotate is all executed in software and this does slow down processing.</p>
<p><br />
The LED connected is typically to ground. You can solder the GND connect to make the backlite permanently on.</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>20</p></td>
<td style="text-align: left;"><p>NT7108C</p></td>
<td style="text-align: left;"><p>2.9 inch and less. various sizes</p></td>
<td style="text-align: left;"><p>128 * 64</p></td>
<td style="text-align: left;"><p>Large</p></td>
<td style="text-align: left;"><p>Mono</p></td>
<td style="text-align: left;"><p>LCD typically with backlight</p></td>
<td style="text-align: left;"><p>8-bit parallel PIC and AVR: Software device specific protocol</p></td>
<td style="text-align: left;"><p>Typically operates at VCC 5. Always check voltage specifications 8-bit bus required.</p></td>
<td style="text-align: left;"><p>Look similar to KS0108, but, it is NOT the same, hence this driver.   Uses the Winstar’s WDG0151-TMI module, which is a 128×64 pixel monochromatic display.   This uses two Neotic display controller chips: NT7108C and NT7107C. The WDG0151 module contains two sets of it to drive 128 segments.   On the other hand, the KS0107B (or NT7107C) is a 64-channel common driver which generates the timing signal to control the two KS0108B segment drivers.<br />
<br />
The NT7108C is very sensitive with respect to clock timing.   You may have to adjust to ensure the display operates as correctly.</p></td>
<td style="text-align: left;"><p>Requires 12 ports/connections.</p></td>
<td style="text-align: left;"><p>These are medium cost mono devices.</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>21</p></td>
<td style="text-align: left;"><p>T6963_64</p></td>
<td style="text-align: left;"><p>4inches by 2inches</p></td>
<td style="text-align: left;"><p>240 * 64</p></td>
<td style="text-align: left;"><p>Large</p></td>
<td style="text-align: left;"><p>Mono</p></td>
<td style="text-align: left;"><p>LCD typically with backlight</p></td>
<td style="text-align: left;"><p>8-bit parallel PIC and AVR: Software device specific protocol</p></td>
<td style="text-align: left;"><p>Typically operates at VCC 5. Always check voltage specifications 8-bit bus required.</p></td>
<td style="text-align: left;"><p>Operating similar to KS0108 and an LCD. segment drivers.<br />
<br />
</p></td>
<td style="text-align: left;"><p>Requires 12 ports/connections.</p></td>
<td style="text-align: left;"><p>These are medium cost mono devices.</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>22</p></td>
<td style="text-align: left;"><p>T6963_128</p></td>
<td style="text-align: left;"><p>4inches by 2inches</p></td>
<td style="text-align: left;"><p>240 * 128</p></td>
<td style="text-align: left;"><p>Large</p></td>
<td style="text-align: left;"><p>Mono</p></td>
<td style="text-align: left;"><p>LCD typically with backlight</p></td>
<td style="text-align: left;"><p>8-bit parallel PIC and AVR: Software device specific protocol</p></td>
<td style="text-align: left;"><p>Typically operates at VCC 5. Always check voltage specifications 8-bit bus required.</p></td>
<td style="text-align: left;"><p>Operating similar to KS0108 and an LCD. segment drivers.<br />
<br />
</p></td>
<td style="text-align: left;"><p>Requires 12 ports/connections.</p></td>
<td style="text-align: left;"><p>These are medium cost mono devices.</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>23</p></td>
<td style="text-align: left;"><p>UC1601</p></td>
<td style="text-align: left;"><p>4.00inch</p></td>
<td style="text-align: left;"><p>132 * 22</p></td>
<td style="text-align: left;"><p>Medium</p></td>
<td style="text-align: left;"><p>Mono</p></td>
<td style="text-align: left;"><p>OLED</p></td>
<td style="text-align: left;"><p>I2C and SPI</p></td>
<td style="text-align: left;"><p>PIC and AVR: Hardware and software I2C, and software SPI</p></td>
<td style="text-align: left;"><p>RAM for Full Mode GLCD is 396 bytes or Low Memory GLCD is 128 bytes or 0 bytes for Text GLCD Mode then add user variables for graphics mode. Typically operates at VCC 2.8v. Always check voltage specifications Very good display. Driver supports gaming. Minimum RAM required is 396 bytes then add user variables for graphics mode.</p></td>
<td style="text-align: left;"><p>Requires up to 5 ports/connections.</p></td>
<td style="text-align: left;"><p>Low cost device</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>24</p></td>
<td style="text-align: left;"><p>SDD1351</p></td>
<td style="text-align: left;"><p>1.50inch</p></td>
<td style="text-align: left;"><p>128 * 128</p></td>
<td style="text-align: left;"><p>Small</p></td>
<td style="text-align: left;"><p>Color</p></td>
<td style="text-align: left;"><p>OLED</p></td>
<td style="text-align: left;"><p>SPI</p></td>
<td style="text-align: left;"><p>PIC and AVR: Hardware and software I2C, and software SPI</p></td>
<td style="text-align: left;"><p>Typically operates at VCC 3.3 or 5. Always check voltage specifications</p></td>
<td style="text-align: left;"><p>SPI requires typically 6 in total.</p></td>
<td style="text-align: left;"><p>Very good color OLED display, excellent value for money</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>25</p></td>
<td style="text-align: left;"><p>Waveshare e-Paper</p></td>
<td style="text-align: left;"><p>Various Size from 2.13 to 7.5 inches</p></td>
<td style="text-align: left;"><p>104 * 112 to 640 * 384</p></td>
<td style="text-align: left;"><p>Small to very large</p></td>
<td style="text-align: left;"><p>Black and White</p></td>
<td style="text-align: left;"><p>Microencapsulated Electrophoretic Display</p></td>
<td style="text-align: left;"><p>SPI</p></td>
<td style="text-align: left;"><p>PIC and AVR: Hardware and software I2C, and software SPI</p></td>
<td style="text-align: left;"><p>Typically operates at VCC 3.3. Always check voltage specifications</p></td>
<td style="text-align: left;"><p>SPI requires typically 6 in total.</p></td>
<td style="text-align: left;"><p>Very good color e-Paper displays, excellent value for money Display can operate in text mode only for low RAM microcontrollers using SRAM solution.</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>26</p></td>
<td style="text-align: left;"><p>ST7789</p></td>
<td style="text-align: left;"><p>2.0 Inch</p></td>
<td style="text-align: left;"><p>240 * 240 or 320 * 240</p></td>
<td style="text-align: left;"><p>Medium</p></td>
<td style="text-align: left;"><p>Color TFT</p></td>
<td style="text-align: left;"><p>SPI PIC and AVR: Hardware and software SPI</p></td>
<td style="text-align: left;"><p>Typically operates at 3v3. Always check voltage specifications</p></td>
<td style="text-align: left;"><p>+VCC from 3v3. Always check voltage specifications</p></td>
<td style="text-align: left;"><p>Very nice display.</p></td>
<td style="text-align: left;"><p>SPI requires 3 ports (data, clock &amp; command/data) plus 1 port ( reset ). Typically 4 in total.</p></td>
<td style="text-align: left;"><p>Good for cost and performance</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>27</p></td>
<td style="text-align: left;"><p>ST7735R_160_80</p></td>
<td style="text-align: left;"><p>1.8 Inch</p></td>
<td style="text-align: left;"><p>160 * 80</p></td>
<td style="text-align: left;"><p>Large</p></td>
<td style="text-align: left;"><p>Color</p></td>
<td style="text-align: left;"><p>TFT LCD</p></td>
<td style="text-align: left;"><p>SPI</p></td>
<td style="text-align: left;"><p>PIC and AVR: Hardware and software SPI</p></td>
<td style="text-align: left;"><p>Typically operates only at VCC 3.3. Always check voltage specifications Very nice display.</p></td>
<td style="text-align: left;"><p>SPI requires 4 ports plus 2 ports. Typically 6 in total.</p></td>
<td style="text-align: left;"><p>Good for cost and performance</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>28</p></td>
<td style="text-align: left;"><p>ILI9488</p></td>
<td style="text-align: left;"><p>3.2inch</p></td>
<td style="text-align: left;"><p>320 * 240</p></td>
<td style="text-align: left;"><p>Large</p></td>
<td style="text-align: left;"><p>Color</p></td>
<td style="text-align: left;"><p>TFT LCD SPI</p></td>
<td style="text-align: left;"><p>PIC/&amp;AVR: SPI Only</p></td>
<td style="text-align: left;"><p>+VCC from 3v3 to 5. GLCD I/O is ONLY 3v3. Always check voltage specifications.</p></td>
<td style="text-align: left;"><p>Display is good, however, slower than comparable (size) GLCDs as the color definitions are four bytes ( typical color definitions are two bytes)</p></td>
<td style="text-align: left;"><p>SPI requires 4 ports plus 2 ports. Typically 6 in total.</p></td>
<td style="text-align: left;"><p>Acceptable GLCD performance.</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>29</p></td>
<td style="text-align: left;"><p>ST7567</p></td>
<td style="text-align: left;"><p>1.9inch</p></td>
<td style="text-align: left;"><p>128 * 64</p></td>
<td style="text-align: left;"><p>Medium</p></td>
<td style="text-align: left;"><p>Mono</p></td>
<td style="text-align: left;"><p>LCD</p></td>
<td style="text-align: left;"><p>I2C and SPI</p></td>
<td style="text-align: left;"><p>PIC and AVR: Software I2C, and, hardware software SPI. Harware IC2 fails as the ST7567 does not comply witht the I2C standard.</p></td>
<td style="text-align: left;"><p>+VCC from 3v3 to 5. GLCD I/O is ONLY 3v3. Always check voltage specifications.</p></td>
<td style="text-align: left;"><p>SPI requires 4 ports plus 2 ports. Typically 6 in total.</p>
<p>I2C requires 2 ports.</p></td>
<td style="text-align: left;"><p>Typically operates at VCC 3v3 but may support 5v0. Always check voltage specifications Very good LCD display. Driver supports gaming. Minimum RAM required is 1024 bytes then add user variables for graphics mode.</p></td>
</tr>
</tbody>
</table>

</div>

<span class="strong">**Setup:**</span>

You <span class="strong">**must**</span> include the `glcd.h` file at
the top of your program. The file needs to be in brackets as shown
below.

``` screen
    #include <GLCD.h>
```

<span class="strong">**Defines:**</span>

There are several connections that must be defined to use the GLCD
commands with a GLCD display. The <span class="emphasis">*I/O
pin*</span> is the pin on the Microchip PIC or the Atmel AVR
microcontroller that is connected to that specific pin on the graphical
LCD.

<span class="strong">**Example: KS0108 connectivity**</span>

``` screen
    #define GLCD_RW   _I/O pin_ ‘Read/Write pin connection
    #define GLCD_RESET  _I/O pin_ ‘Reset pin connection
    #define GLCD_CS1  _I/O pin_ ‘CS1 pin connection
    #define GLCD_CS2  _I/O pin_ ‘CS2 pin connection
    #define GLCD_RS   _I/O pin_ ‘RS pin connection
    #define GLCD_ENABLE _I/O pin_ ‘Enable pin Connection
    #define GLCD_DB0  _I/O pin_ ‘Data pin 0 Connection
    #define GLCD_DB1  _I/O pin_ ‘Data pin 1 Connection
    #define GLCD_DB2  _I/O pin_ ‘Data pin 2 Connection
    #define GLCD_DB3  _I/O pin_ ‘Data pin 3 Connection
    #define GLCD_DB4  _I/O pin_ ‘Data pin 4 Connection
    #define GLCD_DB5  _I/O pin_ ‘Data pin 5 Connection
    #define GLCD_DB6  _I/O pin_ ‘Data pin 6 Connection
    #define GLCD_DB7  _I/O pin_ ‘Data pin 7 Connection
    #define GLCD_PROTECTOVERRUN 'prevent screen overdrawing     'SSD1306 GLCD only
    #define GLCDDirection       'Invert GLCD Y axis             'KS0108 GCD only
```

Common commands supported across the range of supported GLCDs are:

<div class="informaltable">

| <span class="strong">**Command**</span> | <span class="strong">**Purpose**</span>                                                  | <span class="strong">**Example**</span>                                                        |
|:----------------------------------------|:-----------------------------------------------------------------------------------------|:-----------------------------------------------------------------------------------------------|
| `GLCDCLS`                               | Clear screen of GLCD                                                                     | `GLCDCLS`                                                                                      |
| `GLCDPrint`                             | Print string of characters on GLCD using GCB font set                                    | `GLCDPrint( Xposition, Yposition, Stringvariable` )                                            |
| `GLCDDrawChar`                          | Print character on GLCD using GCB font set                                               | `GLCDDrawChar( Xposition, Yposition, CharCode )`                                               |
| `GLCDDrawString`                        | Print characters on GLCD using GCB font set                                              | `GLCDDrawString( Xposition, Yposition, Stringvariable )`                                       |
| `Box`                                   | Draw a box on the GLCD to a specific size                                                | `Box ( Xposition1, Yposition1, Xposition2, Yposition2, [Optional In LineColour as 0 or 1] )`   |
| `FilledBox`                             | Draw a box on the GLCD to a specific size that is filled with the foreground colour.     | `FilledBox (Xposition1, Yposition1, Xposition2, Yposition2, [Optional In LineColour 0 or 1] )` |
| `Line`                                  | Draw a line on the GLCD to a specific length that is filled with the specific attribute. | `Line ( Xposition1, Yposition1, Xposition2, Yposition2, [Optional In LineColour 0 or 1] )`     |
| `PSet`                                  | Set a pixel on the GLCD at a specific position that is set with the specific attribute.  | `PSet(Xposition, Yposition, Pixel Colour 0 or 1)`                                              |

</div>

  
  

Public variable supported across the range of supported GLCDs are shown
in the table below. These variables control the user definable
parameters of a specific GLCD.

<div class="informaltable">

<table data-border="1">
<thead>
<tr class="header">
<th style="text-align: left;"><span class="strong"><strong>Variable</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Purpose</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Type</strong></span></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCDBackground</code></p></td>
<td style="text-align: left;"><p>Color of GLCD background.</p></td>
<td style="text-align: left;"><p>Can be monochrome or color.<br />
For mono GLCDs the default is White or 0x0001. For color GLCDs the default is White or 0xFFFF.</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">GLCDForeground</code></p></td>
<td style="text-align: left;"><p>Color of GLCD foreground.</p></td>
<td style="text-align: left;"><p>Can be monochrome or color.<br />
For mono GLCDs the default is non-white or 0x0000. For color GLCDs the default is Black or 0x0000.</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCDFontWidth</code></p></td>
<td style="text-align: left;"><p>Width of the current GLCD font.</p></td>
<td style="text-align: left;"><p>Default is 6 pixels.</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">GLCDfntDefault</code></p></td>
<td style="text-align: left;"><p>Size of the current GLCD font.</p></td>
<td style="text-align: left;"><p>Default is 0.+ This equates to the standard GCB font set.</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCDfntDefaultsize</code></p></td>
<td style="text-align: left;"><p>Size of the current GLCD font.</p></td>
<td style="text-align: left;"><p>Default is 1.+ This equates to the 8 pixel high.</p></td>
</tr>
</tbody>
</table>

</div>

For color TFT displays any color can be defined using a valid
hexidecimal word value between 0x0000 to 0xFFFF., see
<http://www.barth-dev.de/online/rgb565-color-picker/> for a wider range
of color parameters.

The following color constants are prevent-defined.

``` screen
    TFT_BLACK       0x0000
    TFT_NAVY        0x000F
    TFT_DARKGREEN   0x03E0
    TFT_DARKCYAN    0x03EF
    TFT_MAROON      0x7800
    TFT_PURPLE      0x780F
    TFT_OLIVE       0x7BE0
    TFT_LIGHTGREY   0xC618
    TFT_DARKGREY    0x7BEF
    TFT_BLUE        0x001F
    TFT_GREEN       0x07E0
    TFT_CYAN        0x07FF
    TFT_RED         0xF800
    TFT_MAGENTA     0xF81F
    TFT_YELLOW      0xFFE0
    TFT_WHITE       0xFFFF
    TFT_ORANGE      0xFD20
    TFT_GREENYELLOW 0xAFE5
    TFT_PINK        0xF81F
```

This example shows how to drive a KS0108 based Graphic LCD module with
the built in commands of GCBASIC. See
<a href="http://www.greatcowbasic.com/sample-projects.html" class="link">Graphic LCD</a>
for details, this is an external web site.

<span class="strong">**Example:**</span>

``` screen
    ;Chip Settings
    #chip 16F886,16
    '#config MCLRE = on 'enable reset switch on CHIPINO
    #include <GLCD.h>

    ;Defines (Constants)
    #define GLCD_RW PORTB.1  'D9 to pin 5 of LCD
    #define GLCD_RESET PORTB.5 'D13 to pin 17 of LCD
    #define GLCD_CS1 PORTB.3 'D12 to actually since CS1, CS2 can be inverted
    #define GLCD_CS2 PORTB.4 'D11 to actually since CS1, CS2 can be inverted
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

    Start:
    GLCDCLS
    GLCDPrint 0,10,"Hello"        'Print Hello
    wait 5 s
    GLCDPrint 0,10, "ASCII #:"    'Print ASCII #:
    Box 18,30,28,40               'Draw Box Around ASCII Character
    for char = 15 to 129          'Print 0 through 9
      GLCDPrint 17, 20 , Str(char)+"  "
      GLCDdrawCHAR 20,30, char
      wait 125 ms
    next
    line 0,50,127,50               'Draw Line using line command
    for xvar = 0 to 80             'Draw line using Pset command
        pset xvar,63,on                    '
    next                                        '
    Wait 1 s
    GLCDPrint 0,10,"End  "          'Print Hello
    wait 1 s
    Goto Start
```

<span class="strong">**For more help, see**</span>
<a href="_graphical_lcd_demonstration.html" class="link" title="Graphical LCD Demonstration">Graphical LCD Demonstration</a>,
<a href="_glcdcls.html" class="link" title="GLCDCLS">GLCDCLS</a>,
<a href="_glcddrawchar.html" class="link" title="GLCDDrawChar">GLCDDrawChar</a>,
<a href="_glcdprint.html" class="link" title="GLCDPrint">GLCDPrint</a>,
<a href="_glcdreadbyte.html" class="link" title="GLCDReadByte">GLCDReadByte</a>,
<a href="_glcdwritebyte.html" class="link" title="GLCDWriteByte">GLCDWriteByte</a>,
<a href="_pset.html" class="link" title="Pset">Pset</a>

</div>
