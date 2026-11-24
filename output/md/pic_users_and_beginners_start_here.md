<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="pic_users_and_beginners_start_here"></span>PIC users and Beginners: Start Here

</div>

</div>

</div>

Welcome to GCBASIC. This document is especially important for
experienced PIC users moving from MPASM or C, so please spend a few
seconds here before you start. It could save you hours of frustration.

As a PIC user, most of us are conditioned, regardless of the assembler
or compiler, to reach for the device’s data sheet first and try to work
out how to set up the oscillator, interrupt vectors, and configuration
bits.

<span class="strong">**Do not DO IT**</span>. Read this document first,
as it will give you some great insights. For the basic operation, the
only setup and configuration required for a GCBASIC program is the name
of the target device, i.e. `#CHIP 16F1619`. That is it, honestly -
GCBASIC will do the rest and will determine the optimal oscillator
settings, interrupt vectors, configuration bits, etc.

Next we would start deciding on and including the device files and
libraries that we intend to use. <span class="strong">**STOP**</span>.
Let GCBASIC decide. GCBASIC is creating portable code - it does not care
if you use a PIC12, PIC18, or an ATmega328. You write in BASIC, and at
compile time GCBASIC will decide which core libraries to include based
on the instructions you have used and the target device you specified in
the `#CHIP` statement.

Finally we would decide on the pins to use, their port names, which
register bits are needed to make them inputs or outputs, and override
any analog function if a digital function is desired.

Again, let GCBASIC DO IT. `Dir PortC.0 In` will set pin RC0 to a digital
input. There is no need to manually set the TRIS register or check
whether there is an associated ADCON bit to set or clear.

Putting it all together: an example GCBASIC program.

``` programlisting
    #CHIP 16F1619

    #DEFINE LED PortC.0

    Dir LED Out

    Do
      LED = !LED          ' <<< the ! (NOT) operator toggling the LED each pass
      Wait 500 ms
    Loop
```

<span class="strong">**Key line:**</span> `LED = !LED` — inverts the
current state of the `LED` pin (bitwise NOT) every loop pass, so it
alternates between 0 and 1 each time it runs, producing the blink.

That is it. If you have an LED attached to PortC.0 (LED DS1 on the Low
Pin Count Board that shipped with the PICkit 2 or PICkit 3 programmer),
it will start to blink, confirming that you have a working
microcontroller and hardware.

To change the target device or family, just change the `#CHIP` entry
along with the pin you have the LED on, and recompile. It really is as
simple as that to get started in GCBASIC.

You can manually override GCBASIC and set every register, every flag,
every bit, every configuration fuse, and every vector if you wish, but
why bother doing it upfront? Rather get your code working with the
default settings and then adjust from there, if needed, as your
confidence grows.

One final piece of advice: the IDE tool bar has a "View Demos"? button.
Use it - there are examples of all of the most common programming
challenges and many different devices, which, along with the Help files,
will answer most of your questions. The forum is a friendly place too,
so do not be shy to introduce yourself and ask for help.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="introducing_gcbasic" class="link" title="Introducing GCBASIC">Introducing GCBASIC</a> — category
    overview
-   <a href="using_gcbasic" class="link" title="Using GCBASIC">Using GCBASIC</a> — installing
    GCBASIC and setting up a programmer
-   <a href="dir" class="link" title="Dir">Dir</a> — setting a
    pin’s direction, as used above

</div>

</div>
