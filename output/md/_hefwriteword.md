<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="_hefwriteword"></span>HEFWriteWord

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    HEFWriteWord ( location, data_word_value )
```

<span class="strong">**Command Availability:**</span>

Available on all PIC micro-controllers with HEFM memory

<span class="strong">**Explanation:**</span>  
  
HEFWriteWord is used to write information, word values, to HEFM, so that
it can be accessed in a user program via the HEFReadWord command.  
  
`location` presents the location or relative address to write write. A
data Word requires 2 HEF Locations, therefore the location will range
from 0 to 126 in steps of 2.  
  
`data` is the data that is to be written to the HEFM location.   This
can be a word value or a word variable.  
  
This method writes information to the HEFM given the specific location
in the HEFM data storage . This method is similar to the methods for
EEPROM but this method supports Word values.  
  

<span class="strong">**Example 1:**</span>

``` screen
    '... code preamble to select part
    '... code to setup serial

    'The following example stores a word value in HEFM location 0

    HEFWrite( 0, 0x1234)
```

  
  
<span class="strong">**Example 2:**</span>

``` screen
    '... code preamble to select part
    '... code to setup serial

    'This example will write two word values to two specific locations.
    HEFWriteWord (16, 0xAA01)
    HEFWriteWord (18, 0xBB02)
```

  
  
If example 2 were displayed on a serial terminal.   The result would
show, where `--` is the existing value.

``` screen
    Block0
    3F00   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    3F10   01 AA 02 BB -- -- -- -- -- -- -- -- -- -- -- --
    3F20   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    3F30   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
```

  
  
See also
<a href="_hefm_overview.html" class="link" title="HEFM Overview">HEFM Overview</a>,
<a href="_hefread.html" class="link" title="HEFRead">HEFRead</a>,
<a href="_hefreadword.html" class="link" title="HEFReadWord">HEFReadWord</a>,
<a href="_hefwrite.html" class="link" title="HEFWrite">HEFWrite</a>,
<a href="_hefwriteword.html" class="link" title="HEFWriteWord">HEFWriteWord</a>,
<a href="_hefreadblock.html" class="link" title="HEFReadBlock">HEFReadBlock</a>,
<a href="_hefwriteblock.html" class="link" title="HEFWriteBlock">HEFWriteBlock</a>,
<a href="_heferaseblock.html" class="link" title="HEFEraseBlock">HEFEraseBlock</a>

</div>
