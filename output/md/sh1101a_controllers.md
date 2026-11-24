<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="sh1101a_controllers"></span>SH1101A Controllers

</div>

</div>

</div>

This section covers GLCD devices that use the SH1101A graphics
controller.

The SH1101A is a single-chip CMOS OLED driver, 132 columns by 64 rows of
RAM, used with 128 x 64 pixel panels (the visible area starts at RAM
column 2). It is the same family as the SH1106/SH1106 used elsewhere in
this library, and all the usual GCBASIC GLCD commands work with it:
`GLCDCLS`, `GLCDPrint`, `Pset`, `Line`, `Box`, `FilledBox`, `Circle`,
`FilledCircle`, `RoundRect`, `Triangle`, `Ellipse`, `GLCDRotate`,
`GLCDSetContrast`, and the display modes.

Unlike several other small OLED controllers in this library, the SH1101A
has <span class="strong">**no I2C interface**</span> at all (confirmed
in the SH1101A datasheet) - only an 8080-style 8-bit parallel bus, or a
4-wire SPI interface (write-only: the serial interface cannot read the
display back). Defining `I2C_DATA` or `HI2C_DATA` alongside
`GLCD_TYPE_SH1101A` compiles with a warning only, in case another device
on the board genuinely uses I2C.

The GCBASIC constants shown below control the configuration of the
SH1101A controller. GCBASIC supports both the 8080 parallel bus and
software SPI - this is shown in the examples below.

To use the SH1101A driver simply include the following in your user
code. This will initialise the driver as a `#startup` routine; with
`#option StartupMethodsDisabled` (or when the display’s own power supply
must be switched on first), call `InitGLCD` yourself once power is
applied.

``` programlisting
    'An 8080 parallel bus configuration, as wired on the Microchip PIC18F Starter Kit 1
    #include <glcd.h>

    ; ----- Define GLCD Hardware settings
    #define GLCD_TYPE GLCD_TYPE_SH1101A          ' <<< the constant that selects this controller driver
    #define GLCD_DATA_PORT PORTD                  ' D0..D7
    #define GLCD_WR        LATE.1                 ' write strobe, active low
    #define GLCD_RD        LATE.0                 ' read strobe, active low (held high)
    #define GLCD_CS        LATE.2                 ' chip select, active low
    #define GLCD_DC        LATB.5                 ' data / command (D/C#, A0)
    #define GLCD_RESET     LATB.4                 ' optional: reset, active low
```

<span class="strong">**Key line:**</span>
`#define GLCD_TYPE GLCD_TYPE_SH1101A` — tells `<glcd.h>` to compile in
the SH1101A driver. On the 8080 bus, `GLCD_DATA_PORT` is set back to an
input after every write, since a pin of it may be shared with other
hardware (on the Starter Kit, RD6 is also the SD card/accelerometer SPI2
input).

or,

``` programlisting
    'A 4-wire SPI configuration (software; write-only), with #define S4Wire_DATA
    #include <glcd.h>

    ; ----- Define GLCD Hardware settings
    #define GLCD_TYPE GLCD_TYPE_SH1101A
    #define S4Wire_DATA

    #DEFINE GLCD_DO  PORTC.5
    #DEFINE GLCD_SCK PORTC.4
    #DEFINE GLCD_DC  PORTB.1
    #DEFINE GLCD_CS  PORTC.3
    #DEFINE GLCD_RESET PORTC.2
```

The GCBASIC constants for control of display characteristics are shown
in the table below.

<div class="informaltable">

| <span class="strong">**Constants**</span>                    | <span class="strong">**Controls**</span>                                                                                                                                                                                                                             | <span class="strong">**Options**</span>                                |
|:-------------------------------------------------------------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:-----------------------------------------------------------------------|
| `GLCD_TYPE`                                                  | `GLCD_TYPE_SH1101A`                                                                                                                                                                                                                                                  | Required                                                               |
| `GLCD_DATA_PORT`, `GLCD_WR`, `GLCD_RD`, `GLCD_CS`, `GLCD_DC` | 8080 parallel bus pins                                                                                                                                                                                                                                               | Required for the 8080 bus (mutually exclusive with the SPI pins below) |
| `GLCD_DO`, `GLCD_SCK`, `GLCD_DC`, `GLCD_CS`                  | 4-wire software SPI pins (with `S4Wire_DATA`)                                                                                                                                                                                                                        | Required for SPI (mutually exclusive with the 8080 bus pins above)     |
| `GLCD_RESET`                                                 | Reset pin, active low                                                                                                                                                                                                                                                | Optional, either bus                                                   |
| `GLCD_WIDTH`, `GLCD_HEIGHT`                                  | Panel geometry                                                                                                                                                                                                                                                       | Fixed at `128` and `64`                                                |
| `GLCD_SH1101A_CONTRAST`                                      | Contrast at `InitGLCD`, `0`..`255`                                                                                                                                                                                                                                   | Optional - defaults to `0x60`                                          |
| `GLCD_TYPE_SH1101A_NOBUFFER`                                 | 8080 bus only: removes the 1024-byte screen buffer, reading each byte back from the display before changing it. Slower, but frees RAM. Compiling this with the SPI bus instead of the 8080 bus stops the compile (the serial interface cannot read the display back) | Optional, 8080 bus only                                                |
| `GLCD_SH1101A_PSET_REDIRECT`                                 | With the full screen buffer: every `Pset` also calls a `Sub Redirect_PSet(In GLCDX, In GLCDY, In GLCDColour As Word)` that the user program supplies - useful for mirroring the screen elsewhere (for example to a PC)                                               | Optional                                                               |

</div>

This example shows how to drive a SH1101A based Graphic LCD module on
the 8080 parallel bus, as wired on the Microchip PIC18F Starter Kit 1.

``` programlisting
    #chip 18F46J50, 48
    #include <glcd.h>

    #define GLCD_TYPE GLCD_TYPE_SH1101A
    #define GLCD_DATA_PORT PORTD
    #define GLCD_WR        LATE.1
    #define GLCD_RD        LATE.0
    #define GLCD_CS        LATE.2
    #define GLCD_DC        LATB.5
    #define GLCD_RESET     LATB.4

    GLCDCLS
    GLCDPrint 0, 0, "GCBASIC"          ' <<< the GLCDPrint instruction
    Box 0, 0, GLCD_WIDTH-1, GLCD_HEIGHT-1
    Circle (44, 41, 15)
    Line 0, 63, 64, 31

    Do
    Loop
```

<span class="strong">**Key line:**</span>
`GLCDPrint 0, 0, "GCBASIC"` — identical usage to the other OLED
controllers in this library; only the bus-selection constants above
change which physical interface is used.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="ssd1309_controllers" class="link" title="SSD1309 Controllers">SSD1309 Controllers</a> — a
    related small-OLED driver that also offers I2C
-   <a href="glcdcls" class="link" title="GLCDCLS">GLCDCLS</a> — clearing
    the display, as used above
-   <a href="glcddrawchar" class="link" title="GLCDDrawChar">GLCDDrawChar</a> — drawing
    a single character
-   <a href="glcdprint" class="link" title="GLCDPrint">GLCDPrint</a> — printing
    a value at a specific location, as used above
-   <a href="pset" class="link" title="Pset">Pset</a> — setting a
    single pixel

</div>

Supported in &lt;GLCD.H&gt;

</div>
