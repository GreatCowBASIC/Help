<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="deviceconfigurationread"></span>DeviceConfigurationRead

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    DeviceConfigurationRead (location, store)
```

<span class="strong">**Command Availability:**</span>

Available on all Microchip PIC microcontrollers with self-read
capability. Not currently available on Atmel AVR.

<span class="strong">**Explanation:**</span>

`DeviceConfigurationRead` reads information from the device
configuration area of memory on chips that support this feature — the
area holding configuration words (fuses) such as oscillator selection,
watchdog timer setup, and code-protection bits, rather than the general
program-memory space that `ProgramRead` accesses. `location` and `store`
are both word variables, meaning they can hold values greater than 255.

The range of `location` depends on the amount of configuration memory on
the Microchip PIC microcontroller, given in the datasheet. `store` is 14
bits wide, and can therefore store values up to `16383`.

This is an advanced command intended for developers who need to inspect
a chip’s own configuration bits at run time; most programs never need to
call it, since configuration is normally set once at compile time with
`#config`.

<span class="strong">**Example:**</span>

``` programlisting
    #chip 18F26K22, 16

    Dim ConfigLocation As Word
    Dim ConfigValue As Word

    ConfigLocation = 0x300000     ' start of the configuration word area on this chip

    DeviceConfigurationRead ( ConfigLocation, ConfigValue )          ' <<< the DeviceConfigurationRead instruction
    HSerPrint ConfigValue
```

<span class="strong">**Key line:**</span>
`DeviceConfigurationRead ( ConfigLocation, ConfigValue )` — reads the
configuration word at `ConfigLocation` back into `ConfigValue` for
inspection at run time.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="programread" class="link" title="ProgramRead">ProgramRead</a> — reading
    ordinary program memory rather than configuration words
-   <a href="programerase" class="link" title="ProgramErase">ProgramErase</a>
    /
    <a href="programwrite" class="link" title="ProgramWrite">ProgramWrite</a> — modifying
    ordinary program memory

</div>

</div>
