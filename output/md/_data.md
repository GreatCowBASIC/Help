<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="_data"></span>DATA

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

The DATA construct creates an DATA dataset for use with the specific
microcontroller.  An DATA dataset is a list of values that are stored in
the PROGMEM memory of the microcontroller, which then can be accessed
using the ProgRead() command or other DATA read operations.

The advantage of an DATA dataset is that they are memory efficient being
loaded directly into the DATA during programming operations.

DATA datasets are defined as follows:

<div class="orderedlist">

1.  Byte or Word values,
2.  Multiple numeric elements on a single line separated by commas,
3.  Constants and calculations within the single line dataset entries
    are permitted,
4.  Decimal values are NOT supported,
5.  Access is via ProgRead().  
      

</div>

<span class="strong">**Defining DATA datasets**</span>

<span class="emphasis">*Single data values*</span>

A single value on each line with in the dataset.  The example dataset,
shown below, has the data on different line in within the set.

Simple example: This creates an DATA dataset at the first DATA location,
then, the values of 12, 24, …​ 72 are the consecutive values.

``` screen
        DATA EEDataSet as Byte
            12
            24
            36
            48
            60
            72
        End DATA
```

<span class="emphasis">*Multiple data values of the same line*</span>

The following example creates the DATA dataset at DATA offset address of
0x10.  

Multiple elements on a single line separated by commas.  The example
dataset, shown below, has the data separated by `,` and on different
line in within the dataset.

``` screen
        DATA EEDataSource  as Byte
            12,  24, 36
            48,  60, 72
        End DATA
```

<span class="emphasis">*Data values as constants, and, with data
transformation*</span>

Constants and calculations within the single line.   The example
dataset, shown below, uses a defined constant to multiple the data with
the dataset.

``` screen
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

     

<span class="emphasis">*Data values as Strings*</span>

Strings can be defined.  Strings are delimited by double quotes.    The
following examples show the methods.

Any ASCII characters between any two " " (double quotes) will be
converted to dataset data.   Also see ASCII escape codes.

A source string can be one string per line or comma separated strings,
therefore, on the same line.

Example:

``` screen
    DATA Test_1 as Byte
     "ABCDEFGHIJ"
    End DATA
```

<span class="emphasis">*ASCII Escape code*</span>

Accepted escape strings are shown in the dataset below.

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
| \\&nnn          | ascii char in decimal                          |
| \\\\            | backslash                                      |
| \\"             | double quote                                   |
| \\'             | single quote                                   |

</div>

<span class="strong">**Complete working example program**</span>

This example creates several DATA datasets.  The example also create a
lookup table.  The DATA dataset are addressed with the additional
parameter to ensure there is no DATA dataset overlap.  

``` screen
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
            ProgramRead  ( @DataSet1 + dataaddress , datavalue )
            HserPrint datavalue
        Next
```

<span class="strong">**For more help, see
<a href="" class="link">ProgramRead</a>,
<a href="_lookup_tables.html" class="link" title="Lookup Tables">Creating DATA data from a Lookup Table</a>**</span>

</div>
