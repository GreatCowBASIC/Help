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
to store a number or other data. This is useful for many purposes, such
as taking a sensor reading and acting on it, or counting the number of
times the microcontroller has performed a particular task.

Each variable must be given a name, such as "MyVariable" or
"PieCounter". Choosing a name for a variable is easy - do not include
spaces or any symbols (other than \_), and make sure that the name is at
least 2 characters (letters and/or numbers) long.

<span class="strong">**Advanced Types**</span>

There are a number of different advanced variable types, and each type
can store a different range of numeric information.

With respect to advanced variables, GCBASIC supports:

<div class="itemizedlist">

-   single floats, which can be signed and unsigned.

</div>

With respect to using advanced variables, please use Singles in your
program, as these have been tested. The other types are documented for
completeness and should be used by developers writing libraries.

<div class="itemizedlist">

-   double floats, and large integers, which can be signed or unsigned

</div>

Using advanced variable type maths is also much slower than integer
maths when performing calculations and loops, and should therefore be
avoided where possible. You should convert float calculations to integer
maths to increase the performance of your solution. The example program
(shown below) shows how to use float maths, and you should try to do the
same with integers and time the overall duration for comparison.
Typically, floats are 18%-20% slower than similar integer maths
operations.  
  
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
<td style="text-align: left;"><p>A numeric floating-point value that ranges from -3.4x10^38 to +3.4x10^38, with up to seven significant digits.</p></td>
<td style="text-align: left;"><p>Storing decimal numbers that could be negative or positive.</p></td>
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
<td style="text-align: left;"><p>LongInt</p></td>
<td style="text-align: left;"><p>Libraries only</p></td>
<td style="text-align: left;"><p>A whole number between -(2^63) and 2^63 - 1</p></td>
<td style="text-align: left;"><p>Storing very, very big integer numbers that could be negative.</p>
<p>The GCBASIC range is -9999999999999990 to 9999999999999990.</p>
<p>This range is an implementation constraint of the GCBASIC compiler.</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>uLongINT</p></td>
<td style="text-align: left;"><p>Libraries only</p></td>
<td style="text-align: left;"><p>A whole number between 0 and 2^64 - 1</p></td>
<td style="text-align: left;"><p>Storing very, very, very big integer numbers</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>Double</p></td>
<td style="text-align: left;"><p>Libraries only</p></td>
<td style="text-align: left;"><p>A numeric floating-point value that ranges from -1.7x10^308 to +1.7x10^308, with up to 15 significant digits.</p></td>
<td style="text-align: left;"><p>Storing decimal numbers that could be negative or positive.</p></td>
</tr>
</tbody>
</table>

