<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="concatenation"></span>Concatenation

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    stringvar = variable1 + variable2
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers

<span class="strong">**Explanation:**</span>

The method joins two variables into another variable.

This method does not change the existing strings, but returns a <span
class="strong">**new**</span> string containing the text of the joined
variables, see Concatenated String Constraint below.

Concatenation joins the elements of a specified values using the
specified separator between each variable.

<div class="warning" style="margin-left: 0.5in; margin-right: 0.5in;">

### Warning

Using concatenation as a parameter with commands like HSerPrint or Print
the compiler will create a system string variable.   An examples of
concatenating two strings constants like HSerPrint ("123"+"456") may
yield incorrect results.  Use the constant SYSDEFAULTCONCATSTRING to
resolve.  Without using SYSDEFAULTCONCATSTRING there is a risk that the
compiler does not allocate sufficient RAM to hold the concatenated
string.   The resulting string may be corrupted as the size of the
system string variable is not sufficient.  Use SYSDEFAULTCONCATSTRING
within the source program to resolve.

</div>

<span class="strong">**Set a specific size of compiler created system
string variable**</span>

Use the following to set the size of the system string variable used
during concatenation.  

The compiler will create system string variables when you concatenate on
a commands line like `HSerPrint`, `Print` and many others commands.  
Using concatenate with a command is bad practice, using a lot of RAM and
may create a number of system string variables.   It is recommended to
define a string (of a known length), concatenate using an assignment
then use the string.  

To control the size of system string variable use the following.   Also,
use this constant to set the size when the compiler does not create a
system string variable.  

``` screen
    'Define the constant to control the size of system created string variables called SYSSTRINGPARAM1, SYSSTRINGPARAM2 etc.
    Use #DEFINE  SYSDEFAULTCONCATSTRING  4

    'Then, use
    HSerPrint "A"+"123"   'will print A123. Without the SYSDEFAULTCONCATSTRING constant some microcontrollers may corrupt the result of the concatenation.
```

This concatenation constraint does not apply using concatenation as an
assignment.    
  
<span class="strong">**Example 1:**</span>

``` screen
    timevariable = 999
    stringvar = "Time = " + str(timevariable) ' Convert the timevariable to a String.  This operation returns Time = 999
```

<span class="strong">**Example 2:**</span>

An example showing how to set a string to an escape sequence for an ANSI
terminal.  You can \`Dim\`ension a string and then assign the elements
like an array. {empty} + {empty} +

``` screen
    dim line2 as string
    line2 =  27, "[", "2", "H", 27, "[","K"
    HSerPrint line2
```

Will send the following to the terminal. &lt;esc&gt;\[2H&lt;esc&gt;\[K  
  
<span class="strong">**Example 3: Assigning concatenated string to same
string**</span>

For reliable coding you must not assign a string concatenation to same
source variable.  You must assign the result of string concatenation to
another string.   To resolve see below:

``` screen
    Dim outstring, tmpstring as string * 16
    Dim outnumber as byte

    outnumber = 24
    outstring = "Result = "
    'This concatenation may yield an incorrect string on 10f, 12f or 16f chips
    outstring = outstring + str(outnumber)
    HserPrintCRLF 2
    HSerPrint outstring
    HserPrintCRLF 2

    outstring = "Result = "
    'This concatenation will yield an the correct string. With tmpstring1 containing the correct concatenated string
    tmpstring = outstring +str(outnumber)
    HSerPrint tmpstring
    HserPrintCRLF 2
    end
```

  
To resolve the constraint simply assign the source string to another
string.

  
  

</div>
