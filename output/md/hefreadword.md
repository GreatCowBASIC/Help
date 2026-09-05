<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="hefreadword"></span>HEFReadWord

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    'as a subroutine
    HEFReadWord ( location, data_word_variable )

    'as a function
    data_word_variable = HEFReadWord ( location )
```

<span class="strong">**Command Availability:**</span>

Available on all PIC micro-controllers with HEFM memory

<span class="strong">**Explanation:**</span>  
  
HEFReadWord is used to read information, word values, from HEFM so that
it can be accessed for use in a user program.  
  
`location` rerepresents the location or relative address to read. The
location will range from location 0 to HEF\_BYTES - 1, or for all
practical purposes 0-127 since all PIC Microcontrollers with HEF support
128 bytes of HEF Memory. HEF\_BYTES is a GCBASIC constant that
represents the number of bytes of HEF Memory.     
  
`data` is the data that is to be read from the HEFM data storage.   
This must be a word variable.     
  
This method reads data from HEFM given the specific relative
location.     
  
<span class="strong">**Example 1:**</span>

``` programlisting
    '... code preamble to select part
    '... code to setup serial

    'The following example reads the HEFM value into the word variable “data_word_variable” by initially writing some word values.

    dim data_word_variable as word
    HEFWriteWord( 254, 4660 )

    HEFReadWord( 254, data_word_variable )          ' <<< the HEFReadWord instruction (subroutine form)

    HSerPrint "Value = "
    HSerPrint data_word_variable
    HSerPrintCRLF
```

  
If example 1 were displayed on a serial terminal.   The result would
show:

``` programlisting
    Value = 4660
```

<span class="strong">**Key line:**</span>
`HEFReadWord( 254, data_word_variable )` — reads the word back from HEFM
location 254 using the subroutine form, storing the result directly into
`data_word_variable`.

  
  
<span class="strong">**Example 2:**</span>

``` programlisting
    '... code preamble to select part
    '... code to setup serial

    'The following example uses a function to read the HEFM value into the word variable “data_word_variable”.

    dim data_word_variable as word
    HEFWriteWord( 254, 17185 )

    data_word_variable = HEFReadWord( 254 )          ' <<< the HEFReadWord instruction (function form)

    HSerPrint "Value = "
    HSerPrint data_word_variable
    HSerPrintCRLF
```

  
If example 2 were displayed on a serial terminal.   The result would
show:

``` programlisting
    Value = 17185
```

<span class="strong">**Key line:**</span>
`data_word_variable = HEFReadWord( 254 )` — reads the word back from
HEFM location 254 using the function form, assigning the result to
`data_word_variable`.

  
  
<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="hefm_overview" class="link" title="HEFM Overview">HEFM Overview</a>
-   <a href="hefread" class="link" title="HEFRead">HEFRead</a>
-   <a href="hefreadword" class="link" title="HEFReadWord">HEFReadWord</a>
-   <a href="hefwrite" class="link" title="HEFWrite">HEFWrite</a>
-   <a href="hefwriteword" class="link" title="HEFWriteWord">HEFWriteWord</a>
-   <a href="hefreadblock" class="link" title="HEFReadBlock">HEFReadBlock</a>
-   <a href="hefwriteblock" class="link" title="HEFWriteBlock">HEFWriteBlock</a>
-   <a href="heferaseblock" class="link" title="HEFEraseBlock">HEFEraseBlock</a>

</div>

</div>