</div>

  
The format for single and double floats is defined by the IEEE 754
standard. The sign, exponent, and mantissa are all in the positions
described here:
[GeeksforGeeks](https://www.geeksforgeeks.org/ieee-standard-754-floating-point-numbers/)

<span class="strong">**Organisation of advanced variables**</span>

GCBASIC stores advanced variables in bytes. The suffix naming, from the
highest byte to the lowest, is:

``` literallayout
_D, _C, _B, _A, _E, _U, _H, variable_name  (high to low)
```

An 8-byte type (Double, LongInt, uLongInt) uses all eight of these
names. A 4-byte `Single` only needs the lowest four - `_E`, `_U`, `_H`,
and the plain variable name - the same convention used by a 4-byte
`Long` (see
<a href="variables_and_data_types" class="link" title="Variables and Data Types">Variables and Data Types</a>
for the Long byte-suffix convention). `_A`, `_B`, `_C`, and `_D` only
exist on the wider 8-byte types.

Example of accessing the lowest byte, and the `_H`, `_U`, and `_E` bytes
of a Single.

``` programlisting
    Dim workvariable as Single
    workvariable = 21845
    Dim lowb as byte
    Dim highb as byte
    Dim upperb as byte
    Dim lastb as byte


    lowb = workvariable
    highb = workvariable_H
    upperb = workvariable_U
    lastb = workvariable_E          ' <<< the top byte of a 4-byte Single uses the _E suffix, not _A
```

<span class="strong">**Key line:**</span>
`lastb = workvariable_E` — reads the most significant byte of the 4-byte
`Single` `workvariable`; because a `Single` is the same width as a
`Long`, its top byte uses the `_E` suffix, matching Long’s
`_E`/`_U`/`_H`/plain convention — `_A` only applies to 8-byte advanced
types (Double, LongInt, uLongInt).

<span class="strong">**Using the Byte components of Advanced
Variables**</span>

This is strict. Accessing BYTE values of advanced variables requires the
use of a cast. Failure to use a cast will cause an issue with the low
byte (the low byte will be transformed into a Long integer, and you will
receive the low byte of that Long integer instead).

Example. Mandated use of cast for single/float

``` programlisting
    Dim sNumC as Single

    HserPrint "Hex with [CAST] / "
    HSerPrint "0x"
    HserPrint Hex([BYTE]sNumC_E)
    HserPrint Hex([BYTE]sNumC_U)
    HserPrint Hex([BYTE]sNumC_H)
    HserPrint Hex([BYTE]sNumC)
    HserPrintCRLF
```

Example assigning a HEX value to a single/float

``` programlisting
  //  Assign 0x3F19999A which equates to 0.6

    [BYTE]mySingle  = 0x9A      // Strict usage of BYTE cast to ensure the correct value is assigned to the low byte of the single variable.
    mySingle_H= 0x99            // Assign _H byte
    mySingle_U= 0x19            // Assign _U byte
    mySingle_E= 0x3f            // Assign _E byte
```

Working example of assigning 0.5 or 0x3F000000 (which is the IEEE754 hex
value for 0.5)

``` programlisting
    // Decimal assignment
      mySingle = 0.5

    // Hex assignment
        [BYTE]mySingle  = [single]0x00
        mySingle_H      = 0x00
        mySingle_U      = 0x00
        mySingle_E      = 0x3f
```

  
  
<span class="strong">**Using Advanced Variables**</span>

Advanced variables must be "DIMensioned" first. This involves using the
DIM command, to tell GCBASIC that it is dealing with an advanced
variable.

``` programlisting
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

  
  

<span class="strong">**Supported Operations on Advanced
Variables**</span>

Advanced variables are only supported by a subset of the functions of
GCBASIC.

The functional characteristics are:

<div class="itemizedlist">

-   Dimensioning of LongInt, uLongInt, Single, and Double advanced
    variable types.
-   Assigning advanced variables, and the creation of values from
    constants.
-   Assigning a Single to a Double and a Double to a Single.
-   Assigning a Single to a Long and a Long to a Single.
-   Assigning a Double to a Long and a Long to a Double.
-   The assignment of a Single or a Double to a Long also works with
    Byte and Word. This is very inefficient.
-   Copying between variables of the same type (so Double to Double,
    Single to Single, and other advanced variables).
-   Extracting the integer part of a Single or Double variable to a Long
    variable.
-   Setting of advanced variable bits.
-   Addition and subtraction of advanced variables.
-   Rotate of LongInt and uLongInt advanced variables.
-   Negate of LongInt and uLongInt advanced variables.
-   Boolean operators working on advanced variables.
-   Use of float variable(s) as global variables. Passing float
    variable(s) as parameters to methods (sub, function, and macro) is
    supported (see below).
-   Support for conditional statements.
-   Support for overloaded subs/functions.
-   Passing float variable(s) as parameters to methods (sub, function,
    and macro).
-   Extraction of the mantissa value.
-   Multiplication.
-   Division.
-   Modulo.
-   SingleToString.
-   StringToSingle.
-   Advanced variable(s) to string functions.
-   Maths functions for float variable(s) (plus the pseudo-functions
    shown below).

</div>

  
  

<span class="strong">**Assigning Values to Advanced Variables**</span>

You can assign values to advanced variables using `=`.

A simple, but typical, example follows. This is typical for numeric
variable assignment.

``` programlisting
    Dim mySingle as Single
    mySingle = 123.4567       'assign the value
```

Another example is bitwise assignment, as follows:

``` programlisting
    mySingle.16 = 1  'set the single bit to 1
```

\+  

<span class="strong">**INT() and RoundSingle()**</span>

Floating point numbers are not exact, and may yield unexpected results
when compared using conditions (IF, etc.). For example, 6.0 / 3.0 may
not equal 2.0. Users should instead check that the absolute value of the
difference between the numbers is less than some small number.  

These techniques can replace the INT() and
<a href="roundsingle" class="link" title="RoundSingle">RoundSingle()</a>
functions.  
  

<span class="emphasis">*Alternative to INT()*</span>

Assignment of a Single variable to an Integer variable is supported.

So, use the conversion from floating point to integer, as this results
in integer truncation.

``` programlisting
        dim mySingleVar as Single
        mySingleVar = 2.9  'A float type variable

        dim myLongVar as Long
        myLongVar = mySingleVar ' will set myLongVar to 2
```

  
  

<span class="emphasis">*Alternative to RoundSingle()*</span>

As an alternative to using the
<a href="roundsingle" class="link" title="RoundSingle">RoundSingle()</a>
function,

create your own rounding conversion by adding 0.5 before assigning to an
integer, to return the nearest integer, as follows:

``` programlisting
        'Add 0.5 to a single or double and then assign to an integer variable

        dim mySingleVar as Single
        mySingleVar = 2.9

        dim myLongVar as Long
        myLongVar= mySingleVar + [single]0.5
```

  
  

<span class="strong">**Example Program**</span>

This program shows the result of calculating 4.5 multiplied by a range
of numbers (4.5 x a range of 0 to 40,000). The program shows setting up
the advanced variables, assigning a value, and completing the
multiplication of the initial value using a For-Next loop.

``` programlisting
    HSerPrintCRLF 2
    HSerPrint "Maths test "
    HSerPrintCRLF 2

    DIM multiplier as Word
    DIM ccount as Single
    Dim result as Single

    HSerPrint "Use floats with multiplier maths"
    HSerPrintCRLF

    'Assign a value to the variable
    ccount   = 4.5

      'Do some maths... multiplier x ccount
      For  multiplier = 0 to 40000 step 2500

        HSerPrint SingleToString(ccount)
        HSerPrint " x "
        HSerPrint left(WordToString(multiplier)+"        ", 10 )
        HSerPrint " = "

        'Calculate the result
        result = multiplier * ccount          ' <<< the multiplication of a Word by a Single
        HSerPrint left(SingleToString(result)+"          ", 10 )
        HSerPrintCRLF
      next

      Do Forever
      Loop
```

<span class="strong">**Key line:**</span>
`result = multiplier * ccount` — multiplies the Word loop counter
`multiplier` by the Single constant `ccount` (4.5); GCBASIC promotes the
Word operand to Single for this calculation, which is why the result
must also be stored in a Single variable rather than a Long or Word.

To check variables and apply logic based on their value, see
<a href="if" class="link" title="If">If</a>,
<a href="do" class="link" title="Do">Do</a>,
<a href="for" class="link" title="For">For</a>,
<a href="conditions" class="link" title="Conditions">Conditions</a>  

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="dim" class="link" title="Dim">Dim</a> — declaring
    variables, including advanced types
-   <a href="setting_variables" class="link" title="Setting Variables">Setting Variables</a> — more
    on assigning values to variables
-   <a href="roundsingle" class="link" title="RoundSingle">RoundSingle</a> — the
    real function this page’s manual alternatives replace
-   <a href="variables_and_data_types" class="link" title="Variables and Data Types">Variables and Data Types</a> — the
    corresponding byte-suffix convention for Byte/Word/Integer/Long
-   <a href="the_positives_and_negatives_of_variable_types" class="link" title="The Positives and Negatives of Variable Types">The Positives and Negatives of Variable Types</a> — why
    the integer types are signed or unsigned, and how Single differs by
    being fractional rather than signed

</div>

</div>
