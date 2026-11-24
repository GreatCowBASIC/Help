<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="readtable"></span>ReadTable

</div>

</div>

</div>

<span class="strong">**About ReadTable**</span>

The `ReadTable` command is used to read information from lookup tables.
`TableName` is the name of the table that is to be read, `Item` is the
line of the table to read, and `Output` is the variable to write the
retrieved value into.

<span class="strong">**Syntax:**</span>

``` screen
    ReadTable TableName, Item, Output
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

`Item` is 1 for the first line of the table, 2 for the second, and so
on. If the table has more than 256 elements, then `Item` must be a WORD
variable. Care must be taken to ensure that the program is not
instructed to read beyond the end of the table, as zero will be
returned.

The type of `Output` should match the type of data stored in the table.
For example, if the table contains Word values, then `Output` should be
a Word variable. If the type does not match, GCBASIC will attempt to
convert the value.

<span class="strong">**Example:**</span>

``` programlisting
    'Chip Settings
    #chip 16F88, 20

    'Hardware Settings
    #define LED PORTB.0
    Dir LED Out

    'Main Routine
    ReadTable TimesTwelve, 4, Temp          ' <<< the ReadTable instruction
    Set LED Off
    If Temp = 48 Then Set LED On

    'Lookup table named "TimesTwelve"
    Table TimesTwelve
    12
    24
    36
    48
    60
    72
    84
    96
    108
    120
    132
    144
    End Table
```

<span class="strong">**Key line:**</span>
`ReadTable TimesTwelve, 4, Temp` — reads the 4th element of the
`TimesTwelve` table (the value 48) into `Temp`; the LED then lights
because `Temp` is compared against 48 immediately afterward.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="lookup_tables" class="link" title="Lookup Tables">Lookup Tables</a> — the
    full table-definition reference

</div>

</div>
