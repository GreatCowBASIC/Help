<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="stoptimer"></span>StopTimer

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    StopTimer TimerNo
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers with a Timer modules. <span
class="strong">**Explanation:**</span>

On the Microchip PIC 18(L)Fxxx microcontrollers Timer 0 can be stopped
with `stopttimer`.  
With respect to Timer 0 on the Microchip PIC baseline and midrage range
of microcontrollers `stoptimer` (and `starttimer`) has no effect as
Timer 0.

  
  
  
<span class="strong">**Example:**</span>

This example will measure that time that a switch is depressed (or on)
and will write the results to the EEPROM.  
The example shows how to stop a timer when not in use.

``` screen
    #chip 16F819, 20
    #define Switch PORTA.0

    Dir Switch In
    DataCount = 0

    'Initilise Timer 1
    InitTimer1 Osc, PS1_8

    Dim TimerValue As Word

    Do
        ClearTimer 1
        Wait Until Switch = On
        StartTimer 1
        Wait Until Switch = Off
        StopTimer 1

        'Read the timer
        TimerValue = Timer1

        'Log the timer value
        EPWrite(DataCount, TimerValue_H)
        EPWrite(DataCount + 1, TimerValue)
        DataCount += 2
    Loop
```

<span class="strong">**Supported in &lt;TIMER.H&gt;**</span>

</div>
