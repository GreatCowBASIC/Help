<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="starttimer"></span>StartTimer

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    StartTimer TimerNo
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers with a Timer module.

<span class="strong">**Explanation:**</span>

`StartTimer` is used to start the specified timer.

<span class="strong">**Timer 0:**</span>

Please refer to the datasheet to determine if Timer 0 on specific
Microchip PIC microcontroller can be started and stopped with
`starttimer` and `stoptimer`. If the Microchip PIC microcontroller has a
register named "T0CON" then it supports `stoptimer` and `starttimer`.

On Microchip PIC 18(L)Fxxx microcontrollers Timer 0 can be started with
`starttimer`.  
On Microchip PIC baseline and midrange microcontrollers `starttimer`
(and `stoptimer`) has no effect upon Timer 0.

  
  
  
<span class="strong">**Example:**</span>

This example will measure that time that a switch is depressed (or on)
and will write the results to the EEPROM.

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
        StartTimer 1          ' <<< the StartTimer instruction
        Wait Until SWITCH = Off
        StopTimer 1

        'Read the timer
        TimerValue = Timer1

        'Log the timer value
        EPWrite(DataCount, TimerValue_H)
        EPWrite(DataCount + 1, TimerValue)
        DataCount += 2
    Loop
```

<span class="strong">**Key line:**</span> `StartTimer 1` — starts Timer
1 counting from wherever `ClearTimer` left it, right when the switch is
pressed.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="inittimer1" class="link" title="InitTimer1">InitTimer1</a> — configuring
    the timer’s clock source/prescaler before starting it
-   <a href="stoptimer" class="link" title="StopTimer">StopTimer</a>
    /
    <a href="cleartimer" class="link" title="ClearTimer">ClearTimer</a> — stopping
    and resetting the timer, as used above
-   <a href="settimer" class="link" title="Settimer">Settimer</a> — preloading
    a timer’s count value
-   <a href="reading_timers" class="link" title="Reading Timers">Reading Timers</a> — reading
    a running timer’s current count
-   <a href="epwrite" class="link" title="EPWrite">EPWrite</a> — logging
    the measured timer value, as used above

</div>

<span class="strong">**Supported in &lt;TIMER.H&gt;**</span>

</div>
