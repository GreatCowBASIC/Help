<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="the_positives_and_negatives_of_variable_types"></span>The Positives and Negatives of Variable Types

</div>

</div>

</div>

<span class="strong">**Introduction:**</span>

This describes the variable types available in GCBASIC, explains how the
compiler interprets them, and provides guidance on selecting the
appropriate type for a given task. Although the focus is on GCBASIC,
many of the principles discussed are applicable to other programming
languages. Some notes on portability are therefore included.

A minimal amount of computer‑science theory is required to explain
certain behaviours. This is presented in a concise and practical manner.

<span class="strong">**Why So Many Different Variable Sizes?**</span>

Computers represent numbers in binary form. The size of a number is
determined by the width of the memory or register storing it, and by the
capabilities of the Arithmetic Logic Unit (ALU) that processes it.

Common binary sizes include: <span class="strong">**Bit**</span> (1
bit), <span class="strong">**Nibble**</span> (4 bits), <span
class="strong">**Byte**</span> (8 bits), <span
class="strong">**Word**</span> (16 bits), <span
class="strong">**Long**</span> (32 bits), and <span
class="strong">**Long Long**</span> (64 bits).

GCBASIC supports Bit, Byte, Word, and Long types, and also provides the
`Single` floating‑point type. GCBASIC does not provide a 64‑bit integer
type.

<span class="strong">**Bit**</span> variables represent a single binary
state. They are typically used for flags, port pins, and Boolean logic.

<span class="strong">**Byte**</span> variables are widely used on 8‑bit
microcontrollers. They may represent numeric values, ASCII characters,
port registers, nibbles, or user‑defined bitfields.

<span class="strong">**Word**</span> variables store 16‑bit unsigned
values ranging from 0 to 65535. They are commonly used for numeric
values, memory addresses, and pointers. Although the term “word” is also
used to describe ALU width, the GCBASIC `Word` type is unrelated to the
ALU word size.

<span class="strong">**Long**</span> variables store 32‑bit unsigned
values ranging from 0 to 4294967295. They are useful when values exceed
the range of a `Word`. For example, the `Millis()` function uses a
`Long` to represent extended time intervals.

<span class="strong">**Single**</span> varaible store 64-bit signed
values with seven decimal digits of precision. numeric range of
approximately 10^−38 to 10^38.

Although these types represent integer values, they must not be confused
with the `Integer` type, which is discussed next.

<span class="strong">**In The Real World**</span>

Mathematically, an integer is a whole number that may be positive,
negative, or zero. Microcontrollers do not inherently understand
negative numbers; instead, negative values are represented using binary
encoding rules.

GCBASIC provides two 16‑bit integer types:

<div class="itemizedlist">

-   `Word` — unsigned, range 0 to 65535
-   `Integer` — signed, range −32768 to +32767

</div>

Both occupy identical 16‑bit storage. The distinction lies solely in how
the compiler interprets the stored bits.

In modern terminology:

<div class="itemizedlist">

-   `Word` corresponds to `Uint16_t`
-   `Integer` corresponds to `Int16_t`

</div>

<span class="strong">**One Size Does Not Fit All**</span>

GCBASIC defines the following variable types:

``` programlisting
Byte (8 Bit)
Integer / Word (16 Bit)
Long (32 Bit)
Single (32 Bit Floating Point)
```

Integer types represent whole numbers:

``` programlisting
8  Bits - 0 to 255
16 Bits - 0 to 65535
32 Bits - 0 to 4294967295
```

However, these ranges apply only to unsigned values. Signed values
require a different interpretation.

Different programming languages use different default integer sizes and
conventions for signedness. To improve portability, modern languages
encourage explicit, sized types:

``` programlisting
Int8_t
Int16_t
Int32_t
Int64_t
```

and their unsigned equivalents:

``` programlisting
Uint8_t
Uint16_t
Uint32_t
Uint64_t
```

Mapping these to GCBASIC:

