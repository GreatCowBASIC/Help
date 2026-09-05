<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="variable_types"></span>Variable Types

</div>

</div>

</div>

<span class="strong">**About Variables and Variable Types**</span>

A variable is an area of memory on the microcontroller that can be used
to store a number or a series of letters. This is useful for many
purposes, such as taking a sensor reading and acting on it, or counting
the number of times the microcontroller has performed a particular task.

Each variable must be given a name, such as "MyVariable" or
"PieCounter". Choosing a name for a variable is easy - just do not
include spaces or any symbols (other than \_), and make sure that the
name is at least 2 characters (letters and/or numbers) long.

<span class="strong">**Variable Types**</span>

There are several different types of variable, and each type can store a
different sort of information. These are the variable types that GCBASIC
can currently use:

<div class="informaltable">

| <span class="strong">**Variable type**</span> | <span class="strong">**Information that this variable can store**</span>     | <span class="strong">**Example uses for this type of variable**</span> |
|:----------------------------------------------|:-----------------------------------------------------------------------------|:-----------------------------------------------------------------------|
| Bit                                           | A bit (0 or 1)                                                               | Flags to track whether or not a piece of code has run                  |
| Byte                                          | A whole number between 0 and 255                                             | General purpose storage of data, such as counters                      |
| Word                                          | A whole number between 0 and 65535                                           | Storage of extra large numbers                                         |
| Integer                                       | A whole number between -32768 and 32767                                      | Anything where a negative number will occur                            |
| Long                                          | A whole number between 0 and 2^32-1 (4.29 billion)                           | Storing very, very big numbers                                         |
| Array                                         | A list of whole numbers, each of which may be a byte, word, integer, or long | Logs of sensor readings                                                |
| String                                        | A series of letters, numbers and symbols.                                    | Messages that are to be shown on a screen                              |

</div>

<span class="strong">**Using Variables**</span>

Byte variables do not need any special commands to set them up - just
put the name of the variable into the command where the variable is
needed. However, it is good practice to "dimension" all byte variables
and to use `#OPTION EXPLICIT`. `#OPTION EXPLICIT` mandates the
"dimensioning" of all variables in the user program. Using
`#OPTION EXPLICIT` will improve the quality of the program.

Other types of variable can be used in a very similar way, except that
they must be "dimensioned" first. This involves using the DIM command,
to tell GCBASIC that it is dealing with something other than a byte
variable.

A key feature of variables is that it is possible to have the
microcontroller check a variable, and only run a section of code if it
is a given value. This can be done with the IF command.

<span class="strong">**Number Variables**</span>

You can assign values to number variables using `=`.

A simple, but typical, example follows. This is typical for numeric
variable assignment.

``` programlisting
    #OPTION EXPLICIT

    dim myByteVarible as Byte
    myByteVarible = 127       'assign the value of 127
```

GCBASIC supports bitwise assignments, as follows:

``` programlisting
    portc.0 = !porta.1  'set a single bit to the value of another bit
```

The function `FnLSL` performs the shift operation found in other
languages. Here is an example:

``` programlisting
    MyVar = FnLSL( 1, BitNum)
```

`MyVar = FnLSL( 1, BitNum)` is equivalent to `MyVar = 1 << BitNum`.

To set a bit of a port and to prevent glitches during operations, use
`#option volatile` as follows:

``` programlisting
    'add this option for a specific port.
    #option volatile portc.0

    'then in your code
    portc.0 = !porta.1
```

To set a bit of a port or variable, encapsulate it in the `SetWith`
method. Using this method also eliminates any glitches during the
update.

``` programlisting
    SetWith(MyPORT, MyPORT OR FnLSL( 1, BitNum))
```

To clear a bit of a port, use this method:

``` programlisting
    MyPORT = MyPORT AND NOT FnLSL( 1, BitNum))
```

To set a bit within an array, use this method:

``` programlisting
    video_buffer_A1(video_adress) = video_buffer_A1(video_adress) OR FnLSL( 1, BitNum)
```

To set a bit within a variable, use this method:

``` programlisting
    Dim my_variable as byte
    Dim my_bit_address_variable as byte

    'example
    my_variable = 0
    my_bit_address_variable = 7

    my_variable.my_bit_address_variable = 1   ' where 1 or 0 or any bit address is valid

    'Sets bit 7 of my_variable therefore 128
```

<span class="strong">**String Variables**</span>

Strings are defined as follows:

``` programlisting
    'Create buffer variables to store received messages

    Dim Buffer As String
```

String variables default to the following rules and the RAM constraints
of a specific chip.

<div class="itemizedlist">

-   10 bytes for chips with less than 16 bytes of RAM.
-   20 bytes for chips with 16 to 367 bytes of RAM.
-   40 bytes for devices with more than 367 bytes of RAM.
-   For chips that have less RAM than is required to support the
    user-defined strings, the strings (and therefore the RAM) will NOT
    be allocated. Please reduce the string size.

</div>

You cannot store a string 20 characters long in a chip with 16 bytes of
RAM.

