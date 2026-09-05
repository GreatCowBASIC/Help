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

Available on all microcontrollers with a Timer modules.

<span class="strong">**Explanation:**</span>

On the Microchip PIC 18(L)Fxxx microcontrollers Timer 0 can be stopped
with `StopTimer`.  
With respect to Timer 0 on the Microchip PIC baseline and mid-range
microcontrollers, `StopTimer` (and `StartTimer`) has no effect on Timer
0.

  
  
  
<span class="strong">**Example:**</span>

This example will measure that time that a switch is depressed (or on)
and will write the results to the EEPROM.  
The example shows how to stop a timer when not in use.

``` programlisting
    #chip 16F819, 20
    #define SWITCH PORTA.0

    Dir SWITCH In
    DataCount = 0

    'Initilise Timer 1
    InitTimer1 Osc, PS1_8

    Dim TimerValue As Word

    Do
        ClearTimer 1
        Wait Until SWITCH = On
        StartTimer 1
        Wait Until SWITCH = Off
        StopTimer 1          ' <<< the StopTimer instruction
        'Read the timer
        TimerValue = Timer1

        'Log the timer value
        EPWrite(DataCount, TimerValue_H)
        EPWrite(DataCount + 1, TimerValue)
        DataCount += 2
    Loop
```

<span class="strong">**Key line:**</span> `StopTimer 1` — freezes Timer
1’s count the moment the switch is released, so `Timer1` can then be
read as a stable elapsed-time value.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="starttimer" class="link" title="StartTimer">StartTimer</a> — starting
    the timer that this stops
-   <a href="cleartimer" class="link" title="ClearTimer">ClearTimer</a> — resetting
    the timer’s count to zero, as used above
-   <a href="inittimer1" class="link" title="InitTimer1">InitTimer1</a> — configuring
    the timer before starting it, as used above

</div>

<span class="strong">**Supported in &lt;TIMER.H&gt;**</span>

</div>
