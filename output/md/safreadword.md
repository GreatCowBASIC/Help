<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="safreadword"></span>SAFReadWord

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    'as a subroutine
    SAFReadWord ( location, data_word_variable )

    'as a function
    data_word_variable = SAFReadWord ( location )
```

<span class="strong">**Command Availability:**</span>

Available on all PIC micro-controllers with SAFM memory

<span class="strong">**Explanation:**</span>  
  
SAFReadWord is used to read information, word values, from SAFM so that
it can be accessed for use in a user program.  
  
`location` represents the location or relative address to read. The
location will range from 0 to SAF\_BYTES -1.    Each data Word requires
2 SAF Locations, therefore the location will range from either 0 to 254
or 0 to 126 (in steps of 2), depending upon the device.  
  
`data` is the word data that is to be read from the SAFM location.   
This must be a word variable.  
  
This method reads word information from SAFM given the relative location
in SAFM.     
  
<span class="strong">**Example 1:**</span>

``` screen
    '... code preamble to select part
    '... code to setup serial

    'The following example uses a subroutine to read an SAFM location into a word variable.

    dim data_word_variable as word

    ;Write a word to SAF location 64
    SAFWriteWord(  64, 0x1234 )

    ; Read the Word from SAF location 64
    SAFReadWord ( 64, data_word_variable  )

    HSerPrint "Value = "
    HSerPrint data_word_variable
    HSerPrintCRLF
```

  
If example 1 were displayed on a serial terminal.   The result would
show:

``` screen
    Value = 4660
```

  
  
<span class="strong">**Example 2:**</span>

``` screen
    '... code preamble to select part
    '... code to setup serial

    'The following example uses a function to read an SAFM location into a word variable.

    dim data_word_variable as word

    ;Write a word to SAF location 64
    SAFWriteWord(  64, 0x4321 )

    ; Read the Word from SAF location 64
    data_word_variable = SAFReadWord ( 64 )

    HSerPrint "Value = "
    HSerPrint data_word_variable
    HSerPrintCRLF
```

  
If example 2 were displayed on a serial terminal.   The result would
show:

``` screen
    Value = 17185
```

  
  
See also
<a href="safm_overview" class="link" title="SAFM Overview">SAFM Overview</a>,
<a href="safread" class="link" title="SAFRead">SAFRead</a>,
<a href="safreadword" class="link" title="SAFReadWord">SAFReadWord</a>,
<a href="safwrite" class="link" title="SAFWrite">SAFWrite</a>,
<a href="safwriteword" class="link" title="SAFWriteWord">SAFWriteWord</a>,
<a href="safreadblock" class="link" title="SAFReadBlock">SAFReadBlock</a>,
<a href="safwriteblock" class="link" title="SAFWriteBlock">SAFWriteBlock</a>,
<a href="saferaseblock" class="link" title="SAFEraseBlock">SAFEraseBlock</a>

</div>
