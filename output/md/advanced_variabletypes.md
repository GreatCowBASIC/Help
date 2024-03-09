<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="advanced_variabletypes"></span>Advanced VariableTypes

</div>

</div>

</div>

<span class="strong">**About Advanced Variable Types**</span>

A variable is an area of memory on the microcontroller that can be used
to store a number or other data.   This is useful for many purposes,
such as taking a sensor reading and acting on it, or counting the number
of times the microcontroller has performed a particular task.

Each variable must be given a name, such as "MyVariable" or
"PieCounter".   Choosing a name for a variable is easy - do not include
spaces or any symbols (other than \_), and make sure that the name is at
least 2 characters (letters and/or numbers) long.

<span class="strong">**Advanced Types**</span>

There are a number different types of advanced variable types, and each
type can store a different range of numeric information.  

With respect to advanced variables GCBASIC supports:

<div class="itemizedlist">

-   single floats which can be signed and unsigned.

</div>

With respect to used advanced variables - please use Singles in your
program as these have been tested. The other types are documented for
completeness and should be used by developers in libraries.

<div class="itemizedlist">

-   double floats, and the large integers which can be signed & unsigned

</div>

Using advanced variable type maths is also much slower than integer
maths when performing calculations and loops, therefore should be
avoided if.   You should convert float calculations to integer maths to
increase operation of your solution.   The example program (shown below)
shows how use a float maths and you shuld try to do the same with
integers and time the overall time for comparison.  Typically, floats
are 18%-20% slower than similar integer maths operations.  
  
The advanced variable types that GCBASIC supports are:

<div class="informaltable">

<table data-border="1" width="80%">
<thead>
<tr class="header">
<th style="text-align: left;"><span class="strong"><strong>Advanced Variable type</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Supported</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Information that this variable can store</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Example uses for this type of variable</strong></span></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><p>Single</p></td>
<td style="text-align: left;"><p>Yes</p></td>
<td style="text-align: left;"><p>A numeric floating point values that range from -3.4x10 ^ 38 and +3.4x10 ^ 38 with up to seven significant digits.</p></td>
<td style="text-align: left;"><p>Storing decimal numbers that could be a negative number and positive.</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"> </td>
<td style="text-align: left;"> </td>
<td style="text-align: left;"> </td>
<td style="text-align: left;"> </td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><span class="strong"><strong>Developers Only</strong></span></p></td>
<td style="text-align: left;"><p><span class="strong"><strong>Developers Only</strong></span></p></td>
<td style="text-align: left;"><p><span class="strong"><strong>Developers Only</strong></span></p></td>
<td style="text-align: left;"><p><span class="strong"><strong>Developers Only</strong></span></p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>LongINT</p></td>
<td style="text-align: left;"><p>Libraries only</p></td>
<td style="text-align: left;"><p>A list of whole numbers between - (2 ^ 63) and 2 ^ 63 - 1</p></td>
<td style="text-align: left;"><p>Storing very, very big integer numbers that could be a negative number.</p>
<p>The GCBASIC range is -9999999999999990 to 9999999999999990.</p>
<p>This range is an implementation constraint with the GCBASIC compiler.</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>uLongINT</p></td>
<td style="text-align: left;"><p>Libraries only</p></td>
<td style="text-align: left;"><p>A whole number between 0 and 2 ^ 64 - 1</p></td>
<td style="text-align: left;"><p>Storing very, very, very big integer numbers</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>Double</p></td>
<td style="text-align: left;"><p>Libraries only</p></td>
<td style="text-align: left;"><p>A numeric floating point values that range from -1.7x10 ^ 308 and +1.7x10 ^ 308 with up to 15 significant digits.</p></td>
<td style="text-align: left;"><p>Storing decimal numbers that could be a negative number and positive.</p></td>
</tr>
</tbody>
</table>

</div>

  
The format for single and double floats is defined by the IEEE 754
standard.   Sign, exponent and mantissa are all in the positions
described here:
<https://www.geeksforgeeks.org/ieee-standard-754-floating-point-numbers/>

<span class="strong">**Organisation of advanced variables**</span>

GCBASIC stores advanced variables in bytes.   The format of these bytes
is:

``` literallayout
_ D, _C, _B, _A, _E, _U, _H, variable_name  ( from high to Low)
```

You can access the bytes within advanced variables using the following
as a guide using the suffixes \_A, \_B, \_C etc.

Example of accessing the lowest byte, the \_H, \_U and the \_A bytes.

``` screen
    Dim workvariable as Single
    workvariable = 21845
    Dim lowb as byte
    Dim highb as byte
    Dim upperb as byte
    Dim lastb as byte


    lowb = workvariable
    highb = workvariable_H
    upperb = workvariable_U
    lastb = workvariable_A
```

<span class="strong">**Using the Byte components of Advanced
Variables**</span>

This is strict. Accessing BYTE values of advanced variables requires the
use cast. Failure to use cast will cause issue with the low byte ( the
low byte will tranformed into a Long integer and you will provide the
low byte of the Long integer).

Example. Mandated use of cast for floats

``` screen
    Dim sNumC as Single

    HserPrint "Hex with [CAST] / "
    HSerPrint "0x"
    HserPrint Hex([BYTE]sNumC_E)
    HserPrint Hex([BYTE]sNumC_U)
    HserPrint Hex([BYTE]sNumC_H)
    HserPrint Hex([BYTE]sNumC)
    HserPrintCRLF
```

  
  
