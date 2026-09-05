<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="intoff"></span>IntOff

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    IntOff
```

<span class="strong">**Command Availability:**</span>

Available on Microchip PIC and Atmel AVR microcontrollers with interrupt
support. Will be automatically removed on chips without interrupts.

<span class="strong">**Explanation:**</span>

`IntOff` is used to disable interrupts on the microcontroller. It should
be used at the start of code that is timing-sensitive, and which would
not function correctly if paused and restarted partway through.

It is essential that `IntOn` is used to turn interrupts back on after
the timing-sensitive code has finished running. If it is not, no
interrupts will be handled for the rest of the program.

It is recommended that `IntOff` be placed before all timing-sensitive
code, in case interrupts are implemented later.

`IntOff` is removed from the assembled output if no interrupts are used
anywhere in the program.

<span class="strong">**Example:**</span>

``` programlisting
    #chip 16F628A, 4

    Dim CriticalValue As Word

    IntOff          ' <<< the IntOff instruction
    CriticalValue = ReadAD(AN0) * 2 + 1
    IntOn
```

<span class="strong">**Key line:**</span> `IntOff` — disables interrupts
before the timing-sensitive read-and-calculate sequence, so an interrupt
cannot pause it partway through; `IntOn` below restores normal interrupt
handling once the sequence is complete.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="inton" class="link" title="IntOn">IntOn</a> — re-enabling
    interrupts after `IntOff`
-   <a href="interrupts" class="link" title="Interrupts">Interrupts</a> — category
    overview

</div>

</div>
