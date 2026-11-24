<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="interrupts_overview"></span>Interrupts Overview

</div>

</div>

</div>

<span class="strong">**Introduction**</span>

Interrupts are a feature of many microcontrollers. They allow the
microcontroller to temporarily pause (interrupt) the code it is running
and then start running another piece of code when some event occurs.
Once it has dealt with the event, it returns to where it was and
continues running the program.

Many events can trigger an interrupt, such as a timer reaching its
limit, a serial message being received, or a special pin on the
microcontroller receiving a signal.

<span class="strong">**Using Interrupts**</span>

There are two ways to use interrupts in GCBASIC. The first way is to use
the `On Interrupt` command. This automatically enables a given
interrupt, and runs a particular subroutine when the interrupt occurs.

The other way to deal with interrupts is to create a subroutine called
`Interrupt`. GCBASIC calls this subroutine whenever an interrupt occurs,
and your code can then check the "flag" bits to determine which
interrupt has occurred, and what should be done about it. If you use
this approach, you will need to enable the desired interrupts manually.
It is also essential that your code clears the flag bits, or the
interrupt routine will be called repeatedly.

A combination of these two methods is also possible — the code generated
by `On Interrupt` will check to see if the interrupt is one it
recognises. If the interrupt is recognised, `On Interrupt` deals with
it; if not, the `Interrupt` subroutine is called to deal with the
interrupt.

The recommended approach is to use `On Interrupt`, since it is both more
efficient and easier to set up.

During some sections of code, it is desirable not to have any interrupts
occur. In this case, use the `IntOff` command to disable interrupts at
the start of the section, and `IntOn` to re-enable them at the end. If
any interrupt events occur while interrupts are disabled, they will be
processed as soon as interrupts are re-enabled. If the program does not
use interrupts, `IntOn` and `IntOff` are removed automatically by
GCBASIC.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="intoff" class="link" title="IntOff">IntOff</a> — disabling
    interrupts around timing-sensitive code
-   <a href="inton" class="link" title="IntOn">IntOn</a> — re-enabling
    interrupts afterwards
-   <a href="on_interrupt" class="link" title="On Interrupt">On Interrupt</a> — the
    recommended way to handle a specific interrupt

</div>

</div>
