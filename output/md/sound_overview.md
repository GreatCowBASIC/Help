<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="sound_overview"></span>Sound Overview

</div>

</div>

</div>

<span class="strong">**Introduction:**</span>

These Great Cow BASIC methods generate tones of a given frequency and
duration.

<div class="informaltable">

| <span class="strong">**Method**</span> | <span class="strong">**Controls**</span>                                                                        |
|:---------------------------------------|:----------------------------------------------------------------------------------------------------------------|
| Tone                                   | Generate a specified tone for a specified duration in terms of a frequency of a specified Mhz and units of 10ms |
| ShortTone                              | Generate a specified tone for a specified duration in terms of a frequency of a 10Mhz and units of 1ms          |
| Play                                   | Play a tune string. The format of the string is the QBASIC play command.                                        |
| PlayRTTTL                              | Play a tune string. The format of the string is the Nokia cell phone RTTTL format.                              |

</div>

<span class="strong">**Relevant Constants:**</span>

These constants are used to control settings for the tone generation
routines. To set them, place a line in the main program file that uses
`#define` to assign a value to the particular constant.

<div class="informaltable">

| <span class="strong">**Constant Name**</span> | <span class="strong">**Controls**</span> | <span class="strong">**Default Value**</span>                                         |
|:----------------------------------------------|:-----------------------------------------|:--------------------------------------------------------------------------------------|
| `SoundOut`                                    | The output pin to produce sound on       | N/A - <span class="strong">**<span class="emphasis">*Must be defined*</span>**</span> |

</div>

<span class="strong">**<span class="emphasis">*Note:*</span>**</span> If
an exact frequency is required, or a smaller program is needed, these
routines should not be used. Instead, you should use code like this:

``` screen
    Repeat count
    PulseOut SoundOut, period us
    Wait period us
    End Repeat
```

Set `count` and `period` to the appropriate values as follows:

`period` to 1000000 / desired frequency / 2  
`count` to desired duration / <span class="emphasis">*period*</span>.

</div>
