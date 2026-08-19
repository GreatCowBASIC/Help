<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="sramwrite"></span>SRAMWrite

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    SRAMWrite location, data
```

<span class="strong">**Command Availability:**</span>

Available on all Microchip PIC and Atmel AVR microcontrollers with SRAM
data memory attached.

<span class="strong">**Explanation:**</span>

`SRAMWrite` is the method used to write information to the SRAM data
storage, so that it can be accessed by the `SRAMRead` command.

`location` represents the location to read data from, and this location
will vary from one application/solution to another.

`data` is the data that is to be written to the SRAM, a byte value or a
byte variable.

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

  dim out_byte as byte

  'A subroutine:  Weite to SRAM location 0x10 and the variable out_byte
  SRAMRead ( 0x10, out_byte )
```

<span class="strong">**For more help, see
<a href="sram_overview" class="link" title="SRAM Overview">SRAMOverview</a>
or
<a href="sramread" class="link" title="SRAMRead">SRAMRead</a>**</span>

</div>
