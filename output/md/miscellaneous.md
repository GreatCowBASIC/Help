<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="miscellaneous"></span>Miscellaneous

</div>

</div>

</div>

<span class="strong">**About Miscellaneous things…​.**</span>

It is possible to combine multiple instructions on a single line, by
separating them with a colon. For example, this code:

``` screen
    Set PORTB.0 On
    Set PORTB.1 On
    Wait 1 sec
    Set PORTB.0 Off
    Set PORTB.0 Off
```

could also be written as:

``` screen
    Set PORTB.0 On: Set PORTB.1 On
    Wait 1 sec
    Set PORTB.0 Off: Set PORTB.0 Off
```

In most cases, it will make no difference if commands share a line or
not. However, special care should be taken with If commands, as this
code:

``` screen
    Set PORTB.0 Off
    Set PORTB.1 Off
    If Temp > 10 Then Set PORTB.0 On: Set PORTB.1 On
    Wait 1 s
```

Will be equivalent to this:

``` screen
    Set PORTB.0 Off
    Set PORTB.1 Off
    If Temp > 10 Then
    Set PORTB.0 On
    Set PORTB.1 On
    End If
    Wait 1 s
```

Also, the commands used to start and end subroutines, data tables and
functions must be alone on a line. For example, this is WRONG:

``` screen
    Sub Something: Set PORTB.0 Off: End Sub
```

</div>
