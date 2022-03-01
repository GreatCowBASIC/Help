<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="tone"></span>Tone

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    Tone Frequency, Duration
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

This command will produce the specified tone for the specified duration.
`Frequency` is measured in Hz, and `Duration` is in 10 ms units.

Please note that this command may not produce the exact frequency
specified. While it is accurate enough for error beeps and small pieces
of monophonic music, it should not be used for anything that requires a
highly precise frequency.

<span class="strong">**Example:**</span>

``` screen
'Sample program to produce a constant A note (440 Hz)
'on PORTB bit 1.
#chip 16F877A, 20
#define SoundOut PORTB.1

Do
    Tone 440, 1000
Loop
```

<span class="strong">**For more help, see**</span>
<a href="sound_overview" class="link" title="Sound Overview">Sound Overview</a>

</div>
