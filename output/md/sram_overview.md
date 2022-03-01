<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="sram_overview"></span>SRAM Overview

</div>

</div>

</div>

<span class="strong">**Introduction:**</span>

Serial SRAM is a standalone volatile memory that provides an easy and
inexpensive way to add more RAM to application.  These are 8-pin
low-power devices.   They are high-performance devices have unlimited
endurance and zero write times, making them ideal for applications
involving continuous data transfer, buffering, data logging, audio,
video, internet, graphics and other math and data-intensive functions.  

These devices are available from 64 Kbit up to 1 Mbit in density and
support SPI, SDI and SQI™ bus modes.  

The Great Cow BASIC library only supports SPI bus mode.   The Great Cow
BASIC library supports hardware and software SPI - this is controlled
via a constant, see below.

To use the SRAM libray simply include the following in your user code.  

This will initialise the driver.  

``` screen
    #define SPISRAM_CS      Porta.2      'Also known as SS, or Slave Select
    #define SPISRAM_SCK     Portc.3      'Also known as CLK
    #define SPISRAM_DO      Portc.5      'Also known as MOSI
    #define SPISRAM_DI      Portc.4      'Also known as MISO

    #define SPISRAM_HARDWARESPI
    #define SPISRAM_TYPE     SRAM_23LC1024
```

SRAM memory operations.   

  
  
The library exposes a set of method to support use of SRAM memory.  
  

<div class="informaltable">

|           |                                    |                                                                                                                     |
|:----------|:-----------------------------------|:--------------------------------------------------------------------------------------------------------------------|
| Method    | Parameters                         | Usage                                                                                                               |
| SRAMWrite | eepAddr as long, eepromVal as byte | A subroutine that required the address and the value to be written to SRAM.                                         |
| SRAMRead  | eepAddr as long, eepromVal as byte | A subroutine that required the address and variable to updated with the byte value from the specified SRAM address. |
| SRAMRead  | eepAddr as long                    | A function that required the address. The function returns a byte value from the specified SRAM address.            |

</div>

  
  
The library requires a set of constants to support use of SRAM memory.  
  

<div class="informaltable">

<table data-border="1" width="80%">
<tbody>
<tr class="odd">
<td style="text-align: left;"><p>Constant</p></td>
<td style="text-align: left;"><p>Parameters</p></td>
<td style="text-align: left;"><p>Usage</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>SPISRAM_TYPE</p></td>
<td style="text-align: left;"><p>Specifies the type of SRAM.</p></td>
<td style="text-align: left;"><p>Requires one of the following constants</p>
<p>SRAM_23LC1024,<br />
SRAM_23LCV1024,<br />
SRAM_23LC1024,<br />
SRAM_23A1024,<br />
SRAM_23LCV512,<br />
SRAM_23LC512,<br />
SRAM_23A512,<br />
SRAM_23K256,<br />
SRAM_23A256,<br />
SRAM_23A640, or<br />
SRAM_23K640</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>SPISRAM_CS</p></td>
<td style="text-align: left;"><p>Specifies the port for the chip select port.</p></td>
<td style="text-align: left;"><p>Required</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>SPISRAM_SCK</p></td>
<td style="text-align: left;"><p>Specifies the port for the SPI clock port.</p></td>
<td style="text-align: left;"><p>Required</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>SPISRAM_DO</p></td>
<td style="text-align: left;"><p>Specifies the port for the SPI data out, or MOSI, port.</p></td>
<td style="text-align: left;"><p>Required</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>SPISRAM_DI</p></td>
<td style="text-align: left;"><p>Specifies the port for the data in, or MISO, port.</p></td>
<td style="text-align: left;"><p>Required</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>HWSPIMode</p></td>
<td style="text-align: left;"><p>Specifies the speed of the SPI communications for Hardware SPI only.</p></td>
<td style="text-align: left;"><p>Optional defaults to MASTERFAST.</p>
<p>Options are MASTERSLOW,<br />
MASTER,<br />
MASTERFAST, or<br />
MASTERULTRAFAST for specific AVRs only.</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>SPISRAM_HARDWARESPI</p></td>
<td style="text-align: left;"><p>Instructs the library to use hardware SPI, remove or comment out if you want to use software SPI.</p></td>
<td style="text-align: left;"><p>Optional</p></td>
</tr>
</tbody>
</table>

