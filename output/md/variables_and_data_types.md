<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="variables_and_data_types"></span>Variables and Data Types

</div>

</div>

</div>

<span class="strong">**Overview**</span>

GCBASIC supports fundamental numeric data types for variable
declarations: `Byte`, `Word`, `Integer`, and `Long`.   Each type differs
in size, range, and whether it can represent negative numbers.   For
Advanced Variables see the appropiate Help page.

Variables are declared using the `Dim` statement:

``` programlisting
Dim variable_name As DataType
```

<span class="strong">**Data Types**</span>

<span class="strong">**<span class="emphasis">*Byte*</span>**</span>

A `Byte` is an unsigned 8-bit integer.  

<div class="informaltable">

| Property      | Value           |
|:--------------|:----------------|
| Size          | 8 bits (1 byte) |
| Signed        | No              |
| Minimum value | 0               |
| Maximum value | 255             |

</div>

``` programlisting
Dim my_byte As Byte
my_byte = 200

or

Dim my_byte As Byte = 200
```

Use `Byte` when you need a small, non-negative counter or flag, or when
interfacing directly with hardware registers.  

<span class="strong">**<span class="emphasis">*Word*</span>**</span>

A `Word` is an unsigned 16-bit integer.  

<div class="informaltable">

| Property      | Value             |
|:--------------|:------------------|
| Size          | 16 bits (2 bytes) |
| Signed        | No                |
| Minimum value | 0                 |
| Maximum value | 65,535            |

</div>

``` programlisting
Dim my_word As Word
my_word = 50000

or

Dim my_word As Word = 50000
```

Internally, a `Word` is composed of two bytes:

<div class="itemizedlist">

-   `my_word_H` — high byte (bits 15–8)
-   `my_word` — low byte (bits 7–0)

</div>

You access the two bytes via the `my_word_H` or `my_word`.  If you want
to address each byte indepently use the cast \[BY\]

<span class="strong">**<span class="emphasis">*Integer*</span>**</span>

An `Integer` is a <span class="strong">**signed**</span> 16-bit
integer.  

<div class="informaltable">

| Property      | Value                  |
|:--------------|:-----------------------|
| Size          | 16 bits (2 bytes)      |
| Signed        | Yes (two’s complement) |
| Minimum value | −32,768                |
| Maximum value | 32,767                 |

</div>

``` programlisting
Dim my_integer As Integer
my_integer = -1200
```

`Integer` shares the same 16-bit storage as `Word` but interprets the
most significant bit as a sign bit, allowing negative values.  

<span class="strong">**<span class="emphasis">*Long*</span>**</span>

A `Long` is an unsigned 32-bit integer.  

<div class="informaltable">

| Property      | Value             |
|:--------------|:------------------|
| Size          | 32 bits (4 bytes) |
| Signed        | No                |
| Minimum value | 0                 |
| Maximum value | 4,294,967,295     |

</div>

``` programlisting
Dim my_long As Long
my_long = 1000000
```

A `Long` occupies four consecutive bytes in memory.   GCBASIC names
these bytes using suffixes on the variable name (see
<a href="variables_and_data_types#byte-aliasing" class="xref">the section called “Variables and Data Types”</a>).  

<span class="emphasis">*\*Quick Reference\**</span>

<div class="informaltable">

| Type      | Bits | Bytes | Signed | Range             |
|:----------|:-----|:------|:-------|:------------------|
| `Byte`    | 8    | 1     | No     | 0 … 255           |
| `Word`    | 16   | 2     | No     | 0 … 65,535        |
| `Integer` | 16   | 2     | Yes    | −32,768 … 32,767  |
| `Long`    | 32   | 4     | No     | 0 … 4,294,967,295 |

</div>

<span id="byte-aliasing"></span><span class="strong">**Byte
Aliasing**</span>

GCBASIC allows individual bytes within a multi-byte variable to be
addressed directly using the `Alias` keyword.   This is particularly
useful for `Long` variables, where you may need to read or write
individual bytes — for example, when packing data into serial frames or
working with hardware that accepts byte-wide registers.  

<span class="strong">**\_Long Byte Layout \_**</span>

A `Long` variable named `my_variable` occupies four bytes in memory.  
GCBASIC assigns the following internal byte names automatically:

<div class="informaltable">

