<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="exit"></span>Exit

</div>

</div>

</div>

<span class="strong">**Syntax options:**</span>

``` screen
    Exit Sub | Exit Function | Exit Do | Exit For | Exit Repeat
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

This command makes the program exit the routine or loop it is currently
in, as if it had reached the end of that routine or loop.

It applies to subroutines, functions, `For`-`Next` loops, `Do`-`Loop`
loops, and `Repeat` loops — use the form matching what you want to exit
(`Exit Sub`, `Exit Function`, `Exit Do`, `Exit For`, or `Exit Repeat`).

<span class="strong">**Example:**</span>

``` programlisting
    #chip tiny13, 1

    #define SENSOR PORTB.0
    #define BUZZER PORTB.1
    #define LIGHT PORTB.2
    Dir SENSOR In
    Dir BUZZER Out
    Dir LIGHT Out

    Do
      Burglar
    Loop

    'Burglar Alarm subroutine
    Sub Burglar
      If SENSOR = 0 Then
        Set BUZZER Off
        Set LIGHT Off
        Exit Sub          ' <<< the Exit instruction
      End If
      Set BUZZER On
      Set LIGHT On
    End Sub
```

<span class="strong">**Key line:**</span> `Exit Sub` — leaves `Burglar`
immediately once the sensor reads clear, so the two lines that would
otherwise switch the buzzer and light on are skipped.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="do" class="link" title="Do">Do</a> — the loop form
    exited with `Exit Do`
-   <a href="for" class="link" title="For">For</a> — the loop form
    exited with `Exit For`
-   <a href="repeat" class="link" title="Repeat">Repeat</a> — the
    loop form exited with `Exit Repeat`
-   <a href="subroutines" class="link" title="Subroutines">Sub</a> — the
    routine form exited with `Exit Sub`, as used above
-   <a href="functions" class="link" title="Functions">Functions</a> — the
    routine form exited with `Exit Function`

</div>

</div>
