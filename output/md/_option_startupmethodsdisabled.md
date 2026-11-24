<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="_option_startupmethodsdisabled"></span>\#Option StartupMethodsDisabled

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    #option StartupMethodsDisabled
```

<span class="strong">**Explanation:**</span>

`#option StartupMethodsDisabled` stops GCBASIC calling the startup
routines at the start of the program. These are `InitSys` (the chip
setup: ports digital, the oscillator, the A/D off and so on) and the
routines that libraries add with `#startup`, for example `InitRandom`,
`HI2CInit`, `InitGLCD` or the USB library’s startup routine.

Use it when the program must decide what happens first, and when. For
example:

<div class="itemizedlist">

-   a board where a pin must be set before anything else runs: `InitSys`
    would clear a port and switch a supply on at the wrong moment;
-   a program loaded by a bootloader that has already set the chip up;
-   a program that starts a display or a USB connection only after its
    own power-up sequence.

</div>

The rest of the program is compiled as usual: the stack, the interrupt
vectors and the main program are not changed (compare
`#option UserCodeOnly`, which also leaves out the start-up code before
the main program).

<span class="strong">**What the option does:**</span>

<div class="itemizedlist">

-   The startup calls are written to the assembler file as comments,
    under the heading `;! Prepocessor Disabled Calls`, so the program
    shows which routines it would have called. For example:

    ``` screen
    ;Call initialisation routines
    ;! Prepocessor Disabled Calls
    ;!  call INITSYS
    ;!  call INITRANDOM
    ```

-   A startup routine is compiled only when the program calls it itself.
    A routine that is not called is not in the program at all, so it
    uses no program memory.

-   The program must do itself whatever it needs from the routines that
    are not called: set the ports, the analogue pins and the oscillator
    as `InitSys` would, call `InitGLCD` before drawing, call `Randomize`
    before `Random`, start the hardware I2C, and so on. Any startup
    routine can be called by name, for example `InitSys` or `InitGLCD`.

-   RAM is not cleared at the start: set every variable before it is
    used.

</div>

<span class="strong">**Example:**</span>

The PIC18F Starter Kit 1: the application power (`APP_POWER`, RC0) must
stay off until its soft start, so the program does not call `InitSys`
(which would clear PORTC) and starts the display itself.

``` programlisting
    #chip 18F46J50, 48
    #option StartupMethodsDisabled      ' no InitSys: it would switch APP_VDD on without a soft start

    #include <PIC18StarterKit1.h>         ' APP_POWER, SD_CS, ACCEL_CS, MENU_BUTTON, AppPowerOn
    #include <glcd.h>
    #define GLCD_TYPE GLCD_TYPE_SH1101A
    ' ... the GLCD bus settings ...

    ' what InitSys would have done, minus the PORTC clear
    INTCON = 0
    TBLPTRU = 0                         ' for ReadTable
    APP_POWER = 1 : Dir APP_POWER Out   ' keep APP_VDD off until AppPowerOn
    SD_CS = 1 : Dir SD_CS Out
    ACCEL_CS = 1 : Dir ACCEL_CS Out
    Dir MENU_BUTTON In

    AppPowerOn                          ' APP_VDD on with the soft start
    InitGLCD                            ' the display's startup routine, called by the program
    GLCDCLS
```

`InitGLCD` is compiled because the program calls it; `InitSys` and the
other startup routines are not.

<span class="strong">**Notes:**</span>

<div class="itemizedlist">

-   Build 1662 and later: a startup routine that the program does not
    call is not compiled. Earlier builds compiled the routines although
    nothing called them (for example 66 bytes on a PIC18F46J50).
-   Build 1661 and later: `InitSys` is no longer requested with this
    option.
-   The option works for PIC and AVR.

</div>

<span class="strong">**See also**</span> &lt;&lt;<span
class="emphasis">*startup,\#startup&gt;&gt;,
&lt;&lt;*</span>option\_usercodeonly,\#Option UserCodeOnly&gt;&gt;,
<a href="_option_bootloader" class="link" title="#Option Bootloader">#Option Bootloader</a>

</div>
