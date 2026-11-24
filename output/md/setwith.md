<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="setwith"></span>SetWith

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    SetWith(TargetBit, Source)
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

`SetWith` is an extended version of `Set` that sets or clears a single
bit by evaluating the result of `Source`, rather than requiring a
literal `On`/`Off`. Use `SetWith` whenever `TargetBit` is an I/O pin and
`Source` is the result of a function or expression, rather than writing
the pin in two steps (evaluate, then `If…​Then Set`) — doing it in one
call avoids a brief window where the pin could glitch to its old state
before your code catches up, an effect commonly called I/O jitter.

`Source` can be a variable of type Bit, Byte, Word, or Long, a constant,
an expression, or a function’s result. `SetWith` sets `TargetBit` to 1
if `Source` evaluates to anything other than zero, and to 0
otherwise — `TargetBit` is always driven to exactly 1 or 0, regardless
of \`Source’s variable type or magnitude.

<span class="strong">**Example:**</span>

``` programlisting
    ' This program will reflect the state of SW1(RA3) on LED DS1(RC0) of the Microchip
    ' Low Pin Count Demo Board. Notice that because SW1 is normally High the state has to
    ' be inverted to turn on the LED (DS1) when SW1 is pressed.

    #chip   16f690    ' declare the target Device

    #Define SW1 PORTA.3
    #Define DS1 PORTC.0

    DIR DS1 Out
    DIR SW1 In

    Do
      ' set the Bit DS1 to equal the Bit SW1
      SetWith( DS1, !SW1 )          ' <<< the SetWith instruction
    Loop
    END
```

<span class="strong">**Key line:**</span>
`SetWith( DS1, !SW1 )` — drives `DS1` to the logical inverse of `SW1` in
a single, jitter-free step, rather than reading `SW1` and writing `DS1`
as two separate statements.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="bitwise_operations_overview" class="link" title="Bitwise Operations Overview">Bitwise Operations Overview</a> — background
    on GCBASIC’s bitwise operations
-   <a href="set" class="link" title="Set">Set</a> — the simpler
    On/Off form that `SetWith` extends
-   <a href="dir" class="link" title="Dir">Dir</a> — setting the
    pin directions used in the example above

</div>

</div>
