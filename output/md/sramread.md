<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="sramread"></span>SRAMRead

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    SRAMRead location, store

    or

    store = SRAMRead location
```

<span class="strong">**Command Availability:**</span>

Available on all Microchip PIC and Atmel AVR microcontrollers with SRAM
data memory attached.

<span class="strong">**Explanation:**</span>

`SRAMRead` is the method, a function or a subroutine, used to read
information from the SRAM data storage.

`location` represents the location to read data from.

`store` is the variable in which to store the data after it has been
read from SRAM.

<span class="strong">**Example:**</span>

``` screen
    #include <uno_mega328p.h>
    #option explicit

    'Set up SRAM
    #define SPISRAM_CS      DIGITAL_5     'Also known as SS, or Slave Select
    #define SPISRAM_SCK     DIGITAL_13    'Also known as CLK
    #define SPISRAM_DO      DIGITAL_11    'Also known as MOSI
    #define SPISRAM_DI      DIGITAL_12    'Also known as MISO

    #define SPISRAM_HARDWARESPI
    #define SPISRAM_TYPE     SRAM_23LC1024

  '********************************************************************************

  'Main program

  dim in_byte as byte

  'Using a function:  Read from SRAM location 0x10 and place the results in the variable in_byte
  in_byte = SRAMRead ( 0x10 )

  'Using a subroutine:  Read from SRAM location 0x10 and place the results in the variable in_byte
  SRAMRead ( 0x10, in_byte )
```

<span class="strong">**For more help, see
<a href="sram_overview" class="link" title="SRAM Overview">SRAM Overview</a>
or
<a href="sramwrite" class="link" title="SRAMWrite">SRAMWrite</a>**</span>

</div>
