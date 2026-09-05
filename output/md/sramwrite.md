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

`SRAMWrite` is the method used to write information to the attached
serial SRAM chip, so that it can be accessed later with the `SRAMRead`
command.

`location` represents the address to write to, and this will vary from
one application/solution to another.

`data` is the data to be written to the SRAM: a byte value or a byte
variable.

<span class="strong">**Example:**</span>

``` programlisting
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
  out_byte = 0x55

  'Write out_byte to SRAM location 0x10
  SRAMWrite ( 0x10, out_byte )          ' <<< the SRAMWrite instruction
```

<span class="strong">**Key line:**</span>
`SRAMWrite ( 0x10, out_byte )` — writes the value in `out_byte` to SRAM
address `0x10`, ready to be read back with `SRAMRead ( 0x10, in_byte )`.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="sram_overview" class="link" title="SRAM Overview">SRAM Overview</a>
-   <a href="sramread" class="link" title="SRAMRead">SRAMRead</a>

</div>

</div>
