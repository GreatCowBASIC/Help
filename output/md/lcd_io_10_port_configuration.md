<div class="section">

<div class="titlepage">

<div>

<div>

###### <span id="lcd_io_10_port_configuration"></span>LCD\_IO 10 Port Configuration

</div>

</div>

</div>

<span class="strong">**Using mode 10**</span>

When using I2C LCD mode 10 the target I2C device address is setup as
shown below. Each bit of the the variable i2c\_lcd\_byte is defined to
address the correct LCD display port.

``` screen
    i2c_lcd_e = i2c_lcd_byte.2
    i2c_lcd_rw = i2c_lcd_byte.1
    i2c_lcd_rs = i2c_lcd_byte.0
    i2c_lcd_bl = i2c_lcd_byte.3
    i2c_lcd_d4 = i2c_lcd_byte.4
    i2c_lcd_d5 = i2c_lcd_byte.5
    i2c_lcd_d6 = i2c_lcd_byte.6
    i2c_lcd_d7 = i2c_lcd_byte.7
```

If you have an I2C LCD display adapter with a different set of
connection of the adapter then change this configuration to suit the
specific of the adapter as follows. This should be done in the your main
program code.

``` screen
    #define i2c_lcd_e i2c_lcd_byte.1
    #define i2c_lcd_rw i2c_lcd_byte.2
    #define i2c_lcd_rs i2c_lcd_byte.0
    #define i2c_lcd_bl i2c_lcd_byte.3
    #define i2c_lcd_d4 i2c_lcd_byte.7
    #define i2c_lcd_d5 i2c_lcd_byte.6
    #define i2c_lcd_d6 i2c_lcd_byte.5
    #define i2c_lcd_d7 i2c_lcd_byte.4
```

</div>
