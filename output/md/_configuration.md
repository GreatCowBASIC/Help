<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="_configuration"></span>Configuration

</div>

</div>

</div>

<span class="strong">**About Configuration**</span>

<span class="emphasis">*(Note: This section does not apply to Atmel AVR
microcontrollers. Atmel AVR microcontrollers do have a similar
configuration settings, but they are controlled through "Configuration
Fuses". GCBASIC cannot set these - you MUST use the programmer
software.)*</span>

Every Microchip PIC has a CONFIG word. This is an area of memory on the
chip that stores settings which govern the operation of the chip.

The following asects of the chip are governed by the CONFIG word:

<div class="itemizedlist">

-   Oscillator selection - will the chip run from an internal
    oscillator, or is an external one attached?
-   Automatic resets - should the chip reset if the power drops too low?
    If it detects it is running the same piece of code over and over?
-   Code protection - what areas of memory must be kept hidden once
    written to?
-   Pin usage - which pins are available for programming, resetting the
    chip, or emitting PWM signals?

</div>

The exact configuration settings vary amongst chips. To find out a list
of valid settings, please consult the datasheet for the microcontrollers
that you wish to use.

This can all be rather confusing - hence, GCBASIC will automatically set
some config settings, unless told otherwise:

<div class="itemizedlist">

-   <span class="strong">**Low Voltage Programming (LVP) is turned
    off.**</span> This enables the PGM pin (usually B3 or B4) to be used
    as a normal I/O pin.

-   <span class="strong">**Watchdog Timer (WDT) is turned off.**</span>
    The WDT resets the chip if it runs the same piece of code over and
    over - this can cause trouble with some of the longer delay routines
    in GCBASIC.

-   <span class="strong">**Master Clear (MCLR) is disabled where
    possible.**</span> On many newer chips this allows the MCLR pin
    (often PORTA.5) to be used as a standard input port. It also removes
    the need for a pull-up resistor on the MCLR pin.

-   <span class="strong">**An oscillator mode will be selected, based on
    the following rules:**</span>

    <div class="itemizedlist">

    -   If the microcontroller has an internal oscillator, and the
        internal oscillator is capable of generating the speed specified
        in the \#chip line, then the internal oscillator will be used.
    -   If the clock speed is over 4 Mhz, the external HS oscillator is
        selected
    -   If the clock speed is 4 MHz or less, then the external XT
        oscillator mode is selected.

    </div>

</div>

Note that these settings can easily be individually overridden whenever
needed. For example, if the Watchdog Timer is needed, adding the line

``` screen
    #config WDT = ON
```

This will enable the watchdog timer, without affecting any other
configuration settings.

<span class="strong">**Using Configuration**</span>

Once the necessary CONFIG options have been determined, adding them to
the program is easy. On a new line type "\#config" and then list the
desired options separated by commas, such as in this line:

``` screen
    #config OSC = RC, BODEN = OFF
```

GCBASIC also supports this format on 10/12/16 series chips:

``` screen
    #config INTOSC_OSC_NOCLKOUT, BODEN_OFF
```

However, for upwards compatibility with 18F chips, you should use the =
style config settings.

It is possible to have several \#config lines in a program - for
instance, one in the main program, and one in each of several \#include
files. However, care must then be taken to ensure that the settings in
one file do not conflict with those in another.

<span class="strong">**For more help, see**</span>
<a href="__config.html" class="link" title="#config">#config Directive</a>

</div>
