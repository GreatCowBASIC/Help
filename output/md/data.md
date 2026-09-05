<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="data"></span>DATA

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
        DATA DataSetName [as Byte | Word]
            // multiples values, strings etc.
            0,1,2,3
        END DATA
```

<span class="strong">**Command Availability:**</span>

Available on all PIC microcontrollers with DATA memory.

<span class="strong">**Explanation:**</span>

The `DATA` construct creates a DATA dataset, or DATA block, for use with
the specific microcontroller. A DATA dataset is a list of values that
are stored in the program memory (PROGMEM) of the microcontroller, which
can then be accessed using the `ProgramRead()` command or other DATA
read operations.

The advantage of a DATA dataset is that it is memory efficient, being
loaded directly into program memory during programming operations.

DATA datasets are defined as follows:

<div class="orderedlist">

1.  Byte or Word values,
2.  Multiple numeric elements on a single line separated by commas,
3.  Constants and calculations within the single-line dataset entries
    are permitted,
4.  Decimal values are NOT supported,
5.  Access is via `ProgramRead()`.  
      

</div>

<span class="strong">**Defining DATA Datasets**</span>

<span class="emphasis">*Single Data Values*</span>

A single value on each line within the dataset. The example dataset
shown below has the data on different lines within the set.

Simple example: this creates a DATA dataset at the first DATA location;
the values 12, 24, …​ 72 are the consecutive values.

``` programlisting
        DATA EEDataSet as Byte
            12
            24
            36
            48
            60
            72
        End DATA
```

<span class="emphasis">*Multiple Data Values on the Same Line*</span>

The following example creates the DATA dataset at DATA offset address
0x10.

Multiple elements can appear on a single line, separated by commas. The
example dataset shown below has the data separated by `,` and spread
across different lines within the dataset.

``` programlisting
        DATA EEDataSource  as Byte
            12,  24, 36
            48,  60, 72
        End DATA
```

<span class="emphasis">*Data Values as Constants, with Data
Transformation*</span>

Constants and calculations are permitted within a single line. The
example dataset shown below uses a defined constant to multiply each
entry in the dataset.

``` programlisting
        #define calculation_constant 2

        DATA EEDataSource as Word
        1 * calculation_constant
        2 * calculation_constant
        3 * calculation_constant
        8 * calculation_constant
        4 * calculation_constant
        5 * calculation_constant
        End DATA
```

<span class="emphasis">*Data Values as Strings*</span>

Strings can be defined. Strings are delimited by double quotes. The
following examples show the methods.

Any ASCII characters between two `"` (double quotes) are converted to
dataset data. Also see ASCII escape codes below.

A source string can be one string per line, or comma-separated strings
on the same line.

Example:

``` programlisting
    DATA Test_1 as Byte
     "ABCDEFGHIJ"
    End DATA
```

<span class="emphasis">*ASCII Escape Codes*</span>

Accepted escape sequences are shown in the table below.

<div class="informaltable">

| Escape sequence | Meaning                                        |
|:----------------|:-----------------------------------------------|
| \\a             | beep                                           |
| \\b             | backspace                                      |
| \\f             | formfeed                                       |
| \\l or \\n      | newline                                        |
| \\r             | carriage return                                |
| \\t             | tab                                            |
| \\0             | Null value, equates to ASCII 0. Same as \\&000 |
| \\&nnn          | ASCII character in decimal                     |
| \\\\            | backslash                                      |
| \\"             | double quote                                   |
| \\'             | single quote                                   |

</div>

<span class="emphasis">*Maximum Stored Value*</span>

The <span class="strong">**maximum value**</span> that can be stored in
a single program-memory <span class="strong">**word**</span> location
across the PIC families:

<div class="informaltable">

|                                                            |                       |                           |                                           |                 |                                                    |
|:-----------------------------------------------------------|:----------------------|:--------------------------|:------------------------------------------|:----------------|:---------------------------------------------------|
| Family                                                     | Instruction Word Size | Program Memory Word Width | Maximum Value per Word (unsigned decimal) | Hex Range       | Can store full 16-bit value (0-65535) in one word? |
| <span class="strong">**PIC10**</span>                      | 12-bit                | 12 bits                   | 4095                                      | 0x000 - 0xFFF   | No                                                 |
| <span class="strong">**PIC12**</span> (baseline)           | 12-bit                | 12 bits                   | 4095                                      | 0x000 - 0xFFF   | No                                                 |
| <span class="strong">**PIC12**</span> (enhanced mid-range) | 14-bit                | 14 bits                   | 16383                                     | 0x0000 - 0x3FFF | No                                                 |
| <span class="strong">**PIC14**</span>                      | 14-bit                | 14 bits                   | 16383                                     | 0x0000 - 0x3FFF | No                                                 |
| <span class="strong">**PIC16**</span> (mid-range)          | 14-bit                | 14 bits                   | 16383                                     | 0x0000 - 0x3FFF | No                                                 |
| <span class="strong">**PIC16**</span> (enhanced mid-range) | 14-bit                | 14 bits                   | 16383                                     | 0x0000 - 0x3FFF | No                                                 |
| <span class="strong">**PIC18**</span>                      | 16-bit                | 16 bits                   | 65535                                     | 0x0000 - 0xFFFF | <span class="strong">**Yes**</span>                |