</div>

  
  
The library also exposes a constant that is specific to the device.   

These may be useful in the user program.   

This constant is used by the library.   

A user may use this public constant.  
  

<div class="informaltable">

|                   |            |                                              |
|:------------------|:-----------|:---------------------------------------------|
| Constant          | Type       | Usage                                        |
| SPISRAM\_CAPACITY | Long value | Use to determine the size of the SRAM device |

</div>

<span class="strong">**Examples**</span>

``` screen
    #include <uno_mega328p.h>
    #option explicit

   ' USART settings
    #define USART_BAUD_RATE 57600
    #define USART_DELAY 0 ms
    #define USART_BLOCKING
    #define USART_TX_BLOCKING


    'SD card attached to SPI bus as follows:
    '
    'UNO:    MOSI - pin 11, MISO - pin 12, CLK - pin 13, CS - pin 4 (CS pin can be changed) and pin #10 (SS) must be an output
    'Mega:   MOSI - pin 51, MISO - pin 50, CLK - pin 52, CS - pin 4 (CS pin can be changed) and pin #52 (SS) must be an output
    'Leonardo: Connect to hardware SPI via the ICSP header

    #define SPISRAM_CS      DIGITAL_5     'Also known as SS, or Slave Select
    #define SPISRAM_SCK      DIGITAL_13    'Also known as CLK
    #define SPISRAM_DO      DIGITAL_11    'Also known as MOSI
    #define SPISRAM_DI      DIGITAL_12    'Also known as MISO

    #define SPISRAM_HARDWARESPI
    #define SPISRAM_TYPE     SRAM_23LC1024

    #define HWSPIMode MASTERULTRAFAST       'MASTERSLOW | MASTER | MASTERFAST | MASTERULTRAFAST for specific AVRs only. Defaults to MASTERFAST


  '********************************************************************************

  'Main program

    'Wait 2 seconds to open the serial terminal
    wait 2 s

    HSerPrintCRLF 2
    HSerPrint "Writing..."
    HSerPrintCRLF
    For SRAM_location=0 to SPISRAM_CAPACITY - 1
     SRAMWrite ( [long]SRAM_location, SRAM_location and 255 )
    Next


    dim spirambyteread as Byte
    spirambyteread = 11
    HSerPrintCRLF 2
    dim SRAM_location as long
    HSerPrint "Reading..."
    HSerPrintCRLF
    For SRAM_location=0 to SPISRAM_CAPACITY - 1
     'choose one....
     'SRAMread ( SRAM_location, spirambyteread )
    'or, as a function
     spirambyteread = SRAMread ( SRAM_location )

     if spirambyteread = ( SRAM_location and 255 ) then
       HSerPrint hex(spirambyteread)
     else
       HSerPrint "**"
     end if
     HSerPrint ":"
    Next
    HSerPrintCRLF
    HSerPrint "Wait..."
    HSerPrintCRLF
    Wait 2 s

    HSerPrint "Rewriting to 0x00 ..."
    HSerPrintCRLF
    For SRAM_location=0 to SPISRAM_CAPACITY - 1
     SRAMWrite ( [long]SRAM_location, 0 )
    Next

    Dim errorcount as long
    errorcount = 0
    For SRAM_location=0 to SPISRAM_CAPACITY - 1
     SRAMRead ( SRAM_location, spirambyteread )
     if spirambyteread <> 0 then
       errorcount++
     end if
    Next
    HSerPrint "Error Count (should be 0) = "
    HSerPrint errorcount
    HSerPrintCRLF
    HSerPrint "End..."
    HSerPrintCRLF
    end
```

or, for a PIC with PPS

