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

`EPWrite` is used to write information to the EEPROM data storage, so
that it can be accessed later by a programmer on the PC, or by the
`EPRead` command. `location` represents the location to write data to,
and the location varies from one chip to another. `data` is the data
that is to be written to the EEPROM, and can be a value or a variable.

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

### Note

Do not exceed the location ( also known as the EEProm address ) of the
physical EEProm.  If the EEProm size is 256 ensure location is in the
range of 0 to 255;  If the EEProm size is 512 ensure location is in the
range of 0 to 511 and use a Word variable as the location parameter.

</div>

<span class="strong">**Example:**</span>

``` screen
    #chip 16F819, 8

    'Set the input pin direction
    Dir PORTA.0 In

    'Loop to take readings until the EEPROM is full
    For CurrentAddress = 0 to 255

    'Take a reading and log it
    EPWrite CurrentAddress, ReadAD(AN0)

    'Wait 10 minutes before getting another reading
    Wait 10 min

    Next
```

<span class="strong">**For more help, see
<a href="epread" class="link" title="EPRead">EPRead</a>,<a href="lookup_tables" class="link" title="Lookup Tables">Creating EEProm data from a Lookup Table</a>**</span>

</div>
