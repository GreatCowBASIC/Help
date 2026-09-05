<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="poke"></span>Poke

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    Poke(location, value)
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The `Poke` command writes information to the on-chip RAM of the
microcontroller.

`location` is a word variable that gives the address to write. The exact
range of valid values varies from chip to chip. `value` is the data to
write to the location.

This command should not normally be used, since it makes porting code to
another chip very difficult — register and RAM addresses are
chip-specific.

<span class="strong">**Example 1:**</span>

``` programlisting
    'This program will set all of the PORTB pins high
    POKE (6, 255)          ' <<< the Poke instruction
```

<span class="strong">**Key line:**</span> `POKE (6, 255)` — writes the
raw value 255 directly to RAM/register address 6, setting every bit in
that byte, on a chip where that address corresponds to PORTB.

<span class="strong">**Example 2:**</span>

``` programlisting
    ;Chip Settings
    #chip 16F88

    Dir PORTB out

    Do Forever
        FlashPin @PORTB, 8
        Wait 1 s
    Loop

    Sub FlashPin (In DestVar As word, In DestBit)
        Poke DestVar, Peek(DestVar) Or DestBit          ' <<< the Poke instruction, setting a bit
        Wait 1 s
        Poke DestVar, Peek(DestVar) And Not DestBit
    End Sub
```

<span class="strong">**Key line:**</span>
`Poke DestVar, Peek(DestVar) Or DestBit` — reads the port’s current
value with `Peek`, sets the requested bit with `Or`, and writes the
result back with `Poke`, turning that pin on without disturbing the
others; the next line clears it again with `And Not`.

Using `@` before the name of a variable (including a special function
register) gives you the address of that variable, which can then be
stored in a word variable and used by `Peek` and `Poke` to indirectly
access the location.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="peek" class="link" title="Peek">Peek</a> — reading
    the location this page writes

</div>

</div>
