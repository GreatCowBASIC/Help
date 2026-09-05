<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="inton"></span>IntOn

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    IntOn
```

<span class="strong">**Command Availability:**</span>

Available on Microchip PIC and Atmel AVR microcontrollers with interrupt
support. Will be automatically removed on chips without interrupts.

<span class="strong">**Explanation:**</span>

`IntOn` is used to enable interrupts on the microcontroller after
`IntOff` has disabled them. It should be used at the end of code that is
timing-sensitive.

`IntOn` is removed from the assembled output if no interrupts are used
anywhere in the program.

<span class="strong">**Example:**</span>

``` programlisting
    #chip 16F628A, 4

    Dim CriticalValue As Word

    IntOff
    CriticalValue = ReadAD(AN0) * 2 + 1
    IntOn          ' <<< the IntOn instruction
```

<span class="strong">**Key line:**</span> `IntOn` — re-enables
interrupts once the timing-sensitive sequence above has finished; any
interrupt that occurred while disabled is processed immediately after
this line runs.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="intoff" class="link" title="IntOff">IntOff</a> — disabling
    interrupts before timing-sensitive code, as used above
-   <a href="interrupts" class="link" title="Interrupts">Interrupts</a> — category
    overview

</div>

</div>
