<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="if"></span>If

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
Short form:

    If condition Then command

Long form:

    If condition Then
    ...
    program code
    ...
    End If

Using Else:

    If condition Then
      code to run if true
    Else
      code to run if false
    End If

Using If Else:

    If condition Then
      code to run if true
    Else if nextcondition then
      code to run if nextcondition true
    Else
      code to run if false
    End If
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The `If` command is the most common command used to make decisions. If
`condition` is `true`, then `command` (short) or `program code` (long)
will be run. If it is `false`, then the microcontroller will skip to the
code located on the next line (short) or after the `End If` (long form).

If `Else` is used, then the condition between `If` and `Else` will run
if the condition is `true`, and the code between `Else` and `End If`
will run if the condition is `false`.

If `Else if` is used, then the condition after the `Else if` will run if
the condition is `true`.

<span class="strong">**Note:**</span> `Else` must be on a separate line
in the source code.

Supported:

``` screen
    <instruction> 'is supported
    Else
    <instruction>
```

``` screen
    <instruction> Else 'Not Supported, but will compile
    <instruction>
```

<span class="strong">**Example:**</span>

``` programlisting
    'Turn a light on or off depending on a light sensor

    #chip 12F683, 8

    #define LIGHT GPIO.1
    #define SENSOR AN3
    #define SENSOR_PORT GPIO.4

    Dir LIGHT Out
    Dir SENSOR_PORT In

    Do
      If ReadAD(SENSOR) > 128 Then          ' <<< the If...Then...Else this page documents
        Set LIGHT Off
      Else
        Set LIGHT On
      End If
    Loop
```

<span class="strong">**Key line:**</span>
`If ReadAD(SENSOR) > 128 Then` — the condition is evaluated once; the
`Else` branch runs only when it is false.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="conditions" class="link" title="Conditions">Conditions</a> — background
    on how conditions are evaluated
-   <a href="select" class="link" title="Select">Select Case</a> — alternative
    when choosing between more than two branches
-   <a href="do" class="link" title="Do">Do</a> — looping
    construct used to repeat the check in the example above
-   <a href="for" class="link" title="For">For</a> — fixed-count
    loop alternative to Do
-   <a href="readad" class="link" title="ReadAD">ReadAD</a> — reading
    the sensor value tested in the example above

</div>

</div>
