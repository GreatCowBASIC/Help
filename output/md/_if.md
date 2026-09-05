<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="_if"></span>\#if

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    #if Condition
      ...
    [#else]
      ...
    #endif
```

<span class="strong">**Explanation:**</span>

The `#if` directive is used to prevent a section of code from compiling
unless `Condition` is true.

`Condition` has the same syntax as the condition in a normal GCBASIC If
command. The only difference is that it uses constants instead of
variables, and does not use "then".

<span class="strong">**Example:**</span>

``` programlisting
    'This program will pulse an adjustable number of pins on PORTB
    'The number of pins is controlled by the FlashPins constant
    #chip 16F88, 8

    'The number of pins to flash
    #define FlashPins 2

    'Initialise
    Dir PORTB Out

    'Main loop
    Do
        #if FlashPins >= 1
            PulseOut PORTB.0, 250 ms          ' <<< compiled in only when FlashPins is 1 or more
        #endif
        #if FlashPins >= 2
            PulseOut PORTB.1, 250 ms
        #endif
        #if FlashPins >= 3
            PulseOut PORTB.2, 250 ms
        #endif
        #if FlashPins >= 4
            PulseOut PORTB.3, 250 ms
        #endif
    Loop
```

<span class="strong">**Key line:**</span> `#if FlashPins >= 1` — because
`FlashPins` is 2, this block and the `>= 2` block below it are compiled
into the program, while the `>= 3` and `>= 4` blocks are removed
entirely at compile time and never take up program memory on the chip.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="_ifnot" class="link" title="#ifnot">#ifnot</a> — the
    inverse test, compiling code only when the condition is false
-   <a href="_ifdef" class="link" title="#ifdef">#ifdef</a> — testing
    whether a constant is defined, rather than its value

</div>

</div>
