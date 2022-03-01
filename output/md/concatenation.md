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

Using concatenation with commands like HSerPrint, Print the compiler
will create a system string variable.  Examples of two strings constants
( HSerPrint "123"+"456" may yield incorrect results.  See the use of
SYSDEFAULTCONCATSTRING below  Without using SYSDEFAULTCONCATSTRING there
is a risk that the compiler does not allocate sufficient RAM to hold the
concatenated string.   The resulting string may be corrupted as the size
of the system string variable if not set using SYSDEFAULTCONCATSTRING
within the source program.

</div>

<span class="strong">**Set a specific size of compiler created system
string variable**</span>

Use the following to set the size of compiler created system string
variable.  

The compiler will create system string variables when you concatenate on
a commands line like `HSerPrint`, `Print` and many others commands.  
Using concatenate with a command is bad practice, using a lot of RAM and
may create a number of system string variables.   It is recommended to
define a string (of a known length), concatenate using an assignment
then use the string.  

This constraint does not apply using concatenation as an assignment.  

To control the size of system string variable use the following.   Also,
use this constant to set the size when the compiler does not create a
system string variable.  

``` screen
    'Define the constant to control the size of system created string variables called SYSSTRINGPARAM1, SYSSTRINGPARAM2 etc.
    Use #DEFINE  SYSDEFAULTCONCATSTRING  4

    'Then, use
    HSerPrint "A"+"123"   'will print A123. Without the SYSDEFAULTCONCATSTRING constant some microcontrollers may corrupt the result of the concatentation.
```

  
  
<span class="strong">**Example 1:**</span>

``` screen
    timevariable = 999
    stringvar = "Time = " + str(timevariable) ' Convert the timevariable to a String.  This operation returns Time = 999
```

  
  

<span class="strong">**Example 2:**</span>

An example showing how to set a string to an escape sequence for an ANSI
terminal.  You can \`Dim\`ension a string and then assign the elements
like an array.

  
  

``` screen
    dim line2 as string
    line2 =  27, "[", "2", "H", 27, "[","K"
    HSerPrint line2
```

Will send the following to the terminal. &lt;esc&gt;\[2H&lt;esc&gt;\[K

  
  

<span class="strong">**Note: Concatenated String Constraint @v0.98.00
and prior versions**</span>

When concatenating a string you cannot assign a string to itself.  You
must assign the result of string concatenation to another string. See
below.

<span class="strong">**Example to resolve string handling
constraint:**</span>

``` screen
    dim outstring1, tmpstring as string * 16
    dim outnumber as byte

    outnumber = 24
    outstring1 = "Result = "
    'This concatenation will yield an incorrect string
    outstring1 = outstring1 +str(outnumber)

    'This concatenation will yield an the correct string. With tmpstring1 containing the correct concatenated string
    tmpstring1 = outstring1 +str(outnumber)
```

  
To resolve the constraint simply assign the source string to another
string.

  
  

</div>
