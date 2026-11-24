<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="select"></span>Select

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    Select Case var

    Case value1
      code1

    Case value2
      code2

    Case value_3 To _value4
      code3

    Case Else
      code4

    End Select
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The Select Case control structure is used to select and run a particular
section of code, based on the value of `var`. If `var` equals `value1`
then `code1` will be run. Once `code1` has run, the chip will jump to
the `End Select` command and continue running the program. If none of
the other conditions are true, then the code under the `Case Else`
section will be run.

`Case var TO var` is a range of values. If the value is within the range
the code section will be executed.

`Case value1, value2, …​` is a list of values, separated by commas. If
`var` equals <span class="strong">**any**</span> of the listed values,
that Case’s code section is run. Values can be numbers, characters, or
strings; a single `Case` may list at most 64 values (see
<a href="constraints_and_error_messages_overview" class="link" title="Constraints and Error Messages Overview">Constraints and Error Messages</a>).

``` programlisting
    Select Case Temp
      Case 0, 1, 2
        Print "Low"
      Case 3, 4, 5
        Print "Medium"
      Case Else
        Print "High"
    End Select
```

<span class="strong">**Key line:**</span> `Case 0, 1, 2` — runs
`Print "Low"` if `Temp` is 0, 1, <span class="strong">**or**</span> 2;
only one of the three values needs to match.

`Case Else` is optional, and the program will function correctly without
it.

If there is only one line of code after the `Case`, the code may look
neater if the line is placed after the `Case`. This is shown below in
the example, for cases 3, 4 and 5.

It is important to note that <span class="strong">**only one section of
code will be run**</span> when using `Select Case`.

<span class="strong">**Example:**</span>

``` programlisting
    'Program to read a value from a potentiometer, and display a
    'different word based on the result

      #chip 16F877a, 4

    'LCD connection settings
    #define LCD_IO 4
    #define LCD_WIDTH 20                ;specified lcd width for clarity only.  20 is the default width
    #define LCD_DB4 PORTD.4
    #define LCD_DB5 PORTD.5
    #define LCD_DB6 PORTD.6
    #define LCD_DB7 PORTD.7
    #define LCD_RS PORTD.0
    #define LCD_NO_RW
    #define LCD_ENABLE PORTD.2

    DIR PORTA.0 IN
    Do
      Temp = ReadAD(AN0) / 20
      CLS
      Select Case Temp          ' <<< the Select Case this page documents
        Case 0
          Print "None!"
        Case 1
          Print "One"
        Case 2
          Print "Two"
        Case 3: Print "Three"
        Case 4: Print "Four"
        Case 5: Print "Five"
        Case Else
          Print "A lot!"
      End Select
      Wait 250 ms
    Loop
```

<span class="strong">**Key line:**</span> `Select Case Temp` — only the
single `Case` branch matching `Temp` runs, then execution continues
after `End Select`.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="if" class="link" title="If">If</a> — two-way branch
    alternative for simpler conditions
-   <a href="conditions" class="link" title="Conditions">Conditions</a> — background
    on how conditions are evaluated
-   <a href="readad" class="link" title="ReadAD">ReadAD</a> — reading
    the potentiometer value tested in Example 1
-   <a href="cls" class="link" title="CLS">CLS</a> — clearing the
    LCD before printing a result, as used in Example 1
-   <a href="print" class="link" title="Print">Print</a> — displaying
    the selected branch’s text, as used in Example 1
-   <a href="constraints_and_error_messages_overview" class="link" title="Constraints and Error Messages Overview">Constraints and Error Messages</a> — the
    64-value Case list limit, and other compiler constraints

</div>

</div>
