<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="_data_types"></span>Data Types

</div>

</div>

</div>

This section discusses the different types and sizes of data variables
used by GCBASIC, and how they are interpreted or handled by GCBASIC
methods.

The section also provides an insight of which type of variable to use
and when.

<span class="strong">**What variable sizes are suported by
GCBASIC?**</span>

GCBASIC implements support for Bit, Byte, Word, Integer and Long
Variable Types, all of which are described below.

Supported variables are <span class="strong">**Bit**</span> (1 Bit),
<span class="strong">**Byte**</span> (8 Bit), <span
class="strong">**Word**</span> (16 Bit), <span
class="strong">**Long**</span> (32 Bit). GCBASIC does not support
decimal numbers.

<span class="strong">**Bit**</span> is used as a Flag or a Port Pin and
has two states which may be:

``` screen
    ON or OFF
    TRUE or FALSE
    HIGH or LOW
    1 or 0
    SET or RESET
```

other complementary states depending on how your application interprets
and handles the data.

<span class="strong">**Byte**</span> is the most common size in 8 Bit
devices and could represent a Number, an ASCII Character, a Port, two
Nibbles (as used by Hex or BCD number systems), an Internal Register, an
8 bit Variable or any user defined collection of to eight Bits such as a
group of flags.

<span class="strong">**Word**</span> is normally used for its Numeric
value. 16 Bits will allow it to store Numbers from Zero to 65535 which
is large enough to store the product of any two 8 bit Bytes without
overflowing.   However, it is not confined to being used as a numeric
value.   A Word may be used in any manner that your application needs
depending on how it interprets the 16 Bits of data. Examples may be a
memory address or a data pointer.

<div class="itemizedlist">

-   <span class="strong">**Note:**</span> The Word size of a device (as
    opposed to the Word Type above) is a representation of the number of
    Bits that it can manipulate simultaneously by the chip.    The
    number of Bits for PIC and AVR Microcontrolers supported by GCBASIC
    are 8 Bits and so they are considered to have an 8 Bit Word.\*

</div>

<span class="strong">**Long**</span> is for situations where Values
exceeding 65535 have to be handled and has a range of zero to 4294967295
(2^32-1).  It is rarely used in 8 Bit devices but is invaluable on the
rare occasions that it is needed.    The Millis() is an example that
uses the Long Data Type to handle time periods of up to 50 days.

All of the above can be considered to be Integer Values of varying
magnitude as they can hold non Fractional Positive Whole Numbers, but
try not to confuse <span class="strong">**Integer Values**</span> with
the <span class="strong">**Integer Variable Type**</span>, they are
complementary but separate concepts as you will see below.

An <span class="strong">**integer**</span> is a whole number (not a
fractional number) that can be Positive, Negative, or Zero.

In your application there may be a need to be able represent Negative
Numbers in our variables and that is where the GCBASIC <span
class="strong">**Integer Variable Type**</span> is useful. An <span
class="strong">**Integer Variable**</span> is similar to the <span
class="strong">**Word Variable**</span> as they are both 16 bits.    The
difference how the GCBASIC compiler interprets the data bits that it
contains.

The compiler will treat a <span class="strong">**Word Variable
Type**</span> as a Variable that can store the values 0 &lt; 65535 but
it will see the <span class="strong">**Integer Variable Type**</span> as
a Variable that can store values of -32768 &lt; 0 &lt;32767.

<span class="strong">**Variable size**</span>

Each type of variable is defined in various bit lengths, in this case
GCBASIC these are:

``` screen
    Byte                 8 Bit
    Integer             16 Bit
    Word                16 Bit
    Long                32 Bit
```

All four of the above are number types are true Integers.   In that they
are representations of a integer non fractional number as follows:

``` screen
    8  Bit - an 8 Bit number can be in the range of 0 to 255
    16 Bit - a 16 Bit number can be in the range of 0 to 65535
    32 Bit - a 32 Bit number can be in the range of 0 to 43294967295
```

But, they can only represent positive numbers.   In Mathematics there is
a need for an Integer that can be Positive, Negative, or Zero.   Note
that Zero is always a Positive Whole Number.

<span class="strong">**Two’s Complement**</span>

To take the Two’s Complement of a number it is inverted then
incremented:

``` screen
        MyVar = NOT MyVar + 1
```

The increment, of adding 1, has two effects, it avoids the possible
creation of a negative zero as a value of 1000000 would be seen as -128
and it allows subtraction to be achieved through addition.

If MyVar contained a value of 1 the 8 Bit representation would be:

``` screen
    00000001
```

The NOT will make it

``` screen
    11111110
```

Note that the Most significant Bit is now 1 so as a signed value it is
negative.

The increment will result in a value of:

``` screen
    11111111
```

So Minus one using an 8 Bit representation in Two’s Complement notation
is 11111111

Let’s test it by adding -1 to plus 3

``` screen
    11111111    -1
    00000011 +   3
    ==============
    00000010     2
```

We have successfully subtracted 1 from 3 by adding Minus 1 to 3 and
obtaining a result of 2.

Notice that while a Byte is normally used to represent 0 &lt; 255 by
making the MSB (Most Significant Bit) into a sign bit the maximum value
is now 127.   A signed 8 Bit integer can represent numbers in the range
-128 &lt; 0 &lt; 127.   That is still 256 values including Zero but they
can now be Negative or Positive numbers.

The benefit of the two’s complement method is that it works for any size
of variable:

``` screen
    MyByte = NOT MyByte +1
    MyWord = NOT MyWord +1
    MyLong = NOT MyLong +1
```

All of the above will result in a Negated version of the original
contents.

But not all, in fact relatively few, methods of a microcontroller
require negative values so in situations where negative values are not
required the loss of half of the magnitude of a Byte or Word can be
significant. That is why it is necessary to be able to specify if a
value is Signed or Unsigned, that is if the MSB is the sign bit or part
of the value.

It is obviously important from the above that the user program ds need
to know what sort of data to expect as a value of 0xFF could be
considered to be both 255 and -1 depending on the interpretation of the
variable.    That is why it is important to have Signed and Unsigned
Data Types so that the compiler can decide how to handle or interpret
the contents.   As show above in GCBASIC those types are referred to as
Integer and Word respectively.

<span class="strong">**Summary**</span>

GCBASIC implements support for Bit, Byte, Word, Integer and Long
Variable Types, all of which are described above.

And, that negative numbers are represented as two’s complement.  

</div>
