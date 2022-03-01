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
