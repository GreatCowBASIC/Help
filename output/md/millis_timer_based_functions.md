<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="millis_timer_based_functions"></span>Millis - Timer based functions

</div>

</div>

</div>

<span class="strong">**Introduction:**</span>

The `millis()` library provides a simple, portable timing method for
applications and libraries. It is supported on both AVR and PIC
microcontrollers, and works by exposing three user-interrupt "hooks"
that let user code run as part of the library’s own timer interrupt
handler.

The three hooks are:

<div class="orderedlist">

1.  `User_Int_sec` — generates a user interrupt every second.
2.  `User_Int_ms` — generates a user interrupt every millisecond.
3.  `User_Int_XmS` — generates a user interrupt every user-specified
    period, expressed in milliseconds.

</div>

Each is covered below, with a worked example.

<span class="strong">**Command Availability:**</span>

Available on all AVR and PIC microcontrollers, via
`#include "millis.h"`.

<span class="strong">**1. Usage — User\_Int\_sec**</span>

Define `User_Int_sec` to name the method called once a second:

``` programlisting
    #Define  User_Int_Sec  MyTimerInterrupt
    Init_Millis()
```

`MyTimerInterrupt` is called every second once `Init_Millis()` starts
the library’s timer.

<span class="strong">**2. Usage — User\_Int\_ms**</span>

Define `User_Int_ms` to name the method called every millisecond:

``` programlisting
    #Define  User_Int_ms    MyTimerInterrupt
    Init_Millis()
```

`MyTimerInterrupt` can be a subroutine, function, macro, or inline code,
but it must be short, since it runs inside the `millis()` library’s own
interrupt handler.

<span class="strong">**Example for PIC:**</span>

A "Blink" example, using a macro as the hook target (the hook name does
not have to be `MyTimerInterrupt`):

``` programlisting
    #chip 16f18855
    #option Explicit
    #include "millis.h"

    #Define  User_Int_mS    Blink(MyLED, 250)          ' <<< the hook this page documents
    Init_Millis()

    #define MyLED porta.2
    dir MyLED out

    do
      ' main loop is empty but it is required to
      ' prevent the device performing a Sleep call on end
    loop

    end

    Macro Blink(Pin, Period)
      dim  BlinkX as word
      BlinkX += 1
      if BlinkX >= Period then
         BlinkX = 0
         Pin = !Pin
      end if
    end macro
```

<span class="strong">**Key line:**</span>
`#Define User_Int_mS Blink(MyLED, 250)` — registers `Blink(MyLED, 250)`
as the code the `millis()` library runs from inside its own millisecond
interrupt, without the user program managing a timer interrupt directly.

Tested on the Microchip Xpress Demo Board; unlike GCBASIC’s hardware
`millis()` support on other libraries, this hook-based approach is fully
portable.

<span class="strong">**Porting to AVR:**</span>

To move the same example to an Arduino UNO board, change
`#chip 16f18855` to `#chip mega328p,16`, and `#define MyLED porta.2` to
`#define MyLED portb.5`:

``` programlisting
    #chip mega328p,16
    #option Explicit
    #include "millis.h"

    #Define  User_Int_mS    Blink(MyLED, 250)
    Init_Millis()

    #define MyLED portb.5
    dir MyLED out

    do
      ' main loop is empty but it is required to
      ' prevent the device performing a Sleep call on end
    loop

    end

    Macro Blink(Pin, Period)
      dim  BlinkX as word
      BlinkX += 1
      if BlinkX >= Period then
         BlinkX = 0
         Pin = !Pin
      end if
    end macro
```

<span class="strong">**3. Usage — User\_Int\_XmS**</span>

Define `User_Int_XmS` to call a task at a specified period: `type`,
`period`, `task`.

`type` is Byte, Word, Long, or any valid variable; `period` is the
number of milliseconds between calls to the hook; `task` is the macro,
sub, or inline code run when the hook fires:

``` programlisting
    #chip 16f18855
    #option Explicit
    #include "millis.h"

    #define MyLED porta.2
    dir MyLED out

    #Define  User_Int_XmS    Word, 500, MyLED = !MyLED          ' <<< calls the hook every 500 ms
    Init_Millis()

    do
      ' main loop is empty as everything happens within
      ' the user hook. It is required, however, to
      ' prevent the device going to Sleep.
    loop

    end
```

<span class="strong">**Key line:**</span>
`#Define User_Int_XmS Word, 500, MyLED = !MyLED` — toggles `MyLED` every
500 ms directly from the hook, with no code needed in the main loop at
all.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="timer_overview" class="link" title="Timer Overview">Timer Overview</a> — the
    underlying hardware timers this library is built on
-   <a href="inittimer0" class="link" title="InitTimer0">InitTimer0</a> — setting
    up a hardware timer manually, as an alternative to the `millis()`
    hooks

</div>

</div>
