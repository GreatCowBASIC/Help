<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="efficient_implementation_of_lookup_reference_tables_in_embedded_systems"></span>Efficient Implementation of Lookup Reference Tables in Embedded Systems

</div>

</div>

</div>

<span class="strong">**Introduction**</span>

This section explores the efficient implementation of lookup reference
tables in embedded systems, specifically focusing on the use of PROGMEM
memory to store fixed data sets. It addresses common misconceptions
about data storage and initialization, compares different methods of
data handling, and provides advanced techniques for optimizing memory
usage.

Lookup reference tables are essential in embedded systems for storing
fixed data sets that can be accessed during runtime. This section aims
to clarify the correct implementation of these tables, debunking common
myths and providing practical solutions for efficient data management.

<span class="strong">**Conventional Misconceptions**</span>

A common misconception is that the data required by a fixed lookup table
is defined by its content and declared in a Dim statement, with its data
filled at runtime. This implies that the array is empty initially and
populated during initialization, leading to data duplication and wasted
memory resources.

<span class="strong">**Correct Implementation**</span>

A fixed lookup table is a set of data (bytes, words, etc.) stored in the
PROGMEM memory. The correct implementation involves using the TABLE and
READTABLE commands: \* Definition: `TABLE tablename…​ data…​ END TABLE`
\* Reading: `READTABLE` There is no DIM in the definition process, and
the data is part of the hex file, not filled at runtime.

<span class="strong">**Memory Efficiency**</span>

Storing data in PROGMEM ensures that there is only one copy of the data,
avoiding duplication. Copying data to an array is redundant as reading
the table can replace the array.

<span class="strong">**Practical Solutions**</span>

Using `TABLE - END TABLE` is the simplest way to handle data. For data
sets smaller than the EEPROM in the chip, load the table directly to
EEPROM and use `READTABLE` to read the data.

<span class="strong">**Advanced Techniques**</span>

<div class="orderedlist">

1.  PROGMEM Page Size Constraint: On the 16F, `TABLE-END TABLE` is
    constrained by PROGMEM page size (2048 items).
2.  EEPROM Storage: Use `EEPROM .. END EEPROM` and a direct method like
    `PROGREAD`. Data is stored in EEPROM, constrained by its size and
    typically byte values.
3.  Direct PROGMEM Storage: Use `DATA .. END DATA` and `PROGREAD`. Data
    is stored in PROGMEM, constrained by unused PROGMEM size and
    typically word values (max 0x3FFF for 16F chips).

</div>

<span class="strong">**Arrays in Embedded Systems**</span>

An array is a special type of variable that can store multiple values,
addressed individually using an index. Arrays can be bytes, longs,
integers, or words, and are held in RAM. Loading an array can be done
element by element or all at once.

<span class="strong">**Comparison of Methods**</span>

Using arrays can be costly in terms of RAM and PROGMEM. The following
examples illustrate the difference:

<span class="strong">**Using an Array**</span>

64 words Progmem / 13 bytes RAM

``` screen
        #CHIP 18F2550
        #option Explicit

        Dim myResult, myIndex as Byte

        // Using an array 64 words Progmem / 13 bytes RAM
        Dim myArray(10)
            myArray = 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
        For myIndex = 1 to 10
            myResult =  myArray(myIndex)
        Next
```

<span class="strong">**Using a Table**</span>

56 words Progmem / 2 bytes RAM

``` screen
        #CHIP 18F2550
        #option Explicit

        Dim myResult, myIndex as Byte

        // Using a table 56 words Progmem / 2 bytes RAM
        For myIndex = 1 to 10
            ReadTable myTable, myIndex, myResult
        Next

        Table myTable
            1, 2, 3, 4, 5, 6, 7, 8, 9, 10
        End Table
```

<span class="strong">**Usage**</span>

The `ReadTable` method provides data set capabilities to chips with
limited RAM, using fewer resources and offering faster performance.
Advanced techniques and proper understanding of memory usage can
significantly optimize embedded system performance.

<span class="strong">**Notes**</span>

<div class="itemizedlist">

-   A byte array is handled similarly to a string, which can be
    resource-intensive.

</div>

By following these guidelines, developers can efficiently implement
lookup reference tables in embedded systems, optimizing memory usage and
performance.

</div>
