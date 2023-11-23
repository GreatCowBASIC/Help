<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="dataset_for_eeprom"></span>Dataset for EEPROM

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
        EEPROM DataSetName [[,]address]
            // multiples values, strings etc.
            0,1,2,3
        END EEPROM
```

<span class="strong">**Command Availability:**</span>

Available on all PIC microcontrollers with EEPROM memory. AVR support
required use of AVR-ASM assembler.  GCASM does not support AVR EEPROM
operations.

<span class="strong">**Explanation:**</span>

The EEPROM construct creates an EEPROM dataset for use with the specific
microcontroller.  An EEPROM dataset is a list of values that are stored
in the EEPROM memory of the microcontroller, which then can be accessed
using the EPREAD() command or other EEPROM read operations.

The advantage of an EEPROM dataset is that they are memory efficient
being loaded directly into the EEPROM during programming operations.

EEPROM datasets are defined as follows:

<div class="orderedlist">

1.  Byte values,
2.  EEPROM addresses and EEPROM datasets CANNOT overlap,
3.  EEPROM addresses must not overlap TABLE data,
4.  TABLE data has precedence from address 0x00 until the the end of
    TABLE all data,
5.  Strings must be expressed as ASCII byte value(s),
6.  Multiple elements on a single line separated by commas,
7.  Constants and calculations within the single line dataset entries
    are permitted,
8.  Decimal values are NOT supported,
9.  Access is via EPRread(), not supported by READTABLE().  
      

</div>

<span class="strong">**Defining EEPROM datasets**</span>

<span class="emphasis">*Single data values*</span>

A single value on each line with in the dataset.  The example dataset,
shown below, has the data on different line in within the set.

Simple example: This creates an EEPROM dataset at the first EEPROM
location, then, the values of 12, 24, …​ 72 are the consecutive values.

``` screen
        EEPROM EEDataSet
            12
            24
            36
            48
            60
            72
        End EEPROM
```

<span class="emphasis">*Multiple data values of the same line*</span>

The following example creates the EEPROM dataset at EEPROM offset
address of 0x10.  

Multiple elements on a single line separated by commas.  The example
dataset, shown below, has the data separated by `,` and on different
line in within the dataset.

``` screen
        EEPROM EEDataSource  0x10
            12,  24, 36
            48,  60, 72
        End EEPROM
```

<span class="emphasis">*Data values as constants, and, with data
transformation*</span>

Constants and calculations within the single line.   The example
dataset, shown below, uses a defined constant to multiple the data with
the dataset.

``` screen
        #define calculation_constant 2

        EEPROM EEDataSource  0x20
        1 * calculation_constant
        2 * calculation_constant
        3 * calculation_constant
        8 * calculation_constant
        4 * calculation_constant
        5 * calculation_constant
        End EEPROM
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
    EEPROM Test_1
     "ABCDEFGHIJ"
    End EEPROM
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

This example creates several EEPROM datasets.  The example also create a
lookup table.  The EEPROM dataset are addressed with the additional
parameter to ensure there is no EEPROM dataset overlap.  

``` screen
        #chip 16F886
        #option explicit

        #DEFINE USART_BAUD_RATE 9600
        #DEFINE USART_TX_BLOCKING
        #DEFINE USART_DELAY OFF

        Dim EEdataaddress, myvar as Byte
        EEdataaddress = 2

        Readtable TwoBytes,EEdataaddress,myVar
        HSerPrint myVar


        // *********************** EXAMPLE EE DATA ************************
        // * THIS IS ONLY ACCESSIBLE VIA EPREAD or other EE read functions.
        /*
        Usage:      EEProm EEPromBlockName [[,] OffSet Address ]
                    OffSet address defaults to 0x00 if not stated.

                    Addresses and datasets CANNOT overlap.
                    Addresses must not overlap TABLE data.
                    TABLE data has precendence from address 0x00 until the the end of TABLE data
        */


        EEProm EEDataSet1 0x10    // Locate EE Data at address
        3,2,1
        End EEProm

        EEProm VersionData 0x20   // Locate EE Data at address
        "    PWM2Laser   "
        "  Fabrice ENGEL "
        "   Version 1.4  "
        "  November 2023 "
        End EEProm

        EEProm EEDataSet2 0x0D    // Locate EE Data at address
        1,2,3
        End EEProm

        EEProm EEDataSet 0X04     // Locate EE Data at address
        1,2,3
        End EEProm

        // **********************  EXAMPLE TABLE DATA BEING LOADED INTO EE BY THE COMIPILER
        // *                       THIS IS ONLY ACCESSIBLE VIA READTABLE

        Table TwoBytes STORE data // EE Data Address Allocated by compiler
            0X55,0XAA,0X55
        End Table
```

<span class="strong">**For more help, see
<a href="epread" class="link" title="EPRead">EPRead</a>,
<a href="lookup_tables" class="link" title="Lookup Tables">Creating EEProm data from a Lookup Table</a>**</span>

</div>
