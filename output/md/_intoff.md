<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="_intoff"></span>IntOff

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    IntOff
```

<span class="strong">**Command Availability:**</span>

Available on Microchip PIC and Atmel AVR microcontrollers with interrupt
support. Will be automatically removed on chips without interrupts.

<span class="strong">**Explanation:**</span>

`IntOff` is used to disable interrupts on the microcontroller. It should
be used at the start of code which is timing-sensitive, and which would
not function correctly if paused and restarted.

It is essential that `IntOn` is used to turn interrupts on again after
the timing-sensitive code has finished running. If not, no interrupts
will be handled.

It is recommended that IntOff be placed before all code that is timing
sensitive, in case interrupts are implemented later.

`IntOff` will be removed from the assembler if no interrupts are used.

<span class="strong">**See also**</span>
<a href="_inton.html" class="link" title="IntOn">IntOn</a>,
<a href="_interrupts.html" class="link" title="Interrupts">Interrupts</a>

</div>
