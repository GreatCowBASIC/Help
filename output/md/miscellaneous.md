<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="miscellaneous"></span>Miscellaneous

</div>

</div>

</div>

<span class="strong">**About Miscellaneous things**</span>

It is possible to combine multiple instructions on a single line, by
separating them with a colon. For example, this code:

``` programlisting
    Set PORTB.0 On
    Set PORTB.1 On
    Wait 1 sec
    Set PORTB.0 Off
    Set PORTB.1 Off
```

could also be written as:

``` programlisting
    Set PORTB.0 On: Set PORTB.1 On          ' <<< two instructions combined on one line with a colon
    Wait 1 sec
    Set PORTB.0 Off: Set PORTB.1 Off
```

<span class="strong">**Key line:**</span>
`Set PORTB.0 On: Set PORTB.1 On` — a colon lets two otherwise-separate
statements share a single line; the compiler treats this exactly the
same as writing them on two lines.

In most cases, it will make no difference whether commands share a line
or not. However, special care should be taken with If commands, as this
code:

``` programlisting
    Set PORTB.0 Off
    Set PORTB.1 Off
    If Temp > 10 Then Set PORTB.0 On: Set PORTB.1 On
    Wait 1 s
```

will be equivalent to this:

``` programlisting
    Set PORTB.0 Off
    Set PORTB.1 Off
    If Temp > 10 Then
    Set PORTB.0 On
    Set PORTB.1 On
    End If
    Wait 1 s
```

Also, the commands used to start and end subroutines, data tables, and
functions must be alone on a line. For example, this is WRONG:

``` programlisting
    Sub Something: Set PORTB.0 Off: End Sub
```

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="if" class="link" title="If">If</a> — the single-line
    If form shown above
-   <a href="subroutines" class="link" title="Subroutines">Subroutines</a> — Sub/End
    Sub, which cannot share a line with other statements

</div>

</div>
