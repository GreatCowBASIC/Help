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
"PieCounter". Choosing a name for a variable is easy - just don’t
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
put the name of the variable in to the command where the variable is
needed.

Other types of variable can be used in a very similar way, except that
they must be "dimensioned" first. This involves using the DIM command,
to tell GCBASIC that it is dealing with something other than a byte
variable.

A key feature of variables is that it is possible the have the
microcontroller check a variable, and only run a section of code if it
is a given value. This can be done with the IF command.

<span class="strong">**Number Variables**</span>

You can assign values to number variables using &\#160\`=\`.  

A simple, but typical example follows.  This is the typical for numeric
variable assignment.

``` screen
    myByteVarible = 127       'assign the value of 127
```

GCBASIC support bitwise assignments s follows:

``` screen
    portc.0 = !porta.1  'set a single bit to the value of another bit
```

The function `FnLSL` performs the shift operation found in other
languages. Here is an example:

``` screen
    MyVar = FnLSL( 1, BitNum)`  is Equivalent to `MyVar = 1<<BitNum`
```

To set a bit of a port and to prevent glitches during operations, use
`#option volatile` as folllows:

``` screen
    'add this option for a specific port.
    #option volatile portc.0

    'then in your code
    portc.0 = !porta.1
```

To set a bit of a port or variable, encapsulate it in the `SetWith`
method. Using this method also eliminates any glitches during the
update.

``` screen
    SetWith(MyPORT, MyPORT OR FnLSL( 1, BitNum))
```

To clear a bit of a port, use this method:

``` screen
    MyPORT = MyPORT AND NOT FnLSL( 1, BitNum))
```

To set a bit within an array, use this method:

``` screen
    video_buffer_A1(video_adress) = video_buffer_A1(video_adress) OR FnLSL( 1, BitNum)
```

To set a bit within a variable, use this method:

``` screen
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

``` screen
    'Create buffer variables to store received messages

    Dim Buffer As String
```

String variables default to the following rules and the RAM constraints
of a specific chip.

<div class="itemizedlist">

-   10 bytes for chips with less than 16 bytes of RAM.
-   20 bytes for chips with 16 to 367 bytes of RAM.
-   40 bytes for devices with more RAM than 367 bytes.
-   For chips that have less RAM then the required RAM to support the
    user define strings the strings (and therefore the RAM) will be NOT
    be allocated. Please reduce string size.

</div>

You cannot store a string 20 characters long in a chip with 16 bytes of
RAM.

You can change the default string size handled internally by the GCBASIC
compiler by changing the `STRINGSIZE` constant:

``` screen
    'set the default string to 24 bytes
    #define STRINGSIZE 24
```

Defining a length for the string is the best way to limit memory usage.
It is good practice if you need a string of a certain size to set the
length of a strings, since the default length for a string variable
changes depending on the amount of memory in the microcontroller (see
above).

To set the length of a string, see the example below:

``` screen
    'Create buffer variables to store received messages as 16 bytes long
    Dim OutBuffer As String * 16
```

To place quotation marks (" ") in a string of text. For example:

``` screen
    She said, "You deserve a treat!"
```

To place quotation marks (") in a string of text, use two quotation
marks in a row instead of one for each quote mark. The following example
shows two ways of printing `She said, "You deserve a treat!"`. This
technique works for all output methods (HSerPrint, Print, etc.)

``` screen
    HSerPrint "She said, ""You deserve a treat!"" "

    Dim myString As String * 39
    myString = "She said, ""You deserve another treat!"" "
    HSerPrint myString
```

<span class="strong">**Variable Aliases**</span>

Some variables are aliases, which are used to refer to memory locations
used by other variables. These are useful for joining predefined byte
variables together to form a word variable.

Aliases are not like pointers in many languages - they must always refer
to the same variable or variables and cannot be changed.

When setting a register/variable bit ( i.e
my\_variable.my\_bit\_address\_variable ) and using a alias for the
variable then you must ensure the bytes that construct the variable are
consective.

The coding approach should be to DIMension the variable (word, integer,
or long) first, then create the byte aliases:

``` screen
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
to use a mask variable then apply it to the registers:

``` screen
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
before the variable. The following example will cause two byte variables
added together to be treated as a word variable.

``` screen
    Dim MyWord As Word
    MyWord = [word]ByteVar + AnotherByteVar
```

Why do this? Suppose that `ByteVar` is 150, and `AnotherByteVar` is 231.
When added, this will come to 381 - which will overflow, leaving 125 in
the result. However, when the cast is added, GCBASIC will treat
`ByteVar` as if it were a word, and so will use the word addition code.
This will cause the correct result to be calculated.

It is good practice to cast when calculating an average:

``` screen
    MyAverage = ([word]Value1 + Value2) / 2
```

It’s also possible to cast the second value instead of the first:

``` screen
    MyAverage = (Value1 + [word]Value2) / 2
```

The result will be exactly the same.

  
To apply operations to individual bits of variables see,
<a href="set" class="link" title="Set">Set</a>,
<a href="rotate" class="link" title="Rotate">Rotate</a>  
  

To check variables and apply logic based on their value, see
<a href="if" class="link" title="If">If</a>,
<a href="do" class="link" title="Do">Do</a>,
<a href="for" class="link" title="For">For</a>,
<a href="conditions" class="link" title="Conditions">Conditions</a>  

<span class="strong">**For more help, see:**</span>
<a href="dim" class="link" title="Dim">Declaring variables with DIM</a>,
<a href="setting_variables" class="link" title="Setting Variables">Setting Variables</a>

</div>
