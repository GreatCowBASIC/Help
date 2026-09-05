<div class="section">

<div class="titlepage">

<div>

<div>

###### <span id="lcd_io_12_port_configuration"></span>LCD\_IO 12 Port Configuration

</div>

</div>

</div>

<span class="strong">**Using mode 12:**</span>

When using I2C LCD mode 12 the target I2C device address is setup as
shown below. Each bit of the the variable `i2c_lcd_byte` is defined to
address the correct LCD display port.

``` programlisting
    i2c_lcd_e = i2c_lcd_byte.4          ' <<< the default Enable bit mapping for mode 12
    i2c_lcd_rw = i2c_lcd_byte.5
    i2c_lcd_rs = i2c_lcd_byte.6
    i2c_lcd_bl = i2c_lcd_byte.7
    i2c_lcd_d4 = i2c_lcd_byte.0
    i2c_lcd_d5 = i2c_lcd_byte.1
    i2c_lcd_d6 = i2c_lcd_byte.2
    i2c_lcd_d7 = i2c_lcd_byte.3
```

<span class="strong">**Key line:**</span>
`i2c_lcd_e = i2c_lcd_byte.4` — shows the default bit mapping for the
Ywmjkdz-style adapter used by LCD\_IO 12; this is fixed library
behaviour, shown here only for reference, and is separate from the
override syntax below.

If you have an I2C LCD display adapter with a different set of
connection of the adapter then change this configuration to suit the
specific of the adapter as follows. This should be done in the your main
program code.

``` programlisting
    #define i2c_lcd_e i2c_lcd_byte.4          ' <<< overriding the default Enable bit mapping
    #define i2c_lcd_rw i2c_lcd_byte.5
    #define i2c_lcd_rs i2c_lcd_byte.6
    #define i2c_lcd_bl i2c_lcd_byte.7
    #define i2c_lcd_d4 i2c_lcd_byte.3
    #define i2c_lcd_d5 i2c_lcd_byte.2
    #define i2c_lcd_d6 i2c_lcd_byte.1
    #define i2c_lcd_d7 i2c_lcd_byte.0
```

<span class="strong">**Key line:**</span>
`#define i2c_lcd_e i2c_lcd_byte.4` — redefining any of the eight
`i2c_lcd_*` constants in your own program overrides that single bit
mapping, so only the bits that differ from the default on your specific
adapter need to be redefined.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="lcd_io_12" class="link" title="LCD_IO 12">LCD_IO 12</a> — full
    reference for the LCD\_IO 12 connection mode
-   <a href="lcd_io_10" class="link" title="LCD_IO 10">LCD_IO 10</a> — the
    alternate PCF8574 I2C expander layout
-   <a href="lcd_io_10_port_configuration" class="link" title="LCD_IO 10 Port Configuration">LCD_IO 10 Port Configuration</a> — the
    equivalent port-bit override reference for LCD\_IO 10

</div>

</div>
