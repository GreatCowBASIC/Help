<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="hefm_overview"></span>HEFM Overview

</div>

</div>

</div>

<span class="strong">**Introduction:**</span>

Some enhanced mid-range Microchip PIC devices support High-Endurance
Flash (HEF) memory. These devices lack the data EEPROM found on other
devices.    Instead, they implement an equivalent amount of special
flash memory, called HEF memory, that can provide an endurance
comparable to that of a traditional data EEPROM.    HEF memory can be
erased and written 100,000 times.    HEF memory appears in the regular
program memory space and can be used for any purpose, like regular flash
program memory.     
  
As with all flash memory, data must be erased before it can be written
and writing this memory will stall the device.    Methods to read, write
and erase the HEF memory are included in GCBASIC and they are described
in this introduction.   Also see Microchip application note AN1673,
Using the PIC16F1XXX High-Endurance Flash (HEF) Block.  
  
The `hefsaf.h` library supports HEF operations for GCBASIC.  
  
Note: By default, GCBASIC will use HEF memory for regular executable
code unless it is told otherwise.    If you wish to store data here, you
should reserve the HEF memory by using the compiler option, as shown
below to reserve 128 words of HEF memory:

``` screen
    #option ReserveHighProg 128
```

HEF memory is a block of memory locations found at the top of the flash
program memory.     Each memory location can be used to hold a 8-bit
byte value.     To further explain, the PIC 16F Enhanced Midrange
Sevices memory architecture is 14-bits wide.     Therefore, for a single
14-bit memory location it is only practical to store an 8-bit byte
value, and two 14-bit memory locations to hold one 16-bit word value.
    This is because the memory architecture only allows the use of the
the lower 8-bits of each 14-bit flash memory location for HEF usage  
  
The main difference between HEF memory and EEPROM is that EEPROM allows
byte-by-byte erase whereas the HEF memory does not.    With HEF memory,
data must be erased before a write and the erase can only be performed
in blocks of memory.    The blocks, also called rows, are a fixed size
associated with the specific device.     
  
GCBASIC handles the erase operation automatically.    When a write
operation is used by a user the GCBASIC library reads to a cache,
updates the cache, erase the block and finally write the caches.    The
complexity of using HEF memory is reduced with the automatically
handling of these operations.   

  
  
The `hefsaf.h` library provides a set of methods to support the use of
HEF memory.  
  

<div class="informaltable">

<table data-border="1" width="80%">
<tbody>
<tr class="odd">
<td style="text-align: left;"><p>Method</p></td>
<td style="text-align: left;"><p>Parameters</p></td>
<td style="text-align: left;"><p>Usage</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">HEFWrite</code></p></td>
<td style="text-align: left;"><p>a subroutine with the parameters: location, byte value</p></td>
<td style="text-align: left;"><p>HEFWrite ( location, byte_variable )</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">HEFWriteWord</code></p></td>
<td style="text-align: left;"><p>a subroutine with the parameters: location, word_value</p></td>
<td style="text-align: left;"><p>HEFWriteWord ( location, word_variable )</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">HEFRead</code></p></td>
<td style="text-align: left;"><p>a function with the parameters: location returns a byte value</p></td>
<td style="text-align: left;"><p>byte_variable = HEFRead ( location )</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">HEFRead</code></p></td>
<td style="text-align: left;"><p>a subroutine with the paramers: location, byte_value</p></td>
<td style="text-align: left;"><p>HEFRead ( location , out_byte_variable )</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">HEFReadWord</code></p></td>
<td style="text-align: left;"><p>a function with the parameters: location returns a word value</p></td>
<td style="text-align: left;"><p>word_variable = HEFRead ( location )</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">HEFReadWord</code></p></td>
<td style="text-align: left;"><p>a subroutine with the parameters: location, word_value</p></td>
<td style="text-align: left;"><p>HEFRead ( location , out_word_variable )</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">HEFEraseBlock</code></p></td>
<td style="text-align: left;"><p>a subroutine with the parameters: block_number</p></td>
<td style="text-align: left;"><p>HEFEraseBlock ( 0 )<br />
<br />
A value of 0,1,2,3 etc.</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">HEFWriteBlock</code></p></td>
<td style="text-align: left;"><p>a subroutine with the parameters: block_number, buffer() [, HEF_ROWSIZE_BYTES ]</p></td>
<td style="text-align: left;"><p>HEFWriteBlock( 0, myMemoryBuffer ) 'where myMemoryBuffer is an Array or a String<br />
<br />
The Array or a String will contain the values to be wrttin to the HEFM.</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">HEFReadBlock</code></p></td>
<td style="text-align: left;"><p>a subroutine with the parameters: block_number, buffer() [, HEF_ROWSIZE_BYTES ]</p></td>
<td style="text-align: left;"><p>HEFReadBlock( 0, myMemoryBuffer ) 'where myMemoryBuffer is an Array or a String.<br />
<br />
The Array or a String will contain the values from the HEFM.</p></td>
</tr>
</tbody>
</table>

</div>

  
  
The library also defines a set constants that are specific to the
device.    These may be useful in the user program.    These constants
are used by the library.    A user may use these public constants.  
  

<div class="informaltable">

|                             |                |                                                                 |
|:----------------------------|:---------------|:----------------------------------------------------------------|
| Constant                    | Type           | Usage                                                           |
| `HEF_ROWSIZE_BYTES`         | Byte           | Size of an HEFM block in words                                  |
| `HEF_WORDS` and `HEF_BYTES` | Word or a Byte | ChipHEFMemWords parameter from the device .dat file             |
| `HEF_START_ADDR`            | Word           | Starting address of HEFM                                        |
| `HEF_NUM_BLOCKS`            | Byte           | Number of blocks of HEFM                                        |
| `CHIPWORDS`                 | Word           | Device specific constant for the total flash size               |
| `CHIPHEFMEMWORDS`           | Word           | Device specific constant for the number of HEFM words available |
| `CHIPERASEROWSIZEWORDS`     | Word           | Device specific constant for the number of HEFM in an erase row |

</div>

  
  

  
  

<span class="strong">**Warning**</span>

Whenever you update the hex file of your Microchip PIC micro-controller
with your programmer you MAY erase the data that are stored in HEF
memory.    If you want to avoid that you will have to flash your
Microchip PIC micro-controller with software that allows memory
exclusion when flashing.    This is the case with Microchip PIC MPLAB
IPE (Go to
`Advanced Mode/Enter password/Select Memory/Tick “Preserve Flash on Program”/ Enter Start and End address`
of your HEFM).   Or, simply use the PICkitPlus suite of software to
preserve HEF memory during programming.  
  
See also
<a href="hefread" class="link" title="HEFRead">HEFRead</a>,
<a href="hefreadword" class="link" title="HEFReadWord">HEFReadWord</a>,
<a href="hefwrite" class="link" title="HEFWrite">HEFWrite</a>,
<a href="hefwriteword" class="link" title="HEFWriteWord">HEFWriteWord</a>,
<a href="hefreadblock" class="link" title="HEFReadBlock">HEFReadBlock</a>,
<a href="hefwriteblock" class="link" title="HEFWriteBlock">HEFWriteBlock</a>,
<a href="heferaseblock" class="link" title="HEFEraseBlock">HEFEraseBlock</a>

</div>