<span class="strong">**Using Advanced Variables**</span>

Advanced variables must be "DIMensioned" first.  This involves using the
DIM command, to tell GCBASIC that it is dealing with an advanced
variable.

``` screen
    Dim mySingle as Single
    mySingle= 1.1

    // The following types are for Libraries only

    Dim myLongInt as LongInt
    myLongInt = 9999999999999990          'see the Help for constraints

    Dim myuLongInt as uLongInt
    myuLongInt = 0xFFFFFFFFFFFFF          'see the Help for constraints

    Dim myDouble as Double
    myDouble=3.141592
```

  
  

<span class="strong">**Using Advanced Variables**</span>

Advanced variables are only supported by a subset of the functions of
GCBASIC.  

The functional characteristics are:

<div class="itemizedlist">

-   Dimensioning of longInt, ulongInt, single and double advanced
    variable types.
-   Assigning advanced variables creation of values from constants.
-   Assigning a single to double and double to single.
-   Assigning single to long and long to single.
-   Assigning double to long and long to double.
-   The assignment of a single or a double to a long also deals with
    byte and word.   This is very inefficient.
-   Copying between variables of the same type (so double to double, and
    single to single and other advanced variables).
-   Extract of the unit value of a single or double variable to a long
    variable.
-   Setting of advanced variable bits.
-   Addition and subtraction of advanced variables.
-   Rotate of longInt & ulongInt advanced variables.
-   Negate of longInt & ulongInt advanced variables.
-   Boolean operators working on advanced variables.
-   Use of float variable(s) as global variables.   Passing float
    variable(s) as parameters to methods ( sub, function and macro) not
    supported.
-   Support for conditional statements
-   Support for overload subs/functions
-   Passing float variable(s) as parameters to methods ( sub, function
    and macro)
-   Extraction of mantissa value
-   Multiplication
-   Division
-   Modulo
-   SingleToString
-   StringToSingle
-   Advanced variable(s) to string functions
-   Math functions for float variable(s) ( plus pseudo functions shown
    below)

</div>

  
  

<span class="strong">**Assigning Values to Advanced Variables**</span>

You can assign values to advanced variables using  \`=\`.  

A simple, but typical example follows.  This is the typical for numeric
variable assignment.

``` screen
    Dim mySingle as Single
    mySingle = 123.4567       'assign the value
```

Another example is bitwise assignments as follows:

``` screen
    mySingle.16 = 1  'set the single bit to 1
```

\+  

<span class="strong">**INT() and SINGLRROUND()**</span>

Floating point numbers are not exact, and may yield unexpected results
when compared using conditions (IF etc).   For example 6.0 / 3.0 may not
equal 2.0.   Users should instead check that the absolute value of the
difference between the numbers is less than some small number.  

These techniques can replace the INT() and SINGLEROUND() functions.  
  

<span class="emphasis">*Alternative to INT()*</span>

Assignment of a Single variable to an Interger variable is supported.  

So, use the conversion from floating point to integer as this results in
integer truncation.

``` screen
        dim mySingleVar as Single
        mySingleVar = 2.9  'A float type variable

        dim myLongVar as Long
        myLongVar = mySingleVar ' will set myLongVar to 2
```

  
  

<span class="emphasis">*Alterntive tp ROUNDSSINGLE()*</span>

As an alternative to using the ROUNDSSINGLE() function.  

Create your own round conversion, add 0.5 to return the nearest
integer.  As follows:

``` screen
        'Add 0.5 to a single or double and then assign to an integer variable

        dim mySingleVar as Single
        mySingleVar = 2.9

        dim myLongVar as Long
        myLongVar= mySingleVar + [single]0.5
```

  
  

<span class="strong">**Example Program**</span>

This program shows the values of calculation of 4.5 \* multiplied by a
number ( 4.5 x a range of 0 to 40,000).   The program shows setting up
the advanced variables, assigned a value and completing the
multiplication of the initial value using a for-next loop.  

``` screen
    HSerPrintCRLF 2
    HSerPrint "Maths test "
    HSerPrintCRLF 2

    DIM multiplier as Word
    DIM ccount as Single
    Dim result as Single

    HSerPrint "Use floats with multiplier maths"
    HSerPrintCRLF

    'Assign a value to a double variable
    ccount   = 4.5

      For  multiplier = 0 to 40000 step 2500
        'Do some maths... multiplier x ccount

        HSerPrint "4.5"
        HSerPrint " x "
        HSerPrint left(WordToString(multiplier)+"        ", 10 )
        HSerPrint " = "

        'Convert Single to Long to get the result
        result = multiplier * ccount
        HSerPrint left(SingleToString(result)+"          ", 10 )
        HSerPrintCRLF
      next

      Do Forever
      Loop
```

To check variables and apply logic based on their value, see
<a href="if" class="link" title="If">If</a>,
<a href="do" class="link" title="Do">Do</a>,
<a href="for" class="link" title="For">For</a>,
<a href="conditions" class="link" title="Conditions">Conditions</a>  

<span class="strong">**For more help, see:**</span>
<a href="dim" class="link" title="Dim">Declaring variables with DIM</a>,
<a href="setting_variables" class="link" title="Setting Variables">Setting Variables</a>

</div>
