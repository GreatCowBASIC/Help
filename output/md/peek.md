<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="peek"></span>Peek

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    OutputVariable = Peek (location)
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The `Peek` function reads information from the on-chip RAM of the
microcontroller.

`location` is a word variable that gives the address to read. The exact
range of valid values varies from chip to chip.

This command should not normally be used, since it makes porting code to
another chip very difficult — register and RAM addresses are
chip-specific.

<span class="strong">**Example \#1:**</span>

``` programlisting
    'This program will read and check a value from PORTA
    'This specific peek will only work on some microcontrollers
    Temp = Peek(5)          ' <<< the Peek instruction
    IF Temp.2 ON THEN SET green ON
    IF Temp.2 OFF THEN SET red ON
```

<span class="strong">**Key line:**</span> `Temp = Peek(5)` — reads the
raw byte value at RAM/register address 5 directly, bypassing the
named-port abstraction GCBASIC normally provides, which is why the
result is chip-specific.

<span class="strong">**Example \#2:**</span>

``` programlisting
    ' This subroutine will toggle the pin state.
    ' You must change the parameters for your specific chip.
    ' Usage as show in examples below.
    '
    '      Toggle @PORTE, 2 ' equates to RE1.
    '      Wait 100  ms
    '      Toggle @PORTE, 2
    '      Wait 100 ms


    ' Port , Pin address in Binary
    ' Pin0 = 1
    ' Pin1 = 2
    ' Pin2 = 4
    ' Pin3 = 8
    '
    ' You can toggle any number of pins.
    ' Toggle @PORTE, 0x55
    Sub Toggle ( In DestPort As word, In DestBit )
          Poke DestPort, Peek(DestPort) xor DestBit          ' <<< the Peek instruction, paired with Poke
    End sub
```

<span class="strong">**Key line:**</span>
`Poke DestPort, Peek(DestPort) xor DestBit` — reads the port’s current
value with `Peek`, flips the requested bit(s) with `xor`, and writes the
result straight back with `Poke`, toggling those pins without disturbing
the others.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="poke" class="link" title="Poke">Poke</a> — writing
    back to the location this page reads

</div>

</div>
