<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="data_types"></span>Data Types

</div>

</div>

</div>

This section discusses the different types and sizes of data variables
used by GCBASIC, and how they are interpreted or handled by GCBASIC
methods.

The section also provides insight into which type of variable to use and
when.

<span class="strong">**What variable sizes are supported by
GCBASIC?**</span>

GCBASIC implements support for Bit, Byte, Word, Integer, and Long
variable types, all of which are described below.

Supported variables are <span class="strong">**Bit**</span> (1 bit),
<span class="strong">**Byte**</span> (8 bit), <span
class="strong">**Word**</span> (16 bit), <span
class="strong">**Integer**</span> (16 bit), and <span
class="strong">**Long**</span> (32 bit). GCBASIC does not support
decimal numbers.

<span class="strong">**Bit**</span> is used as a flag or a port pin, and
has two states, which may be:

``` programlisting
    ON or OFF
    TRUE or FALSE
    HIGH or LOW
    1 or 0
    SET or RESET
```

or other complementary states, depending on how your application
interprets and handles the data.

<span class="strong">**Byte**</span> is the most common size in 8-bit
devices and could represent a number, an ASCII character, a port, two
nibbles (as used by hex or BCD number systems), an internal register, an
8-bit variable, or any user-defined collection of up to eight bits, such
as a group of flags.

<span class="strong">**Word**</span> is normally used for its numeric
value. 16 bits will allow it to store numbers from zero to 65535, which
is large enough to store the product of any two 8-bit bytes without
overflowing. However, it is not confined to being used as a numeric
value. A Word may be used in any manner that your application needs,
depending on how it interprets the 16 bits of data. Examples may be a
memory address or a data pointer.

<div class="itemizedlist">

-   <span class="strong">**Note:**</span> The word size of a device (as
    opposed to the Word type above) is a representation of the number of
    bits that it can manipulate simultaneously. The PIC and AVR
    microcontrollers supported by GCBASIC manipulate 8 bits at a time,
    and so are considered to have an 8-bit word.

</div>

<span class="strong">**Long**</span> is for situations where values
exceeding 65535 have to be handled, and has a range of zero to
4294967295 (2^32-1). It is rarely used in 8-bit devices, but is
invaluable on the rare occasions that it is needed. `Millis()` is an
example that uses the Long data type to handle time periods of up to 50
days.

All of the above can be considered to be integer values of varying
magnitude, as they can hold non-fractional positive whole numbers, but
try not to confuse <span class="strong">**integer values**</span> with
the <span class="strong">**Integer variable type**</span> - they are
complementary but separate concepts, as you will see below.

An <span class="strong">**integer**</span> is a whole number (not a
fractional number) that can be positive, negative, or zero.

In your application there may be a need to represent negative numbers in
your variables, and that is where the GCBASIC <span
class="strong">**Integer variable type**</span> is useful. An <span
class="strong">**Integer variable**</span> is similar to the <span
class="strong">**Word variable**</span>, as they are both 16 bits. The
difference is how the GCBASIC compiler interprets the data bits that it
contains.

The compiler will treat a <span class="strong">**Word variable
type**</span> as a variable that can store the values 0 to 65535, but it
will see the <span class="strong">**Integer variable type**</span> as a
variable that can store values from -32768 to 32767.

<span class="strong">**Variable size**</span>

Each type of variable is defined with various bit lengths; in GCBASIC
these are:

``` programlisting
    Byte                 8 Bit
    Integer             16 Bit
    Word                16 Bit
    Long                32 Bit
```

All four of the above number types are true integers, in that they are
representations of an integer, non-fractional number, as follows:

``` programlisting
    8  Bit - an 8 Bit number can be in the range of 0 to 255
    16 Bit - a 16 Bit number can be in the range of 0 to 65535
    32 Bit - a 32 Bit number can be in the range of 0 to 4294967295 (2^32-1)
```

But on their own, they can only represent positive numbers. In
mathematics there is a need for an integer that can be positive,
negative, or zero. Note that zero is always a positive whole number.

<span class="strong">**Two’s Complement**</span>

To take the two’s complement of a number, it is inverted and then
incremented:

``` programlisting
        MyVar = NOT MyVar + 1
```

The increment, of adding 1, has two effects: it avoids the possible
creation of a negative zero (a value of 10000000 would otherwise be seen
as -128), and it allows subtraction to be achieved through addition.

If MyVar contained a value of 1, the 8-bit representation would be:

``` programlisting
    00000001
```

The NOT will make it

``` programlisting
    11111110
```

Note that the most significant bit is now 1, so as a signed value it is
negative.

The increment will result in a value of:

``` programlisting
    11111111
```

So, minus one, using an 8-bit representation in two’s complement
notation, is 11111111.

Let’s test it by adding -1 to plus 3:

``` programlisting
    11111111    -1
    00000011 +   3
    ==============
    00000010     2
```

We have successfully subtracted 1 from 3 by adding minus 1 to 3 and
obtaining a result of 2.

Notice that while a Byte is normally used to represent 0 to 255, making
the MSB (most significant bit) into a sign bit brings the maximum value
down to 127. A signed 8-bit integer can represent numbers in the range
-128 to 127. That is still 256 values including zero, but they can now
be negative or positive numbers.

The benefit of the two’s complement method is that it works for any size
of variable:

``` programlisting
    MyByte = NOT MyByte +1
    MyWord = NOT MyWord +1
    MyLong = NOT MyLong +1
```

All of the above will result in a negated version of the original
contents.

But not all - in fact, relatively few - methods of a microcontroller
require negative values, so in situations where negative values are not
required, the loss of half of the magnitude of a Byte or Word can be
significant. That is why it is necessary to be able to specify whether a
value is signed or unsigned, that is, whether the MSB is the sign bit or
part of the value.

It follows from the above that the user program does need to know what
sort of data to expect, as a value of 0xFF could be considered to be
both 255 and -1, depending on the interpretation of the variable. That
is why it is important to have signed and unsigned data types, so that
the compiler can decide how to handle or interpret the contents. As
shown above, in GCBASIC those types are referred to as Integer and Word
respectively.

<span class="strong">**Summary**</span>

GCBASIC implements support for Bit, Byte, Word, Integer, and Long
variable types, all of which are described above.

Negative numbers are represented as two’s complement.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="variable_types" class="link" title="Variable Types">Variable Types</a> — the
    primary Byte/Word/Integer/Long/Array reference table
-   <a href="advanced_variabletypes" class="link" title="Advanced VariableTypes">Advanced VariableTypes</a> — byte-level
    aliasing of Word and Long variables
-   <a href="dim" class="link" title="Dim">Dim</a> — declaring
    variables of these types

</div>

</div>
