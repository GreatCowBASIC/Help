<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="rs232_software_overview_optimised"></span>RS232 Software Overview - Optimised

</div>

</div>

</div>

<span class="strong">**Introduction:**</span>

These routines allow the microcontroller to send and receive RS232 data.

SoftSerial is a library for the GCBASIC compiler and works on AVR and
PIC microcontrollers. These routines allow the microcontroller to send
and receive RS232 data. All functions are implemented using software, so
no special hardware is required on the microcontroller. SoftSerial uses
ASM routines for minimal overhead. If the microcontroller has a hardware
serial module (usually referred to as UART or USART) the hardware
routines can be used too.

<span class="strong">**Features**</span>

<div class="itemizedlist">

-   3 independent channels Ser1…​ , Ser2…​ , Ser3…​

-   I/O pins user configurable

-   polarity can be inverted

-   freely adjustable baud rate

-   maximum baudrate depends on MCU speed

    <div class="itemizedlist">

    -   PIC@ 1Mhz 9600 baud
    -   PIC@ 4Mhz 38400 baud
    -   PIC@ 8Mhz 64000 baud
    -   PIC@16Mhz 128000 baud
    -   AVR@ 1Mhz 28800 baud
    -   AVR@ 8Mhz 115200 baud
    -   AVR@16Mhz 460800 baud

    </div>

-   5 - 8 data bits

-   1 or 2 stop bits

-   parity bit not supported

</div>

<span class="strong">**Relevant Constants:**</span>

These constants are used to control settings for the RS232 serial
communication routines. To set them, place a line in the main program
file that uses `#define` to assign a value to the particular constant.

<div class="informaltable">

| Constant Name/s                                   | Controls                                                                                                                                                                                                                                                                                                                                                                                                  | Valid Values  | Default value                                                                     |
|:--------------------------------------------------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:--------------|:----------------------------------------------------------------------------------|
| SER1\_TXPORT, SER2\_TXPORT, SER3\_TXPORT          | These are used to define the port for sending on serial channels 1, 2 and 3 respectively. Note, that we also have to define a PortPin (see next line). It is not necessary to define this, if we want to receive only. Sample: \#define SER1\_TXPORT PortB                                                                                                                                                | PORTA - PORTx | No default defined. An appropiate constant must be defined.                       |
| SER1\_TXPIN, SER2\_TXPIN, SER3\_TXPIN             | These are used to define the pin (the corresponding bit) for sending on serial channels 1, 2 and 3 respectively. Sample: \#define SER1\_TXPIN 0                                                                                                                                                                                                                                                           | 0 - 7         | No default defined. An appropiate constant must be defined to enable the TX port. |
| SER1\_RXPORT, SER2\_RXPORT, SER3\_RXPORT          | These are used to define the port for receiving on serial channels 1, 2 and 3 respectively. Note, that we also have to define a PortPin (see next line). It is not necessary to define this, if we want to receive only. Sample: \#define SER1\_RXPORT PortA                                                                                                                                              | PORTA - PORTx | No default defined. An appropiate constant must be defined to enable the TX port. |
| SER1\_RXPIN, SER2\_RXPIN, SER3\_RXPIN             | These are used to define the pin (the corresponding bit) for receiving on serial channels 1, 2 and 3 respectively. It is not necessary to define this, if we want to send only. Sample: \#define SER1\_RXPIN 5                                                                                                                                                                                            | 0 - 7         | No default defined. An appropiate constant must be defined to enable the RX port. |
| SER1\_BAUD, SER2\_BAUD, SER3\_BAUD                | These are used to define the baudrate for sending and receiving on serial channels 1, 2 and 3 respectively. It is not necessary to define this, if we want to send only. Sample: \#define SER1\_BAUD 19200                                                                                                                                                                                                | 75 - 512000   | No default defined. An appropiate constant must be defined to enable the RX port. |
| SER1\_DATABITS, SER2\_DATABITS, SER3\_DATABITS    | These are used to define the databits for sending and receiving on serial channels 1, 2 and 3 respectively. Sample: \#define SER1\_DATABITS 7                                                                                                                                                                                                                                                             | 5 - 8         | Optional Default = 8                                                              |
| SER1\_STOPBITS, SER2\_STOPBITS, SER3\_STOPBITS    | These are used to define the stopbits for sending and receiving on serial channels 1, 2 and 3 respectively. Sample: \#define SER1\_STOPBITS 2                                                                                                                                                                                                                                                             | 1, 2          | Optional Default = 1                                                              |
| SER1\_INVERT, SER2\_INVERT, SER3\_INVERT          | These are used to define the polarity for sending and receiving on serial channels 1, 2 and 3 respectively. If it is "On", then high bits will be changed to low, and low to high. This is useful for connection to a PCs native serial port or USB-serial converters with MAX232. Sample: \#define SER1\_INVERT On                                                                                       | On, Off       | Optional Default = Off                                                            |
| SER1\_RXNOWAIT, SER2\_RXNOWAIT, SER3\_RXNOWAIT    | These are used to define, if SerNReceive waits for the startbits when receiving on serial channels 1, 2 and 3 respectively. If it is "On", then SerNReceive does not wait for the startbits edge, but directly reads the serial data. Also the time for delaying the startbit is shortened. This is useful when calling SerNReceive from an Interrupt-Service-Routine. Sample: \#define SER1\_RXNOWAIT On | On, Off       | Optional Default = Off                                                            |
| SER1\_TXDELAY, SER2\_TXDELAY, SER3\_TXDELAY       | These are used to define, if SerNSend waits for the defined milliseconds after sending a byte of serial data. This is useful when using SerNPrint or SerNSend to a serial device that needs processing time between bytes.                                                                                                                                                                                | 1..255        | Optional Default =0                                                               |
| SER1\_TXDELAYms, SER2\_TXDELAYms, SER3\_TXDELAYms | These are used to define, if SerNSend waits for the defined milliseconds after sending a byte of serial data. This is useful when using SerNPrint or SerNSend to a serial device that needs processing time between bytes. Same functionality as SERn\_TXDELAY                                                                                                                                            | 1..255        | Optional Default =0                                                               |
| SER1\_TXDELAYus, SER2\_TXDELAYus, SER3\_TXDELAYus | These are used to define, if SerNSend waits for the defined nanoseconds after sending a byte of serial data. This is useful when using SerNPrint or SerNSend to a serial device that needs processing time between bytes.                                                                                                                                                                                 | 1..255        | Optional Default =0                                                               |

</div>

</div>