You can change the default string size handled internally by the GCBASIC
compiler by changing the `STRINGSIZE` constant:

``` programlisting
    'set the default string to 24 bytes
    #define STRINGSIZE 24
```

Defining a length for the string is the best way to limit memory usage.
If you need a string of a certain size, it is good practice to set the
length of the string, since the default length for a string variable
changes depending on the amount of memory in the microcontroller (see
above).

To set the length of a string, see the example below:

``` programlisting
    'Create buffer variables to store received messages as 16 bytes long
    Dim OutBuffer As String * 16
```

To place quotation marks (" ") in a string of text. For example:

``` programlisting
    She said, "You deserve a treat!"
```

To place quotation marks (") in a string of text, use two quotation
marks in a row instead of one for each quote mark. The following example
shows two ways of printing `She said, "You deserve a treat!"`. This
technique works for all output methods (HSerPrint, Print, etc.)

``` programlisting
    HSerPrint "She said, ""You deserve a treat!"" "

    Dim myString As String * 39
    myString = "She said, ""You deserve another treat!"" "
    HSerPrint myString          ' <<< printing a string containing embedded quote marks
```

<span class="strong">**Key line:**</span> `HSerPrint myString` — prints
`myString`, which was built with doubled quotation marks (`""`) standing
in for each literal quote character; GCBASIC collapses each `""` pair
back to a single `"` when the string is compiled, so the printed output
reads with normal single quote marks.

<span class="strong">**Variable Aliases**</span>

Some variables are aliases, which are used to refer to memory locations
used by other variables. These are useful for joining predefined byte
variables together to form a word variable.

Aliases are not like pointers in many languages - they must always refer
to the same variable or variables, and cannot be changed.

When setting a register/variable bit (i.e.
`my_variable.my_bit_address_variable`) and using an alias for the
variable, then you must ensure the bytes that construct the variable are
consecutive.

The coding approach should be to DIMension the variable (word, integer,
or long) first, then create the byte aliases:

``` programlisting
    Dim my_variable as LONG
    Dim ByteOne   as Byte alias my_variable_E
    Dim ByteTwo   as Byte alias my_variable_U
    Dim ByteThree as Byte alias my_variable_H
    Dim ByteFour  as Byte alias my_variable

    Dim my_bit_address_variable as Byte
    my_bit_address_variable = 23

    'set the bit in the variable
    my_variable.my_bit_address_variable = 1

    'then, use the four byte variables as you need to.
```

To set a series of registers that are not consecutive, it is recommended
to use a mask variable and then apply it to the registers:

``` programlisting
    Dim my_variable as LONG
    Dim my_bit_address_variable as Byte
    my_bit_address_variable = 23

    'set the bit in the variable
    my_variable.my_bit_address_variable = 1

    porta =  my_variable_E
    portb =  my_variable_E
    portc =  my_variable_E
    portd =  my_variable_E
```

<span class="strong">**Casting**</span>

Casting changes the type of a variable or value. To tell the compiler to
perform a type conversion, put the desired type in square brackets
before the variable. The following example causes two byte variables
added together to be treated as a word variable.

``` programlisting
    Dim MyWord As Word
    MyWord = [word]ByteVar + AnotherByteVar          ' <<< the [word] cast preventing an 8-bit overflow
```

<span class="strong">**Key line:**</span>
`MyWord = [word]ByteVar + AnotherByteVar` — forces GCBASIC to add
`ByteVar` and `AnotherByteVar` using word-width arithmetic; without the
cast, the addition would be done as a byte operation and silently
overflow whenever the true sum exceeds 255.

Why do this? Suppose that `ByteVar` is 150, and `AnotherByteVar` is 231.
When added, this will come to 381 - which will overflow, leaving 125 in
the result. However, when the cast is added, GCBASIC will treat
`ByteVar` as if it were a word, and so will use the word addition code.
This will cause the correct result to be calculated.

It is good practice to cast when calculating an average:

``` programlisting
    MyAverage = ([word]Value1 + Value2) / 2
```

It is also possible to cast the second value instead of the first:

``` programlisting
    MyAverage = (Value1 + [word]Value2) / 2
```

The result will be exactly the same.

  

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="set" class="link" title="Set">Set</a> — applying
    operations to individual bits of variables
-   <a href="rotate" class="link" title="Rotate">Rotate</a> — rotating
    bits within a variable
-   <a href="if" class="link" title="If">If</a> — checking
    variables and applying logic based on their value
-   <a href="do" class="link" title="Do">Do</a> — looping while a
    variable-based condition holds
-   <a href="for" class="link" title="For">For</a> — looping a
    counted number of times
-   <a href="conditions" class="link" title="Conditions">Conditions</a> — the
    comparison operators used in If and Do
-   <a href="dim" class="link" title="Dim">Dim</a> — declaring
    variables
-   <a href="setting_variables" class="link" title="Setting Variables">Setting Variables</a> — more
    on assigning values to variables

</div>

</div>
