<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="setting_variables"></span>Setting Variables

</div>

</div>

</div>

  
<span class="strong">**Syntax:**</span>

``` screen
    Variable = data
```

  
<span class="strong">**Explanation:**</span>  
`Variable` will be set to `data`.  
`data` can be either a fixed value (such as 157), another variable, or a
sum.  
All unknown byte variables are assigned Zero. A variable with the name
of <span class="strong">**Forever**</span> is not defined by GCBASIC and
therefore defaults to the value of zero.  
If `data` is a fixed value, it must be an integer between 0 and 255
inclusive.  
If `data` is a calculation, then it may have any of the following
operands:

  

``` screen
    + (add)
    - (subtract, or negate if there is no value before it)
    * (multiply)
    / (divide)
    % (modulo)
    & (and)
    | (or)
    # (xor)
    ! (not)
    = (equal)
    <> (not equal)
    < (less than)
    > (greater than)
    <= (less than or equal)
    >= (more than or equal)
```

  
The final six operands are for checking conditions. They will return
FALSE (0) if the condition is false, or TRUE (255) if the condition is
true.  
The `And`, `Or`, `Xor` and `Not` operators function both as bitwise and
logical operators.  
GCBASIC understands order of operations. If multiple operands are
present, they will be processed in this order:  

``` screen
    Brackets
    Unary operations (not and negate)
    Multiply/Divide/Modulo
    Add/Subtract
    Conditional operators
    And/Or/Xor
```

  
There are several modes in which variables can be set. GCBASIC will
automatically use a different mode for each calculation, depending on
the type of variable being set. If a byte variable is being set, byte
mode will be used; if a word variable is being set, word mode will be
used. If a byte is being set but the calculation involves numbers larger
than 255, word mode can be used by adding \[WORD\] to the start of one
of the values in the calculation. This is known as casting - refer to
the Variables article for more information.  
  

<span class="strong">**And with other operations**</span>

The order of operations, comparison operations have a higher precedence
than boolean operations.  GCBASIC behaves the same way as most other
languages.  Source code like this (randomly taken from glcd\_ili9326.h)
works.

``` screen
if GLCDfntDefaultSize = 2 and CurrCharRow = 7 then
```

It is an easy mistake to compare values and get the precendent
incorrect.  Generally, if you can use an individual bit check, that is
generally the best way to go. These are a lot simpler for the compiler
to deal with and result in much nicer assembly.

This works using the correct order of precendence.

``` screen
    if (H_Byte & 0x10) = 0x10 Then ...

    'or, using the individual bit check to do the same
    if H_Byte.4 Then
```

This will fail as the order of precendence as shown below.

``` screen
    if H_Byte & 0x10 = 0x10 Then ...

    'the code above equates. This is not achieve the testing of the H_byte.4
    if H_Byte & ( 0x10 = 0x10 ) Then ...
```

<span class="strong">**Divide or division**</span>

GCBASIC support division.

When using division you will get accurate results, within the
limitations of integer numbers, by completing any multiplication first
and the division last.   But, you may have issues with variables
overflowing - ensure your variable type are correct for the calculation
type.

If you that calculation a division, the compiler will use the long
division routine, if the value may overflow, and then fit the result
into a word.   This code provides the correct result, again within the
limitations of integer numbers:

``` screen
    dim L1s as word
    dim L1p as word
    L1s = 6547200 / L1p
```

Division also sets the global system variable SysCalcTempX to the
remainder of the division.  However the following simple rules apply.  

<div class="itemizedlist">

-   If both of the parameters of the division are constants, the
    compiler will do the calculation itself and use the result rather
    than making the microcontroller work out the same thing every time.
    So, if there are two constants used, the microcontroller division
    routine does not get used, and SysCalcTempX does not get set.
-   If either of the parameters of the division are variables, the
    compiler will ensure the microcontroller does the calculation as the
    result could be different every time. So, in the this case the
    microcontroller division routine does get used, and SysCalcTempX is
    set.  

