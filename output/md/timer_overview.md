<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="timer_overview"></span>Timer Overview

</div>

</div>

</div>

GCBASIC supports methods to set, clear, read, start and stop the
microcontroller timers.

GCBASIC supports the following timers.

``` screen
    Timer 0
    Timer 1
    Timer 2
    Timer 3
    Timer 4
    Timer 5
    Timer 6
    Timer 7
    Timer 8
    Timer 10
    Timer 12
```

Not all of these timers available on all microcontrollers. For example,
if a microcontroller has three timers, then typically only `Timer0`,
`Timer1` and `Timer2` will be available.

Please refer to the datasheet for your microcontroller to determine the
supported timers and if a specific timer is 8-bit or 16-bit.

<span class="strong">**Calculating a Timer Prescaler:**</span>

To initialise and change the timers you may have to change the
Prescaler.

A Prescaler is an electronic counting circuit used to reduce a high
frequency electrical signal to a lower frequency by integer division.
The prescaler takes the basic timer clock frequency and divides it by
some value before being processed by the timer, according to how the
Prescaler register(s) are configured. The prescaler values that may be
configured might be limited to a few fixed values, see the timer specfic
page in this Help file or refer to the datasheet.

To use a Prescaler some simple integer maths is required, however, when
calculating the Prescaler there is often be a tradeoff between
resolution, where a high resolution requires a high clock frequency and
range where a high clock frequency willl cause the timer to overflow
more quickly. For example, achieving 1 us resolution and a 1 sec maximum
period using a 16-bit timer may require some clever thinking when using
8-bit timers. Please ask for advice via the GCBASIC forum, or, search
for some of the many great resources on the internet to calculate a
Prescaler value.

<span class="strong">**Common Langauge:**</span>

Using timers has the following terms /common langauge. This following
paragraph is intended to explain the common language.

The Oscillator (OSC) is the system clock, this can be sourced from an
internal or external source, OSC is same the as microcontroller Mhz.
This is called the the Frequency of the OSCillator (FOSC) or the System
Clock.

On a Microchip PIC microcontroller, one machine code instruction is
executed for every four system clock pulses.  
This means that instructions are executed at a frequency of FOSC/4.  
The Microchip PIC datasheets call this FOSC/4 or FOSC4.  
All Microchip PIC timer prescales are based on the FOSC/4, not the FOSC
or the System Clock.  
As Prescale are based upon FOSC/4, you must use FOSC/4 in your timer
calculations to get the results you expect.  
All Prescale and Postscale values are integer numbers.

On Atmel AVR microcontroller, most machine code instructions will
execute in a single clock pulse.

<span class="strong">**Timer differences between Microchip PIC and Atmel
AVR microcontrollers:**</span>

Initialising a timer for a Microchip PIC microcontroller may not operate
as expected when using the same code for an Atmel AVR microcontroller by
simply changing the `#chip` definition. You <span
class="strong">**must**</span> recalculate the Prescaler of a timer when
moving timer parameters between Microchip PIC and Atmel AVR
microcontrollers. And, of course, the same when moving timer parameters
between Atmel AVR and Microchip PIC microcontrollers.

<span class="strong">**Timer Best Practices:**</span>

Initialising microcontrollers with very limited RAM using GCBASIC needs
carefull consideration. RAM may be need to be optimised by using ASM to
control the timers. You can use GCBASIC to create the timer related
GCBASIC ASM code then manually edit the GCBASIC ASM to optmise RAM
usage. Add your revised and optimised ASM back into your program and
then remove the no longer required calls the the GCBASIC methods. If you
need advice on this subject please ask for advice via the GCBASIC forum.

<span class="strong">**Using Timers 2/4/6/8 on Microchip PIC
microcontrollers.**</span>

A Microchip PIC microcontroller can have one of two types of 8-bit timer
2/4/6/8.

The first type has only one clock source and that clock is the FOSC/4
source.

The second type is much more flexible and can have many different clock
sources and supports more prescale values.

The timer type for a Microchip PIC microcontroller can be determined by
checking for the existence of a T2CLKCON register, either in the
Datasheet or in the GCBASIC "dat file" for the specific microcontroller.

If the microcontroller DOES NOT have a T2CLKCON register then ALL Timer
2/4/6/8 timers on that chip are the first type, and are configured
using:

``` screen
    _InitTimer2 (PreScale, PostScale)_   'Timer2 is example for timer 2/4/6 or 8
```

If the microcontroller DOES have a T2CLKCON register then ALL Timer
2/4/6/8 timers on that chip are the second type and are configured
using:

``` screen
    _InitTimer2 (Source, PreScale, PostScale)_   'Timer2 is example for timer 2/4/6 or 8
```

The possible <span class="emphasis">*Source*</span>, <span
class="emphasis">*PreScale*</span> and <span
class="emphasis">*PostScale*</span> constants for each type are shown in
the GCBASIC Help file. See each timer for the constants.

The "Period" of these timers is determined by the system clock speed,
the prescale value and 8-bit value in the respective timer period
register.   The timer period registers are PR2, PR4, PR6 or PR8 for
timer2, timer4, timer6 and timer8 respectively. These registers are also
called PRx and TMRx where the <span class="strong">**`x`**</span> refers
to specific timer number.

When a specific timer is enabled/started the TMRx timer register will
increment until the TMRx register matches the value in the PRx
register.   At this time the TMRx register is cleared to 0 and the timer
continues to increment until the next match of the PRx register, and so
on until the timer is stopped.   The lower the value of the PRx
register, the shorter the timer period will be.   The default value for
the PRX register at power up is 255.

The timer interrupt flag (TMRxIF) is set based upon the number of match
conditions as determine by the postscaler.   The postscaler does not
actually change the timer period, it changes the time between interrupt
conditions.

  
  
  
  

</div>
