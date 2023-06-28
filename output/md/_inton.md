<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="_inton"></span>IntOn

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    IntOn
```

<span class="strong">**Command Availability:**</span>

Available on Microchip PIC and Atmel AVR microcontrollers with interrupt
support. Will be automatically removed on chips without interrupts.

<span class="strong">**Explanation:**</span>

`IntOn` is used to enable interrupts on the microcontroller after
`IntOff` has disabled them. It should be used at the end of code which
is timing-sensitive.

`IntOn` will be removed from the assembler if no interrupts are used.

<span class="strong">**See also**</span>
<a href="_intoff.html" class="link" title="IntOff">IntOff</a>,
<a href="_interrupts_overview.html" class="link" title="Interrupts overview">Interrupts</a>

</div>