</div>

If you prefer, you can add `Let` to the start of the line.   It will not
alter the execution of the program, but is included for those who are
used to including it in other BASIC dialects.  
  

<span class="strong">**Example:**</span>

``` screen
    'This program is to illustrate the setting of variables.
    Chipmunk = 46        'Sets the variable Chipmunk to 46
    Animal = Chipmunk    'Sets the variable Animal to the value of the variable Chipmunk
    Bear = 2 + 3 * 5     'Sets the variable Bear to the result of 2 + 3 * 5, 17.
    Sheep = (2 + 3) * 5  'Sets the variable Sheep to the result of (2 + 3) * 5, 25.
    Animal = 2 * Bear    'Sets the variable Animal to twice the value of Bear.

    LargeVar = 321       'LargeVar must be set as a word - see DIM.
    Temp = LargeVar / [WORD]5 'Note the use of [WORD] to ensure that the calculation is performed correctly
```

  
  
<span class="strong">**Setting Explicit Bits of a
Variable/Register:**</span>  
  
GCBASIC supports the method setting a specific bit of a variable or
register. Use the following method:  

``` screen
    'variable.bit method
    myByteVariable.0 = 1   'will set bit 0 to 1
    myByteVariable.1 = 0   'will set bit 1 to 0
    myByteVariable.2 = 1   'will set bit 2 to 1
```

  

To set more than one bit in one command GCBASIC supports the bits
method.  

GCBASIC also supports setting specific bits of a variable or register.
Use the following method:  

``` screen
    'variable.bitS method
    SPLLEN, IRCF3, IRCF2, IRCF1, IRCF0 = b'01111'
    ' would generate ASM [for your specific microcontroller like the following.
    ' bcf OSCTUNE,PLLEN,ACCESS
    ' bsf OSCCON,IRCF2,ACCESS
    ' bsf OSCCON,IRCF1,ACCESS
    ' bsf OSCCON,IRCF0,ACCESS
```

  
This method is limited to literal values. You cannot use value from
another variable as the setting value (at v0.98.00).  
  

<span class="strong">**Setting Explicit Bits of a Variable/Register with
Error Handling**</span>  
  
To set more than one bit in one command GCBASIC supports the bits
method.  

GCBASIC also supports setting specific bits of a variable or register
with error handling. Use this method to prevent errors when a specified
bit does not exist.  

The `[canskip]` prefix will handle the error condition when a specific
bit or specific bits do not exist. The following example shows the
usage.  

``` screen
    [canskip] SPLLEN, IRCF3, IRCF2, IRCF1, IRCF0 = b'01111'
```

  
This method is limited to literal values. You cannot use value from
another variable as the setting value (at v0.98.00).  
  
This example shows how the error handler compares to not have the
`[canskip]` prefix  

``` screen
      ' Of these two lines, only the first compiles:
      [canskip] SPLLEN, IRCF3, IRCF2, IRCF1, IRCF0 = b'01111'    'first line with error handler
      SPLLEN, IRCF3, IRCF2, IRCF1, IRCF0 = b'01111'              'second line with no error handler

      'Second line produces this message:
      'samevar.gcb (16): Error: Bit IRCF3 is not a valid bit and cannot be set
```

  
<span class="strong">**Setting a String - set a string with Escape
characters**</span>

An example showing how to set a string to an escape sequence for an ANSI
terminal.  You can \`Dim\`ension a string and then assign the elements
similar to setting array elements.

``` screen
    dim line2 as string
    line2 =  27, "[", "2", "H", 27, "[","K"
    HSerPrint line2
```

Will send the following to the terminal. &lt;esc&gt;\[2H&lt;esc&gt;\[K

  
  

<span class="strong">**For more help, see:**</span>
<a href="variables" class="link" title="Variables">Variables</a>

</div>
