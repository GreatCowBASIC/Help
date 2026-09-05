<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="wait"></span>Wait

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

<span class="strong">**<span class="emphasis">*Fixed Length
Delay:*</span>**</span>

``` programlisting
    Wait time units
```

<span class="strong">**<span class="emphasis">*Conditional
Delay:*</span>**</span>

``` programlisting
    Wait {While | Until} condition
```

<span class="strong">**<span class="emphasis">*Using a variable to
specify a US delay with warning suppression:*</span>**</span>

``` programlisting
    Wait timevalue US #OVERRIDEWARNING
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The `Wait` command causes the program to wait for either a specified
amount of time (such as 1 second), or while/until a condition is true.

When using the fixed-length delay, a variety of units are available:

<div class="informaltable">

| <span class="strong">**Unit**</span> | <span class="strong">**Length of unit**</span> | <span class="strong">**Delay range**</span> |
|:-------------------------------------|:-----------------------------------------------|:--------------------------------------------|
| us                                   | 1 microsecond                                  | 1 us - 65535 us                             |
| 10us                                 | 10 microseconds                                | 10 us - 2.55 ms                             |
| ms                                   | 1 millisecond                                  | 1 ms - 65535 ms                             |
| 10ms                                 | 10 milliseconds                                | 10 ms - 2.55 s                              |
| s                                    | 1 second                                       | 1 s - 255 s                                 |
| m                                    | 1 minute                                       | 1 min - 255 min                             |
| h                                    | 1 hour                                         | 1 hour - 255 hours                          |

</div>

At one stage, GCBASIC variables could not hold more than 255. The `10us`
and `10ms` units were added as a way to work around this limit. There is
now no such limit (`Wait 1000 ms` will work, for example), so these are
not really needed. However, you may see them in some older examples or
programs, and the `10us` unit is sometimes the shortest delay that will
work accurately.

<div class="warning" style="margin-left: 0.5in; margin-right: 0.5in;">

### Warning

<span class="strong">**PIC Devices Only**</span>  
MS delays at clock frequencies below 28kHz are not supported and will
silently fail.  
US delays at clock frequencies below 250kHz are not supported and will
silently fail.  
US delays at lower clock frequencies are accurate ONLY when the value is
divisible by 4. This is caused by the minimum ASM delay loop being a
specific number of instructions.  
US delays at lower clock frequencies, when not divisible by 4, will
silently accept the value and produce incorrect delays. + Use
`#OVERRIDEWARNING` to suppress the resulting warning. Delays at clock
frequencies below 500kHz may be impacted by previous instructions;
testing of actual delays is advised.  

</div>

<span class="strong">**Example:**</span>

``` programlisting
    'This code will wait until a button is pressed, then it will flash
    'a light every half a second and produce a 440 Hz tone.

    #chip 16F819, 8

    #define BUTTON PORTB.0
    #define SPEAKER PORTB.1
    #define LIGHT PORTB.2
    Dir BUTTON In
    Dir SPEAKER Out
    Dir LIGHT Out

    'Assumes Button switches on when pressed
    Wait Until BUTTON = 1          ' <<< the conditional form of Wait instruction
    Wait Until BUTTON = 0

    Do
      'Flash the light
      Set LIGHT On
      Wait 500 ms
      Set LIGHT Off

      'Produce the tone
      '440 Hz = 880 changes = tone on for 1.14 ms
      Repeat 440
        PulseOut SPEAKER, 1140 us
        Wait 114 10us 'Wait for 114 x 10 us (1.14 ms)
      End Repeat
    Loop
```

<span class="strong">**Key line:**</span>
`Wait Until BUTTON = 1` — blocks the program here, checking `BUTTON`
repeatedly, until it reads `1`; this is the conditional form of `Wait`,
as opposed to the fixed-length `Wait 500 ms` used further down.

To suppress warnings when using US.

``` programlisting
    dim timevariable as Word
    timevariable = 100 // 100 is an example value that assigns the variable.

    // Use #OVERRIDEWARNING to prevent warning messages
    wait timevariable US #OVERRIDEWARNING
```

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="conditions" class="link" title="Conditions">Conditions</a> — the
    comparisons used in `Wait While`/`Wait Until`
-   <a href="repeat" class="link" title="Repeat">Repeat</a> — looping
    a fixed number of times, as combined with `Wait` above
-   <a href="pulseout" class="link" title="PulseOut">PulseOut</a> — timed
    pin pulses, often used alongside `Wait`
-   <a href="pause" class="link" title="Pause">Pause</a> — the
    older, milliseconds-only equivalent to a fixed-length `Wait`

</div>

</div>
