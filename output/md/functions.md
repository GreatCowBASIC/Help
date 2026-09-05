<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="functions"></span>Functions

</div>

</div>

</div>

``` programlisting
    Function identifier  [( arg1 [ as Type ], arg2... argx) ] [As return_type]
        statements
        ...
        identifier = return_value
        ...
    End Function
```

<span class="strong">**About Functions**</span>

Functions are a special type of subroutine that can return a value. This
means that when the name of the function is used in the place of a
variable, GCBASIC will call the function, get a value from it, and then
put the value into the line of code in place of the variable.

Functions are strict. The function’s return value MUST be assigned to an
appropriate variable, or passed to another subroutine. Calling a
function with no assignment or use of the returned value will raise an
error condition.

Functions may have parameters - these are treated in exactly the same
way as parameters for subroutines. The only exception is that brackets
are required around any parameters when calling a function. The
argument’s type is given by "As type" following the parameter. If a
parameter in the declaration is given a default value, the parameter is
optional. Array parameters are specified by following an identifier with
an empty set of parentheses.

Returning values: `return_type` specifies the data type returned by a
function upon exit. If no data type is specified, then the function will
return the default data type, which is a byte. Functions return values
by assigning the Function keyword, or the function’s `identifier`, to
the desired return value; this assignment does not cause the function to
exit, however.

Since functions return values, function calls evaluate to expressions.
Thus, function calls can be made wherever an expression is expected,
such as in assignments or If statements. Parentheses surrounding the
argument list are required on function calls in expressions, and are
highly recommended even if there are no arguments.

<span class="strong">**Using Functions**</span>

This program uses a function called `AverageAD` to take two analog
readings, and then make a decision based on the average:

``` programlisting
    'Select chip
    #chip 16F88, 20

    'Define ports
    #define LED PORTB.0
    #define Sensor AN0

    'Set port directions
    dir LED out
    dir PORTA.0 in

    'Main code
    Do
        Set PORTB.0 Off
        If AverageAD > 128 Then Set PORTB.0 On          ' <<< calling the function in place of a value
        wait 10 ms
    Loop

    Function AverageAD
        'Get 2 readings, divide by 2, store in AverageAD
        'Note the cast, the result of ReadAD needs to be converted to
        'a word before adding, or the result may overflow.
        AverageAD = ([word]ReadAD(Sensor) + ReadAD(Sensor)) / 2
    end function
```

<span class="strong">**Key line:**</span>
`If AverageAD > 128 Then Set PORTB.0 On` — `AverageAD` is used exactly
like a variable inside the condition; GCBASIC calls the function, takes
its returned value, and compares that value to 128, all within the same
If statement.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="subroutines" class="link" title="Subroutines">Subroutines</a> — the
    non-value-returning counterpart to functions
-   <a href="exit" class="link" title="Exit">Exit</a> — exiting a
    function or subroutine early

</div>

</div>
