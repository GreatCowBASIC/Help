<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="arrays"></span>Arrays

</div>

</div>

</div>

<span class="strong">**About Arrays**</span>

An array is a special type of variable - one which can store several
values at once. It is essentially a list of numbers in which each one
can be addressed individually through the use of an "index".

The numbers can be bytes (the default), longs, integers, or words. The
index is a value in brackets immediately after the name of the array.

All the numbers stored in an array must be of the same type. For
instance, you cannot store bytes and words in the same array.

Arrays are 0-based. The first element is element zero.

Examples of array names are:

<div class="informaltable">

| <span class="strong">**Array/Index**</span> | <span class="strong">**Meaning**</span>                                                             |
|:--------------------------------------------|:----------------------------------------------------------------------------------------------------|
| `Fish(10)`                                  | Definition of an array containing bytes with 10 elements called `Fish`                              |
| `x(5) As Word`                              | Definition of an array containing words with 5 elements called `x`                                  |
| `DataLog(2)`                                | The second element in an array named `DataLog`                                                      |
| `ButtonList(Temp)`                          | An element in the array `ButtonList` that is selected according to the value in the variable `Temp` |

</div>

<span class="strong">**Defining an array**</span>

Use the DIM command to define an array.

``` programlisting
    DIM array_title ( number_of_elements ) [As _type_]
```

The number of elements must be a number or a constant - not a variable.

The compiler allocates RAM for arrays at compile time, and therefore you
cannot use a variable, because during compilation the value of a
variable cannot be determined.

<span class="strong">**Assigning values to an array**</span>

It is possible to set several elements of a byte array with a single
line of code. This short example shows how:

``` programlisting
    Dim TestVar(10)
    TestVar = 1, 2, 3, 4, 5, 6, 7, 8, 9          ' <<< the bulk-assignment syntax for byte arrays
```

<span class="strong">**Key line:**</span>
`TestVar = 1, 2, 3, 4, 5, 6, 7, 8, 9` — fills the byte array `TestVar`
from element 1 onward with the listed values, and sets element 0 to the
count of items in the list (9 here); this shortcut only works for byte
arrays.

When using this method, element 0 of the array TestVar will be set to
the number of items in the list, which in this case is 9. Each element
of the array will then be loaded with the corresponding value in the
list - so in the example, TestVar(1) will be set to 1, TestVar(2) to 2,
and so on. Element 0 is only set to the number of items in the array
when using this bulk-assignment method. For microcontrollers with less
than 2048 bytes of RAM the limit is 250 elements, or the array cannot
exceed the microcontroller’s RAM size. For microcontrollers with more
than 2048 bytes of RAM the limit is 255 elements.

This only works for <span class="strong">**byte**</span> arrays,
however. For arrays of type `integer`, `word`, or `long`, each element
must be set separately:

``` programlisting
    Dim TestVar(5) As Word
    TestVar(1) = 20
    TestVar(2) = 50
    TestVar(3) = 60
    TestVar(4) = 80
    TestVar(5) = 100
```

If each element has the same value, this can be shortened using a loop:

``` programlisting
    Dim TestVar(5) As Word
    For i = 1 to 5
        TestVar(i) = 0
    Next
```

<span class="strong">**Array Length**</span>

Element 0 should not be used to obtain the length of the array. Element
0 is only consistent with respect to the length of the array when the
array is set using the bulk-assignment method shown above.

The correct method is to use a constant to set the array size, and to
use that constant within your code to obtain the array length.

``` programlisting
    #Define ArraySizeConstant 500
    Dim TestVar( ArraySizeConstant )

    SerPrint ArraySizeConstant     'or, other usage
```

<span class="strong">**Using Arrays**</span>

To use an array, its name is specified, then the index. Arrays can be
used everywhere that a normal variable can be used.

<span class="strong">**Maximum Array Size**</span>

The limit on the array size depends on the chip type, the amount of RAM,
and the number of other variables you use in your program.

Use the following simple program to determine the maximum array size.
Set `CHIP` to your device, `MAXSCOPE` to a value which is less than the
total RAM, and the data type of `test_array` to the data type to be
stored in the array.

The data type of `imaxscope` must be set to match the size of the
constant `MAXSCOPE`. If `MAXSCOPE` ⇐ 255, `imaxscope` should be a byte.
If `MAXSCOPE` &gt; 255, `imaxscope` should be a word.

If the array is too large to fit, the compiler will issue an error
message. Reduce MAXSCOPE until the error message is no longer issued.
The largest `MAXSCOPE` value without an error message is the largest
usable array of this type for this chip.

``` programlisting
    #CHIP   12f1571
    #OPTION Explicit

    #DEFINE MAXSCOPE  111
    DIM     imaxscope As Byte
    DIM     test_array( MAXSCOPE ) As Byte


    For imaxscope = 0 to MAXSCOPE
      test_array( imaxscope ) = imaxscope
    Next
```

For the Atmel AVR, LGT 328p, or an 18F, array sizes are limited to
10,000 elements.

If a memory limit is reached, the compiler will issue an error message.

<span class="strong">**Get the most from the available memory**</span>

Array RAM usage is determined by the architecture of the chip type.
Getting the most out of the available memory is determined by the
allocation of the array within the available banks of memory.

An example is an array of 6 or 7 bytes when there is only 24 bytes of
RAM, and the 24 bytes is split across multiple memory banks. Assume in
this example that 18 bytes have been allocated to other variables and
there is 29 bytes total available. An array of 6 bytes will fit into the
free space in one bank, but an array of 7 will not.

GCBASIC currently cannot split an array over banks, so if there are 6
bytes free in one bank and 5 in another, you cannot have an array of 7
bytes. This would be very hard to do efficiently on 12F/16F, as there
would be a series of special function registers in the middle of the
array when using a 12F or 16F. This constraint does not apply on
16F1/18F, as linear addressing makes it easy to span banks, because the
SFRs do not create the problem there (as they do with 12F/16F).

<span class="strong">**Using Tables as an alternative**</span>

If there are many items in the array, it may be better to use a lookup
table to store the items, and then copy some of the data items into a
smaller array as needed.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="dim" class="link" title="Dim">Dim</a> — declaring
    arrays
-   <a href="alloc" class="link" title="Alloc">Alloc</a> — declaring
    memory directly
-   <a href="efficient_implementation_of_lookup_reference_tables_in_gcbasic" class="link" title="Efficient Implementation of Lookup Reference Tables in GCBASIC">Efficient Implementation of Lookup Reference Tables in GCBASIC</a> — an
    alternative to large arrays

</div>

</div>