</div>

<span class="emphasis">*Quick Summary Table (Most Common Cases)*</span>

<div class="informaltable">

|                                |                   |                                                    |                                             |
|:-------------------------------|:------------------|:---------------------------------------------------|:--------------------------------------------|
| Family group                   | Typical word size | Max value you can store in one program memory word | Equivalent to storing a full 16-bit number? |
| PIC10 / baseline PIC12         | 12 bits           | <span class="strong">**4095**</span> (0xFFF)       | No                                          |
| PIC14 / PIC16 / enhanced PIC12 | 14 bits           | <span class="strong">**16383**</span> (0x3FFF)     | No                                          |
| PIC18                          | 16 bits           | <span class="strong">**65535**</span> (0xFFFF)     | Yes                                         |

</div>

<span class="emphasis">*Important Notes*</span>

<div class="itemizedlist">

-   <span class="strong">**PIC18**</span> is the only 8-bit PIC family
    where you can directly store any 16-bit value (0-0xFFFF) in a single
    program-memory word location.

-   On all earlier families (PIC10, PIC12 baseline, PIC14, PIC16,
    enhanced mid-range), you must split any value greater than
    0x3FFF (16383) across <span class="strong">**two words**</span> if
    you need the full 16-bit range.

-   The values above apply when storing constants, lookup table entries,
    `retlw` literals, `data`/`db` directives, and so on — that is, the
    largest number that fits in one program-memory <span
    class="strong">**word**</span>.

-   <span class="strong">**Program memory addressing varies by
    family:**</span>

-   On <span class="strong">**PIC18F**</span> family chips, program
    memory is byte-addressable (addresses run consecutively: 0, 1, 2, 3,
    …​). For <span class="strong">**word**</span> (16-bit) reads/writes,
    the address <span class="strong">**must be even**</span> (starting
    on the low byte of a word pair; odd addresses would misalign).
    Byte-level access uses fully consecutive addresses.

-   On <span class="strong">**non-18F**</span> families
    (PIC10/PIC12/PIC14/PIC16, etc.), program memory is word-addressable
    with consecutive word indices (0, 1, 2, …​); byte handling is
    limited or requires special care.

    ``` literallayout
    Always use even addresses for word operations on PIC18F when using `ProgramRead`, `DATA` lookups, or tables, to avoid reading split or incorrect data. See the chip datasheet for TBLPTR (table pointer) details on PIC18F.
    ```

</div>

<span class="strong">**Complete Working Example Program**</span>

This example creates several DATA datasets and a lookup table. The DATA
datasets are addressed with an additional parameter to ensure that no
DATA dataset overlaps another.

``` programlisting
        #chip 16F886
        #option explicit

        #DEFINE USART_BAUD_RATE 9600
        #DEFINE USART_TX_BLOCKING
        #DEFINE USART_DELAY OFF

        Dim dataaddress, datavalue as Byte

        DATA DataSet1 as Byte
            3,2,1
        End DATA

        DATA VersionData as Byte
        "    PWM2Laser   "
        "  Fabrice ENGEL "
        "   Version 1.4  "
        "  November 2023 "
        End DATA

        For dataaddress = 0 to 2
            ProgramRead  ( @DataSet1 + dataaddress , datavalue )          ' <<< the read this page's DATA block is designed for
            HserPrint datavalue
        Next
```

<span class="strong">**Key line:**</span>
`ProgramRead ( @DataSet1 + dataaddress , datavalue )` — reads back one
byte of the `DataSet1` block using its compile-time address
(`@DataSet1`) offset by the loop counter.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="programread" class="link" title="ProgramRead">ProgramRead</a> — reading
    the values this page’s DATA blocks store
-   <a href="lookup_tables" class="link" title="Lookup Tables">Creating data from a Lookup Table</a> — an
    alternative table-based approach
-   <a href="dataset_for_eeprom" class="link" title="Dataset for EEPROM">Dataset for EEPROM</a> — the
    equivalent construct for EEPROM-backed data

</div>

</div>
