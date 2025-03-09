<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="dim"></span>Dim

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    For Variables > 1 byte:
    Dim variable[, variable2 [, variable3]] [As type] [Alias othervar [, othervar2]]

    'or

    Dim variable[, variable2 [, variable3]] [As type] [At location]


    For Arrays:
    Dim array(size) [As type] [At location]

    For String:
    Dim string [* _size] [At location]
```

<span class="strong">**Explanation:**</span>

Dim has two uses:  It can be used to define 1) variables of many types
and 2) arrays.

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

The `Dim` variable command is used to instruct GCBASIC to allocate
variables or to create alternate names for existing variables (using
Alias) or to create variables at a specific memory location (using At).

The `Dim array` command also sets up array variables. The maximum array
size is determined by the parameter `size` is dynamically allocated by
the compiler and depends on the specific chip used, as well as the
complexity of the program.

The limit on array size varies dependent on the chip type. See the <span
class="strong">**Maximum Array Size**</span> section in
<a href="" class="link">Arrays</a> for more information.

`type` specifies the type of variable that is to be created. Different
variable types can hold values over different ranges, and use different
amounts of RAM. See the
<a href="variable_types" class="link" title="Variable Types">Variables Types</a>
article for more information.

When multiple variables are included on the one line, GCBASIC will set
them all to the type that is specified at the end of the line. If there
is no type specified, then GCBASIC will make the variable a byte.

`Alias` creates a variable using the same memory location as one or more
other variables.   It is mainly used internally in GCBASIC to treat
system variables as a word.   For example, this command is used to
create a word variable, made up from the two memory locations used to
store the result of an A/D conversion.  \`Alias\` is mutually exclusive
to `At` and therefore `Alias` and `At` on the same declaration line will
cause an compiler error.

`Alias` does not support `BIT` variable.   For the correct method to
address \`BIT\`s in a psuedo alias method see the example program \#2
below.

`AT` a variable can be placed at a specific location in the data memory
of the chip using the At option.   \`<span
class="emphasis">*location*</span>\` will be used whether it is a valid
location or not, but a warning will be generated if GCBASIC has already
allocated the memory, or if the memory does not appear to be valid.
  This can be used for peripherals that have multi byte buffers in
RAM.  \`At\` is mutually exclusive to `Alias` and therefore `At` and
`Alias` on the same declaration line will cause an compiler error.

A String declared with a fixed size (numeric constant that can be
evaluated at compile time) is a fixed length string. It has no
descriptor and it is not resized to fit its contents. If data overflows
the size of the string, the memory may be overwrtten. Fixed length
strings are not NULL terminated, and they use size + 1 bytes of space.
String variable names need not end in a dollar sign $ as in other
dialects of BASIC.

``` screen
    Dim ADResult As Word Alias ADRESH, ADRESL
```

<span class="strong">**Example 1:**</span>

``` screen
    'This program will set up a array of ten bytes and a word variable

    dim DataList(10)
    dim Reading as word

    Reading = 21978
    DataList(1) = 15

    dim stringvariable as string
```

<span class="strong">**Example 2:**</span>

Use a constant, or a number of constants, to refer to specific
`` BIT`s of an exist `BYTE `` variable.  A psuedo `ALIAS` for `BIT`
variables.

``` screen
    // Thank you Ccin E Crout from the GCBASIC forum!!

    #Option Explicit
    #Chip 16F1825, 32

    Dim SerialByte As Byte
    #Define StatusReady  SerialByte.0
    #Define StatusError  SerialByte.1
    #Define StatusMotor  SerialByte.2
    #Define StatusOkBut  SerialByte.3
    #Define StatusUpBut  SerialByte.4
    #Define StatusDnBut  SerialByte.5
    #Define StatusLeBut  SerialByte.6
    #Define StatusRiBut  SerialByte.7

    SerialByte = 0                 // This will address the specific byte

    Do
        SerialByte = SerialByte + 1
        If StatusReady = 1 Then     // This will address the specific bit
            StatusError = 0         // This will address the specific bit
        End If
        If StatusError = 1 Then     // This will address the specific bit
            StatusMotor = 0         // This will address the specific bit
        End If
        If StatusMotor = 1 Then     // This will address the specific bit
            StatusOkBut = 0         // This will address the specific bit
        End If
        If StatusOkBut = 1 Then     // This will address the specific bit
            StatusUpBut = 0         // This will address the specific bit
        End If
        If StatusUpBut = 1 Then     // This will address the specific bit
            StatusDnBut = 0         // This will address the specific bit
        End If
        If StatusDnBut = 1 Then     // This will address the specific bit
            StatusLeBut = 0         // This will address the specific bit
        End If
        If StatusLeBut = 1 Then     // This will address the specific bit
            StatusReady = 0         // This will address the specific bit
        End If
    Loop
```

<span class="strong">**For more help,
see:  **</span><a href="serprint" class="link" title="SerPrint">SerPrint</a>
articles as these articales show how to use Dim to create string
variables and
<a href="variables" class="link" title="Variables">Variables</a>
for more details in creating and managing strings lengths.

</div>