``` programlisting
#define Uint8_t  Byte
#define Uint16_t Word
#define Uint32_t Long

#define Int16_t  Integer
```

<span class="strong">**There Are Always Negatives**</span>

Negative numbers are represented using a sign bit. If the most
significant bit is set, the value is interpreted as negative; if clear,
it is interpreted as positive.

This approach has several consequences:

<div class="orderedlist">

1.  The usable magnitude is reduced because one bit is reserved for the
    sign.
2.  A negative zero is possible unless avoided.
3.  Most ALUs do not implement subtraction directly; subtraction is
    performed using addition of a two’s complement value.

</div>

Two’s complement encoding resolves these issues.

<span class="strong">**Two’s Complement**</span>

Two’s complement is obtained by inverting all bits and then adding one:

``` programlisting
MyVar = NOT MyVar + 1
```

This ensures a unique representation for zero and enables subtraction
through addition.

Example for −1 on an 8‑bit ALU:

``` programlisting
00000001   ; +1
NOT → 11111110
+1  → 11111111   ; -1
```

Adding −1 to 3:

``` programlisting
11111111    -1
00000011 +   3
--------
00000010     2
```

Two’s complement applies to all integer sizes:

``` programlisting
MyByte = NOT MyByte + 1
MyWord = NOT MyWord + 1
MyLong = NOT MyLong + 1
```

Because signed values reduce the available magnitude, it is important to
specify whether a variable is signed or unsigned. A stored value of
`0xFF` may represent either 255 or −1, depending on interpretation.

GCBASIC distinguishes these through the `Word` (unsigned) and `Integer`
(signed) types.

<span class="strong">**The Single Floating‑Point Type**</span>

The `Single` type is GCBASIC’s floating‑point variable type. It is used
to represent fractional values and very large or very small numbers.

A `Single` is a 32‑bit IEEE‑754 floating‑point value consisting of:

<div class="itemizedlist">

-   1 sign bit
-   8 exponent bits
-   23 mantissa bits

</div>

This provides:

<div class="itemizedlist">

-   Approximately seven decimal digits of precision
-   A numeric range of approximately 10^−38 to 10^38

</div>

Typical use cases include:

<div class="itemizedlist">

-   Fractional measurements
-   Sensor calibration
-   Scientific calculations

</div>

Example:

``` programlisting
Dim Temperature As Single
Temperature = 23.75
```

Floating‑point operations are computationally expensive on 8‑bit
microcontrollers because they are implemented entirely in software. For
this reason, `Single` should be used only when fractional values are
required.

Conversions between integer and floating‑point types occur
automatically:

``` programlisting
Dim A As Word
Dim B As Single

A = 200
B = A / 3     ; B = 66.66666
```

Converting back truncates the fractional component:

``` programlisting
A = B        ; A = 66
```

Limitations include:

<div class="itemizedlist">

-   Precision limited to approximately seven digits
-   Accumulation of rounding errors
-   Equality comparisons should use a tolerance:

</div>

``` programlisting
If Abs(Value - Target) < 0.0001 Then
    ' Considered equal
End If
```

<span class="strong">**In Conclusion**</span>

Negative numbers are represented using two’s complement encoding.
GCBASIC provides the following variable types:

<div class="itemizedlist">

-   `Byte` — unsigned 8‑bit
-   `Word` — unsigned 16‑bit
-   `Integer` — signed 16‑bit
-   `Long` — unsigned 32‑bit
-   `Single` — 32‑bit floating‑point

</div>

Integer types should be used when performance and precision are
required. The `Single` type should be used only when fractional values
are necessary.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="advanced_variabletypes" class="link" title="Advanced VariableTypes">Advanced VariableTypes</a>
    — the `Single` floating‑point type
-   <a href="data_types" class="link" title="Data Types">Data Types</a>
    — the full list of GCBASIC variable types
-   <a href="variables_and_data_types" class="link" title="Variables and Data Types">Variables and Data Types</a>
    — byte‑level access to multi‑byte variables

</div>

</div>
