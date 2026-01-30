<div class="section">

<div class="titlepage">

<div>

<div>

###### <span id="lcd_io_10_port_configuration"></span>LCD\_IO 10 Port Configuration

</div>

</div>

</div>

LCD\_IO 10 provides support for character LCD modules that use an
I2C/TWI interface based on the <span class="strong">**PCF8574 or
PCF8574A I/O expander**</span>.  These expanders are commonly found on
low‑cost LCD “I2C backpacks” sold under many brand names (YwRobot,
Sainsmart, Joy‑It, generic blue/black adapters, and others).  

<span class="strong">**Using mode 10**</span>

When using LCD\_IO 10, the target <span class="strong">**PCF8574 or
PCF8574A I/O expander**</span> port is configured by default as shown in
the table below.  Each bit of the byte variable `i2c_lcd_byte` is mapped
to the appropriate LCD control or data line.  

<div class="informaltable">

| <span class="strong">**Constant Name**</span> | <span class="strong">**Controls**</span> | <span class="strong">**Default**</span> |
|:----------------------------------------------|:-----------------------------------------|:----------------------------------------|
| I2C\_LCD\_E                                   | LCD Enable – Expander Port Bit           | `I2C_LCD_BYTE.2`                        |
| I2C\_LCD\_RW                                  | LCD RW – Expander Port Bit               | `I2C_LCD_BYTE.1`                        |
| I2C\_LCD\_RS                                  | LCD RS – Expander Port Bit               | `I2C_LCD_BYTE.0`                        |
| I2C\_LCD\_BL                                  | LCD Backlight – Expander Port Bit        | `I2C_LCD_BYTE.3`                        |
| I2C\_LCD\_D4                                  | LCD Data Bit 4 – Expander Port Bit       | `I2C_LCD_BYTE.4`                        |
| I2C\_LCD\_D5                                  | LCD Data Bit 5 – Expander Port Bit       | `I2C_LCD_BYTE.5`                        |
| I2C\_LCD\_D6                                  | LCD Data Bit 6 – Expander Port Bit       | `I2C_LCD_BYTE.6`                        |
| I2C\_LCD\_D7                                  | LCD Data Bit 7 – Expander Port Bit       | `I2C_LCD_BYTE.7`                        |

</div>

If your I2C LCD adapter or PCB uses a different wiring arrangement, you
can override the default configuration to match your hardware.  

These overrides should be placed in your main program.  

To apply an alternative configuration, define the following eight
constants.  Doing so replaces the default mappings shown in the table
above.  

``` screen
    #DEFINE I2C_LCD_E   I2C_LCD_BYTE.1
    #DEFINE I2C_LCD_RW  I2C_LCD_BYTE.2
    #DEFINE I2C_LCD_RS  I2C_LCD_BYTE.0
    #DEFINE I2C_LCD_BL  I2C_LCD_BYTE.3
    #DEFINE I2C_LCD_D4  I2C_LCD_BYTE.7
    #DEFINE I2C_LCD_D5  I2C_LCD_BYTE.6
    #DEFINE I2C_LCD_D6  I2C_LCD_BYTE.5
    #DEFINE I2C_LCD_D7  I2C_LCD_BYTE.4
```

</div>
