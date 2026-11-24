<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="shorttone"></span>ShortTone

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    ShortTone Frequency, Duration
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

This command will produce the specified tone for the specified duration.
Frequency is measured in units of 10 Hz, and Duration is in 1 ms units.
Please note that this command may not produce the exact frequency
specified. While it is accurate enough for error beeps and small pieces
of monophonic music, it should not be used for anything that requires a
highly precise frequency.

<span class="strong">**Example:**</span>

``` programlisting
    'Sample program to produce a tone on PORTB bit 1, based on the
    'reading of an LDR on AN0 (usually PORTA bit 0).

    #chip 16F88, 20
    #define SoundOut PORTB.1

    Dir PORTA.0 In

    Do
        ShortTone ReadAD(AN0), 100          ' <<< the ShortTone instruction
    Loop
```

<span class="strong">**Key line:**</span>
`ShortTone ReadAD(AN0), 100` — reads the light sensor and uses that
0-255 value directly as the frequency, in 10 Hz units, so brighter light
plays a higher pitch, for 100 ms.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="sound_overview" class="link" title="Sound Overview">Sound Overview</a>

</div>

</div>