| Byte name       | Position     | Description                        |
|:----------------|:-------------|:-----------------------------------|
| `my_variable_E` | Byte 4 (MSB) | Most significant byte (bits 31–24) |
| `my_variable_U` | Byte 3       | Upper-middle byte (bits 23–16)     |
| `my_variable_H` | Byte 2       | Lower-middle byte (bits 15–8)      |
| `my_variable`   | Byte 1 (LSB) | Least significant byte (bits 7–0)  |

</div>

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

### Note

The suffix convention follows the GCBASIC internal naming scheme: `_E`
(extended), `_U` (upper), `_H` (high), and no suffix for the low byte.  

</div>

<span class="strong">**<span class="emphasis">*Declaring Byte Aliases
for a Long*</span>**</span>

To work with individual bytes of a `Long`, declare separate `Byte`
variables that alias each byte by name:

``` programlisting
Dim my_variable As Long

Dim ByteOne   As Byte Alias my_variable_E  ' Bits 31-24 (most significant)
Dim ByteTwo   As Byte Alias my_variable_U  ' Bits 23-16
Dim ByteThree As Byte Alias my_variable_H  ' Bits 15-8
Dim ByteFour  As Byte Alias my_variable    ' Bits  7-0  (least significant)
```

`ByteOne`, `ByteTwo`, `ByteThree`, and `ByteFour` are not separate
memory locations — they are <span class="strong">**aliases**</span> that
refer directly to the corresponding byte within `my_variable`.   Writing
to an alias immediately changes the underlying `Long`, and vice versa.  

<span class="strong">**Memory Layout Diagram**</span>

``` literallayout
 my_variable (Long, 32-bit)
 ┌──────────┬──────────┬──────────┬──────────┐
 │ Byte 4   │ Byte 3   │ Byte 2   │ Byte 1   │
 │ bits31-24│ bits23-16│ bits15-8 │ bits 7-0 │
 │(my_var_E)│(my_var_U)│(my_var_H)│(my_var)  │
 │ ByteOne  │ ByteTwo  │ByteThree │ ByteFour │
 └──────────┴──────────┴──────────┴──────────┘
  MSB                                     LSB
```

<span class="strong">**<span class="emphasis">*Example: Extracting Bytes
from a Long Value*</span>**</span>

``` programlisting
Dim my_variable As Long

Dim ByteOne   As Byte Alias my_variable_E
Dim ByteTwo   As Byte Alias my_variable_U
Dim ByteThree As Byte Alias my_variable_H
Dim ByteFour  As Byte Alias my_variable

' Assign a value to the Long
my_variable = 0x12345678

' Now each alias holds its respective byte:
' ByteOne   = 0x12  (18  decimal)
' ByteTwo   = 0x34  (52  decimal)
' ByteThree = 0x56  (86  decimal)
' ByteFour  = 0x78  (120 decimal)

HSerSend ByteOne    ' transmit most significant byte first
HSerSend ByteTwo
HSerSend ByteThree
HSerSend ByteFour   ' transmit least significant byte last
```

<span class="strong">**<span class="emphasis">*Example: Assembling a
Long from Individual Bytes*</span>**</span>

Aliases also allow you to build up a `Long` byte-by-byte:

``` programlisting
Dim my_variable As Long

Dim ByteOne   As Byte Alias my_variable_E
Dim ByteTwo   As Byte Alias my_variable_U
Dim ByteThree As Byte Alias my_variable_H
Dim ByteFour  As Byte Alias my_variable

ByteOne   = 0x12
ByteTwo   = 0x34
ByteThree = 0x56
ByteFour  = 0x78

' my_variable now equals 0x12345678 (305,419,896 decimal)
```

<div class="warning" style="margin-left: 0.5in; margin-right: 0.5in;">

### Warning

The `Alias` keyword creates a <span class="strong">**reference**</span>,
not a copy. Any change to the aliased byte variable immediately affects
the full `Long`, and any assignment to the `Long` immediately changes
the value seen through all aliases.   Never alias the same byte to two
different variables and write to both without understanding which write
will take effect last.  

</div>

<span class="strong">**See Also**</span>

<div class="itemizedlist">

-   `Dim` — variable declaration
-   `HSerSend` — hardware serial transmit
-   `Alias` — memory aliasing for overlapping variable declarations

</div>

</div>
