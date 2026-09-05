<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="safm_overview"></span>SAFM Overview

</div>

</div>

</div>

<span class="strong">**Introduction:**</span>

Some Advanced (18F) and some Enhanced Mid-Range (16F) Microchip PIC
devices support Storage Area Flash (SAF) memory. These devices also
include EEPROM memory.    SAF memory is not high endurance, meaning it
does not have an endurance of 100K write cycles.    SAF has the same
endurance as regular flash memory, usually specified as 10K write
cycles.     
  
SAF memory appears at the top of program memory space and can be used
for any purpose, like regular flash program memory.    Storage Area
Flash is intended to be used to store data, such as device calibration
data, RF device register settings, and other data. SAFM can be read as
frequently as necessary.    However, it is not intended to be written
frequently like EEPROM. If non-volatile memory needs to be written
frequently, it is best to use the EEPROM on these devices.  
  
As with all flash memory, data must be erased before it can be written,
and writing this memory will stall the device for a few ms.     Methods
to read, write, and erase the SAF memory are included in GCBASIC and are
described in this introduction.  
  
The `hefsaf.h` library supports SAF operations for GCBASIC.  
  
Note: By default, GCBASIC will use SAF memory for regular executable
code unless it is told otherwise.    If you wish to store data here, you
should reserve the SAF memory by using the compiler option, as shown
below, to reserve 128 words of SAF memory:   This equates to 256 bytes
on PIC 18F microcontrollers and 128 bytes on PIC 16F microcontrollers.

``` programlisting
    #option ReserveHighProg 128
```

SAF memory is a block of memory locations found at the top of the flash
program memory.    Each memory location can be used to hold a variable
value, either a byte or a word depending on the specific device.    The
main difference between SAF memory and EEPROM is that EEPROM allows
byte-by-byte erase, whereas SAF memory does not.    With SAF memory,
data must be erased before a write, and the erase can only be performed
in blocks of memory.    The blocks, also called rows, are a fixed size
associated with the specific device.     
  
GCBASIC handles the erase operation automatically.    When a write
operation is used, the GCBASIC library reads to a buffer, updates the
buffer, erases the block, and finally writes the buffer back to SAFM.   
The complexity of using SAF memory is reduced by the automatic handling
of these operations.     
  
The library provides a set of methods to support use of SAF memory.  
  

<div class="informaltable">

<table data-border="1" width="80%">
<tbody>
<tr class="odd">
<td style="text-align: left;"><p>Method</p></td>
<td style="text-align: left;"><p>Parameters</p></td>
<td style="text-align: left;"><p>Usage</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">SAFWrite</code></p></td>
<td style="text-align: left;"><p>a subroutine with the parameters: location, byte value</p></td>
<td style="text-align: left;"><p>SAFWrite ( location, byte_variable )</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">SAFWriteWord</code></p></td>
<td style="text-align: left;"><p>a subroutine with the parameters: location, word_value</p></td>
<td style="text-align: left;"><p>SAFWriteWord ( location, word_variable )</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">SAFRead</code></p></td>
<td style="text-align: left;"><p>a function with the parameters: location returns a byte value</p></td>
<td style="text-align: left;"><p>byte_variable = SAFRead ( location )</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">SAFRead</code></p></td>
<td style="text-align: left;"><p>a subroutine with the parameters: location, byte_value</p></td>
<td style="text-align: left;"><p>SAFRead ( location , out_byte_variable )</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">SAFReadWord</code></p></td>
<td style="text-align: left;"><p>a function with the parameters: location returns a word value</p></td>
<td style="text-align: left;"><p>word_variable = SAFRead ( location )</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">SAFReadWord</code></p></td>
<td style="text-align: left;"><p>a subroutine with the parameters: location, word_value</p></td>
<td style="text-align: left;"><p>SAFRead ( location , word_variable )</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">SAFEraseBlock</code></p></td>
<td style="text-align: left;"><p>a subroutine with the parameters: block_number</p></td>
<td style="text-align: left;"><p>SAFEraseBlock ( 0 )<br />
<br />
A value of 0, 1, 2, 3, etc.</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">SAFWriteBlock</code></p></td>
<td style="text-align: left;"><p>a subroutine with the parameters: block_number, buffer() [,num_blocks ]</p></td>
<td style="text-align: left;"><p>SAFWriteBlock( 0, myMemoryBuffer ) 'where myMemoryBuffer is an Array or a String<br />
<br />
The array or string contains the values to be written to the SAFM.</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">SAFReadBlock</code></p></td>
<td style="text-align: left;"><p>a subroutine with the parameters: block_number, buffer() [, num_blocks ]</p></td>
<td style="text-align: left;"><p>SAFReadBlock( 0, myMemoryBuffer ) 'where myMemoryBuffer is an Array or a String.<br />
<br />
The array or string contains the values read from the SAFM.</p></td>
</tr>
</tbody>
</table>

</div>

  
  
The library also defines a set of constants that are specific to the
device.    These may be useful in the user program.    These constants
are used by the library.    A user may use these public constants.  
  

<div class="informaltable">

|                             |                |                                                                 |
|:----------------------------|:---------------|:----------------------------------------------------------------|
| Constant                    | Type           | Usage                                                           |
| `SAF_ROWSIZE_BYTES`         | Byte           | Size of an SAFM block in bytes                                  |
| `SAF_WORDS` and `SAF_BYTES` | Word or a Byte | ChipSAFMemWords parameter from the device .dat file             |
| `SAF_START_ADDR`            | Word           | Starting address of SAFM                                        |
| `SAF_NUM_BLOCKS`            | Byte           | Number of blocks of SAFM                                        |
| `CHIPWORDS`                 | Word           | Device specific constant for the total flash size               |
| `CHIPSAFMEMWORDS`           | Word           | Device specific constant for the number of SAFM words available |
| `CHIPERASEROWSIZEWORDS`     | Word           | Device specific constant for the number of SAFM in an erase row |

</div>

  
<span class="strong">**Warning**</span>  
  
Whenever you update the hex file of your Microchip PIC microcontroller
with your programmer, you MAY erase the data stored in SAF memory.    If
you want to avoid that, you will have to flash your Microchip PIC
microcontroller with software that allows memory exclusion when
flashing.    This is the case with Microchip PIC MPLAB IPE (go to
`Advanced Mode/Enter password/Select Memory/Tick "Preserve Flash on Program"/ Enter Start and End address`
of your SAFM).   Or, simply use the PICkitPlus suite of software to
preserve SAF memory during programming.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="safread" class="link" title="SAFRead">SAFRead</a>
-   <a href="safreadword" class="link" title="SAFReadWord">SAFReadWord</a>
-   <a href="safwrite" class="link" title="SAFWrite">SAFWrite</a>
-   <a href="safwriteword" class="link" title="SAFWriteWord">SAFWriteWord</a>
-   <a href="safreadblock" class="link" title="SAFReadBlock">SAFReadBlock</a>
-   <a href="safwriteblock" class="link" title="SAFWriteBlock">SAFWriteBlock</a>
-   <a href="saferaseblock" class="link" title="SAFEraseBlock">SAFEraseBlock</a>
-   <a href="hefm_overview" class="link" title="HEFM Overview">HEFM Overview</a> — the
    equivalent high-endurance flash memory feature on other PIC families

</div>

</div>
