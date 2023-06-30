<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="settimer"></span>Settimer

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    Settimer timernumber, byte_value

    Settimer timernumber, word_value
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers with a Timer modules.

<span class="strong">**Explanation:**</span>

`Settimer` will set the value of the specified timer with either byte
value or a word value. 8-bit timers use a byte value. 16-bit timers use
a word value.

`Settimer` can be used on-the-fly, so there is no requirement to stop
the timer first.

Refer to the datasheet for timer specific information.

  
  
  
<span class="strong">**Example:**</span>

This example shows the operation of setting two timers - is not intended
as a meaningful solution.

``` screen
    #chip 16f877a, 4
    On Interrupt Timer1Overflow call Overflowed
    Set PORTB.0 On

    InitTimer1 Osc, PS1_8
    SetTimer 1, 1
    StartTimer 1

    InitTimer2 PS2_16, PS2_16
    SetTimer 2, 255
    StartTimer 2

    'Manually set Timer2Overflow to create a second event
    'this will event will be handled by the Interrupt sub routine
    TMR2IE = 1
    end

    Sub Interrupt
      Set PORTB.2 On
      TMR2IF = 0
    End Sub

    Sub Overflowed
      Set PORTB.1 On
      TMR1IF = 0
    End Sub
```

<span class="strong">**Supported in &lt;TIMER.H&gt;**</span>

</div>
