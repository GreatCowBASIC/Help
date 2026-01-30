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

The `Poke` command is used to write information to the on-chip RAM of
the microcontroller.

`location` is a word variable that gives the address to write. The exact
range of valid values varies from chip to chip. `value` is the data to
write to the location.

This command should not normally be used, as it will make the porting of
code to another chip very difficult.

<span class="strong">**Example 1:**</span>

``` screen
    'This program will set all of the PORTB pins high
    POKE (6, 255)
```

<span class="strong">**Example 2:**</span>

``` screen
    ;Chip Settings
    #chip 16F88

    Dir PORTB out

    Do Forever
        FlashPin @PORTB, 8
        Wait 1 s
    Loop

    Sub FlashPin (In DestVar As word, In DestBit)
        Poke DestVar, Peek(DestVar) Or DestBit
        Wait 1 s
        Poke DestVar, Peek(DestVar) And Not DestBit
    End Sub
```

Using @ before the name of a variable (including a special function
register) will give you the address of that variable, which can then be
stored in a word variable and used by `Peek` and `Poke` to indirectly
access the location.

<span class="strong">**See Also**</span>
<a href="peek" class="link" title="Peek">Peek</a>

</div>
