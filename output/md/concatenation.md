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

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The `+` operator joins two variables into another variable when used
between strings.

This operation does not change the existing strings; it returns a <span
class="strong">**new**</span> string containing the text of the joined
variables — see the concatenation constraint below.

Concatenation joins the elements of the specified values, with no
separator inserted between them.

<div class="warning" style="margin-left: 0.5in; margin-right: 0.5in;">

### Warning

Using concatenation as a parameter to commands like `HSerPrint` or
`Print`, the compiler will create a system string variable to hold the
result.  For example, concatenating two string constants like
`HSerPrint ("123"+"456")` may yield incorrect results.  Use the constant
`SYSDEFAULTCONCATSTRING` to resolve this.  Without
`SYSDEFAULTCONCATSTRING`, there is a risk that the compiler does not
allocate sufficient RAM to hold the concatenated string.   The resulting
string may be corrupted, since the size of the system string variable is
not sufficient.  Use `SYSDEFAULTCONCATSTRING` within the source program
to resolve this.

</div>

<span class="strong">**Setting a Specific Size for the Compiler-Created
System String Variable**</span>

Use the following to set the size of the system string variable used
during concatenation.  

The compiler creates system string variables when you concatenate on a
command line such as `HSerPrint`, `Print`, and many other commands.  
Concatenating directly within a command is bad practice: it uses a lot
of RAM and may create a number of system string variables.   It is
recommended to define a string of a known length, concatenate using an
assignment, and then use the resulting string.  

To control the size of the system string variable, use the following.
Also use this constant to set the size when the compiler does not
otherwise create a system string variable.  

``` programlisting
    'Define the constant to control the size of system-created string variables called SYSSTRINGPARAM1, SYSSTRINGPARAM2, etc.
    Use #DEFINE  SYSDEFAULTCONCATSTRING  4          ' <<< the constant that fixes the concatenation-buffer sizing issue

    'Then, use
    HSerPrint "A"+"123"   'will print A123. Without the SYSDEFAULTCONCATSTRING constant, some microcontrollers may corrupt the result of the concatenation.
```

<span class="strong">**Key line:**</span>
`#DEFINE SYSDEFAULTCONCATSTRING 4` — reserves a system string buffer
large enough for the concatenated result, preventing the corruption that
can occur when the compiler under-allocates RAM for an in-line
concatenation.

This concatenation constraint does not apply when concatenation is used
as a plain assignment.    
  
<span class="strong">**Example 1:**</span>

``` screen
    timevariable = 999
    stringvar = "Time = " + str(timevariable) ' Convert timevariable to a String.  This operation returns Time = 999
```

<span class="strong">**Example 2:**</span>

An example showing how to set a string to an escape sequence for an ANSI
terminal.&\#160;&\#160;You can \`Dim\`ension a string and then assign
the elements like an array. {empty} + {empty} +

``` programlisting
    dim line2 as string
    line2 =  27, "[", "2", "H", 27, "[","K"
    HSerPrint line2
```

This sends the following to the terminal:
&lt;esc&gt;\[2H&lt;esc&gt;\[K  
  
<span class="strong">**Example 3: Assigning a Concatenated String to the
Same String**</span>

For reliable code, do not assign a string concatenation back to its own
source variable.  Assign the result of a string concatenation to a
different string variable instead.  To resolve, see below:

``` screen
    Dim outstring, tmpstring as string * 16
    Dim outnumber as byte

    outnumber = 24
    outstring = "Result = "
    'This concatenation may yield an incorrect string on 10f, 12f or 16f chips
    outstring = outstring + str(outnumber)          ' <<< the unreliable pattern -- assigning a concatenation back onto itself
    HserPrintCRLF 2
    HSerPrint outstring
    HserPrintCRLF 2

    outstring = "Result = "
    'This concatenation will yield the correct string, with tmpstring containing the correct concatenated string
    tmpstring = outstring +str(outnumber)          ' <<< the reliable pattern -- assigning the concatenation to a different string
    HSerPrint tmpstring
    HserPrintCRLF 2
    end
```

<span class="strong">**Key line:**</span>
`tmpstring = outstring +str(outnumber)` — assigns the concatenation
result to a separate string variable (`tmpstring`), avoiding the
unreliable self-assignment shown just above it.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="asc" class="link" title="Asc">Asc</a> — related
    command in the same category
-   <a href="str" class="link" title="Str">Str</a> — converting a
    number to a string before concatenating it

</div>

</div>