``` screen
    'Chip Settings.
   #chip 18F47k42, 64
   #config MCLRE = ON
   #option explicit


   'PPS Tool version: 0.0.5.27
   'PinManager data: v1.78
   'Generated for 18F47K42
   '
   'Template comment at the start of the config file
   '
   #startup InitPPS, 85
   #define PPSToolPart 18F47K42

   Sub InitPPS
      'This has been added to turn off PPS SPI when in SPI software mode
       #ifdef SPISRAM_HARDWARESPI
         'Module: SPI1
         RC3PPS = 0x001E  'SCK1 > RC3
         SPI1SCKPPS = 0x0013  'RC3 > SCK1 (bi-directional)
         RC5PPS = 0x001F  'SDO1 > RC5
         SPI1SDIPPS = 0x0014  'RC4 > SDI1
         'Module: UART pin directions
       #endif
       'Module: UART pin directions
       Dir PORTC.6 Out  ' Make TX1 pin an output
       'Module: UART1
       RC6PPS = 0x0013  'TX1 > RC6
   End Sub
   'Template comment at the end of the config file


   ' USART settings
   #define USART_BAUD_RATE 57600
   #define USART_DELAY 0 ms
   #define USART_BLOCKING
   #define USART_TX_BLOCKING

   #define SPISRAM_CS      Porta.2      'Also known as SS, or Slave Select
   #define SPISRAM_SCK      Portc.3      'Also known as CLK
   #define SPISRAM_DO      Portc.5      'Also known as MOSI
   #define SPISRAM_DI      Portc.4      'Also known as MISO

   #define SPISRAM_HARDWARESPI
   #define SPISRAM_TYPE     SRAM_23LC1024

   '********************************************************************************

   'Main program

   'Wait 2 seconds to open the serial terminal
   wait 2 s
   dim sizeofSPIRAM as long
   sizeofSPIRAM = SPISRAM_CAPACITY
   HSerPrintCRLF 2
   HSerPrint "Writing...SPISRAM_CAPACITY = 0x"
   HSerPrint hex(sizeofSPIRAM_U)
   HSerPrint hex(sizeofSPIRAM_H)
   HSerPrint hex(sizeofSPIRAM)
   HSerPrintCRLF
   wait 100 ms

   dim SRAM_location as long
   For SRAM_location=0 to SPISRAM_CAPACITY - 1
    SRAMWrite ( [long]SRAM_location, SRAM_location and 255 )
   Next


   dim spirambyteread as Byte
   spirambyteread = 11 'could be any number....
   HSerPrintCRLF 2

   HSerPrint "Reading..."
   HSerPrintCRLF
   For SRAM_location=0 to SPISRAM_CAPACITY - 1
    'choose one....
    'SRAMRead ( SRAM_location, spirambyteread )
   'or, as a function
    spirambyteread = SRAMRead ( SRAM_location )

    if spirambyteread = ( SRAM_location and 255 ) then
      HSerPrint hex(spirambyteread)
    else
      HSerPrint "**"
    end if
    HSerPrint ":"
   Next
   HSerPrintCRLF
   HSerPrint "Wait..."
   HSerPrintCRLF
   Wait 2 s

   HSerPrint "Rewriting to 0x00 ..."
   HSerPrintCRLF
   For SRAM_location=0 to SPISRAM_CAPACITY - 1
    SRAMWrite ( [long]SRAM_location, 0 )
   Next

   Dim errorcount as long
   errorcount = 0
   For SRAM_location=0 to SPISRAM_CAPACITY - 1
    SRAMRead ( SRAM_location, spirambyteread )
    if spirambyteread <> 0 then
      errorcount++
    end if
   Next
   HSerPrint "Error Count (should be 0) = "
   HSerPrint errorcount
   HSerPrintCRLF
   HSerPrint "End..."
   HSerPrintCRLF

   do

   loop
```

<span class="strong">**For more help, see
<a href="sramread" class="link" title="SRAMRead">SRAMRead</a> or
<a href="sramwrite" class="link" title="SRAMWrite">SRAMWrite</a>**</span>

</div>
