<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="epwrite"></span>EPWrite

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    EPWrite location, data
```

<span class="strong">**Command Availability:**</span>

Available on all Microchip PIC and Atmel AVR microcontrollers with
EEPROM data memory.

<span class="strong">**Explanation:**</span>

`EPWrite` writes a byte to the EEPROM data storage, so it can be read
back later by a PC programmer or by the `EPRead` command. `location` is
the address to write to, and its valid range depends on the chip in use.
`data` is the value to write, and can be a literal or a variable.

<span class="strong">**Note:**</span> Do not write past the end of the
chip’s physical EEPROM. If the EEPROM is 256 bytes, `location` must stay
within 0 to 255; if it is 512 bytes, `location` must stay within 0 to
511 and should be a Word variable rather than a Byte.

<span class="strong">**Note:**</span> EEPROM has a limited write
endurance — typically somewhere between 100,000 and 1,000,000 write
cycles per location before it may start to fail, depending on the
specific chip (check the datasheet for the exact figure). This is rarely
a concern for settings written once at power-up, but a loop that writes
the same EEPROM location on every pass, such as a data logger, can wear
it out in hours or days. Spread frequent writes across multiple
locations (wear levelling) if the data does not need to survive at one
fixed address.

<span class="strong">**Example:**</span>

``` programlisting
    #chip 16F819, 8

    'Set the input pin direction
    Dir PORTA.0 In

    'Loop to take readings until the EEPROM is full
    For CurrentAddress = 0 to 255

    'Take a reading and log it
    EPWrite CurrentAddress, ReadAD(AN0)          ' <<< the EPWrite instruction

    'Wait 10 minutes before getting another reading
    Wait 10 min

    Next
```

<span class="strong">**Key line:**</span>
`EPWrite CurrentAddress, ReadAD(AN0)` — logs one ADC reading to a
different EEPROM address on each pass of the loop, which is exactly the
kind of wear-levelling this page’s endurance note recommends.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="epread" class="link" title="EPRead">EPRead</a> — reading
    back the value this page writes
-   <a href="lookup_tables" class="link" title="Lookup Tables">Creating EEProm data from a Lookup Table</a> — pre-loading
    EEPROM with fixed data at compile time
-   <a href="readad" class="link" title="ReadAD">ReadAD</a> — reading
    the sensor value logged in the example above

</div>

</div>
