<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="_exit"></span>Exit

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

This command will make the program exit the routine it is currently in,
as it would if it came to the end of the routine.

Applies to Subroutines, Functions, For-Next loops, Do-Loop loops and
Repeat loops.

<span class="strong">**Example:**</span>

``` screen
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
        Exit Sub
      End If
      Set BUZZER On
      Set LIGHT On
    End Sub
```

<span class="strong">**For more help, see
<a href="_do.html" class="link" title="Do">Do</a>,
<a href="_for.html" class="link" title="For">For</a>,
<a href="_subroutines.html" class="link" title="Subroutines">Sub</a>,
<a href="_functions.html" class="link" title="Functions">Functions</a>**</span>
and <span
class="strong">**<a href="_repeat.html" class="link" title="Repeat">Repeat</a>**</span>

</div>
