<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="lcd_io_16"></span>LCD\_IO 16

</div>

</div>

</div>

<span class="strong">**Using connection mode 16:**</span>

Using this LCD IO methof the LCD is controlled via the Microchip
PIC16LF72 SPI expander.

To use mode 16 you must define the SPI ports as shown below.

<span class="strong">**Relevant Constants:**</span>

These constants are used to control settings for the LCD routines
included with GCBASIC.   To set them, place a line in the main program
file that uses `#define` to assign a value to the particular constant.

When using this mode only three constants are mandated - all others can
be ignored.

<div class="informaltable">

| <span class="strong">**Constant Name**</span> | <span class="strong">**Controls**</span> | <span class="strong">**Value**</span> |
|:----------------------------------------------|:-----------------------------------------|:--------------------------------------|
| `LCD_IO`                                      | I/O mode                                 | `16`                                  |
| `LCD_SPI_DO`                                  | Microcontroller SPI data out port        | Required                              |
| `LCD_SPI_SCK`                                 | Microcontroller SPI clock out port       | Required                              |

</div>

<span class="strong">**Connectivity**</span>

The connectivity is shown below.  The microcontroller connections are as
shown below.  This is an example using the Microchip PICDEM 4 2003
board.

``` screen
    //Constants - LCD connectivity type;
            #DEFINE LCD_IO 16

            //PIN MAPPINGS FOR PIC16LF72 LCD IO SPI EXPANDER

                // CONSTANT IS MANDATED - DATA LINE
                #DEFINE LCD_SPI_DO          PORTB.2

                // CONSTANT IS MANDATED - CLOCK LINE
                #DEFINE LCD_SPI_SCK         PORTB.5

    //! Main program

    Print "GCBASIC Rocks"
    End
```

<div class="informalfigure">

<div class="mediaobject" align="center">

![graphic](./images/lcd_io_16_1.png)

</div>

</div>

For code examples see
<a href="http://github.com/Anobium/Great-Cow-BASIC-Demonstration-Sources/tree/master/LCD_Solutions" class="link">LCD Solutions</a>.

See the separate sections of the Help file for the specifics of each
Connection Mode.

<span class="strong">**For more help, see**</span>
<a href="lcd_io_0" class="link" title="LCD_IO 0">LCD_IO 0</a>,
<a href="lcd_io_1" class="link" title="LCD_IO 1">LCD_IO 1</a>,
<a href="lcd_io_2" class="link" title="LCD_IO 2">LCD_IO 2</a>
<a href="lcd_io_2_74xx164" class="link" title="LCD_IO 2_74xx164">LCD_IO 2_74xx164</a>,
<a href="lcd_io_2_74xx174" class="link" title="LCD_IO 2_74xx174">LCD_IO 2_74xx174</a>,
<a href="lcd_io_4" class="link" title="LCD_IO 4">LCD_IO 4</a>,
<a href="lcd_io_8" class="link" title="LCD_IO 8">LCD_IO 8</a>,
<a href="lcd_io_10" class="link" title="LCD_IO 10">LCD_IO 10</a>,
<a href="lcd_io_10" class="link" title="LCD_IO 10">LCD_IO 12</a>

</div>
