<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="play"></span>Play

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    Play SoundPlayDataString
```

You must specify the following include and the port of the sound device.

``` screen
    #include <songplay.h>
    #define SOUNDOUT PORTN.N
```

<span class="strong">**Command Availability::**</span> Available on all
microcontrollers.

<span class="strong">**Explanation:**</span> This command will plays a
QBASIC sequence of notes. The SoundPlayDataString is a string
representing a musical note or notes to play where Notes are A to G.

<div class="informaltable">

| Command      | Description                                                                                                 |
|:-------------|:------------------------------------------------------------------------------------------------------------|
| A - G        | May be followed by length: 2 = half note, 4 = quarter, also may be followed by \# or + (sharp) or - (flat). |
| On           | Sets current octave. n is octave from 0 to 6                                                                |
| Pn           | Pause playing. n is length of rest                                                                          |
| Ln:          | Set default note length. n = 1 to 8.                                                                        |
| &lt; or &gt; | Change down or up an octave                                                                                 |
| Tn:          | Sets tempo in L4s/minute. n = 32 to 255, default 120.                                                       |
| Nn           | Play note n. n = 0 to 84, 0 = rest.                                                                         |

</div>

Unsupported QBASIC commands are

<div class="informaltable">

| Command | Description         |
|:--------|:--------------------|
| M       | Play mode           |
| .       | Changes note length |

</div>

For more information on the QBASIC PLAY command set, see
<https://en.wikibooks.org/wiki/QBasic/Appendix>

<span class="strong">**Example:**</span>

``` screen
    'Sample program to play a string
    'on PORTB bit 1.
    #chip 16F877A, 20
    #include <songplay.h>
    #define SoundOut PORTB.1


    play "C C# C C#"
```

<span class="strong">**For more help, see**</span>
<a href="sound_overview" class="link" title="Sound Overview">Sound Overview</a>

</div>
