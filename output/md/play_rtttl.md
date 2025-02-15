<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="play_rtttl"></span>Play RTTTL

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    PlayRTTTL SoundPlayRTTTLDataString
```

You must specify the following include and the port of the sound device.

``` screen
    #include <songplay.h>
    #define SOUNDOUT PORTN.N
```

<span class="strong">**Command Availability::**</span> Available on all
microcontrollers.

<span class="strong">**Explanation:**</span> This command will play a
sequence of notes in the Nokia RTTTL string format.

The SoundPlayRTTTLDataString is a string representing a musical note or
notes to play where Notes are A to G. This format and information below
is credited to WikiPedia, see here. To be recognized by ringtone
programs, an RTTTL/Nokring format ringtone must contain three specific
elements: name, settings, and notes. For example, here is the RTTTL
ringtone for Haunted House:

HauntHouse: d=4,o=5,b=108: 2a4, 2e, 2d\#, 2b4, 2a4, 2c, 2d, 2a\#4, 2e.,
e, 1f4, 1a4, 1d\#, 2e., d, 2c., b4, 1a4, 1p, 2a4, 2e, 2d\#, 2b4, 2a4,
2c, 2d, 2a\#4, 2e., e, 1f4, 1a4, 1d\#, 2e., d, 2c., b4, 1a4

The three parts are separated by a colon.

<div class="itemizedlist">

-   Part 1: name of the ringtone (here: "HauntHouse"), a string of
    characters represents the name of the ringtone
-   Part 2: settings (here: d=4,o=5,b=108), where "d=" is the default
    duration of a note. In this case, the "4" means that each note with
    no duration specifier (see below) is by default considered a quarter
    note. "8" would mean an eighth note, and so on. Accordingly, "o=" is
    the default octave. There are four octaves in the Nokring/RTTTL
    format. And "b=" is the tempo, in "beats per minute".
-   Part 3: the notes. Each note is separated by a comma and includes,
    in sequence: a duration specifier, a standard music note, either a,
    b, c, d, e, f or g, and an octave specifier. If no duration or
    octave specifier are present, the default applies.

</div>

<span class="strong">**Example 1:**</span>

``` screen
    #chip 16f877a
    #include <songplay.h>


    #define SOUNDOUT PORTA.4
    PlayRTTTL "HauntHouse: d=4,o=5,b=108: 2a4, 2e, 2d#, 2b4, 2a4, 2c, 2d, 2a#4, 2e., e, 1f4, 1a4, 1d#, 2e., d, 2c., b4, 1a4, 1p, 2a4, 2e, 2d#, 2b4, 2a4, 2c, 2d, 2a#4, 2e., e, 1f4, 1a4, 1d#, 2e., d, 2c., b4, 1a4"
```

<span class="strong">**Example 2:**</span>

``` screen
     #chip 16f877a
    #include <songplay.h>

    'Defines
    #define SoundOut PORTC.0


    Dir SoundOut Out
    Dim SoundPlayRTTTLDataString as String


    wait 1 s
    SoundPlayRTTTLDataString = "Thegood,:d=4,o=6,b=63:32c,32f,32c,32f,c,8g_5,8a_5,f5,8p,32c,32f,32c,32f,c,8g_5,8a_5,d_"
    PlayRTTTL(SoundPlayRTTTLDataString)


    wait 1 s
    SoundPlayRTTTLDataString ="LedZeppel:d=4,o=6,b=80:8g,16p,8f_,16p,8f,16p,8e,16p,8d,8a5,8c,16p,8b5,16p,a_5,8a5,16f5,16e5,16d5,8p,16p,16a_5,16a_5,16a_5,8p,16p,16b5,16b5,16b5,8p,16p,16b5,16b5,16b5,8p,16p,16c,16c,16c,8p,16p,16c,16c,16c"
    PlayRTTTL(SoundPlayRTTTLDataString)


    Do Forever
    Loop
    End
```

<span class="strong">**For more help, see**</span>
<a href="sound_overview" class="link" title="Sound Overview">Sound Overview</a>

</div>
