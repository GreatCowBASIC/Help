<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="_47xxx_eeram_devices"></span>47xxx EERam Devices

</div>

</div>

</div>

This section covers the 47xxx EERam devices.

The 47xxx EERam device is a memory device is organized as 512 x 8 bits
or 2,048 x 8 bits of memory and utilizes the I2C serial interface.

The 47xxx provides infinite read and write cycles to the SRAM while
EEPROM cells provide high-endurance nonvolatile storage of data with
more than one million store cycles to EEPROM & a Data retention of &gt;
200 years.

With an external capacitor (\~10uF), SRAM data is automatically
transferred to the EEPROM upon loss of power, giving the advantages of
NVRAM whilst eliminating the need for backup batteries.

Data can also be backed up manually by using either the Hardware Store
pin (HS) or software control.

On power-up, the EEPROM data is automatically recalled to the SRAM.
EEPROM data Recall can also be initiated through software control.

Connectivity is shown below:

``` screen
            __ __
    Vcap-->|  U  |<-- Vcc
     A1 -->|     |<-- HS
     A2 -->|     |<-> SCL
    Vss -->|_____|<-> SDA
```

<span class="strong">**Modes of Operation**</span>

The SRAM allows for fast reads and writes and unlimited endurance. As
long as power is present, the data stored in the SRAM can be updated as
often as desired.

To preserve the SRAM image, the AutoStore function copies the entire
SRAM image to an EEPROM array whenever it detects that the voltage drops
below a predetermined level. The power for the AutoStore process is
provided by the externally connected VCAP capacitor. Upon power-up, the
entire memory contents are restored by copying the EEPROM image to the
SRAM. This automatic restore operation is completed in milliseconds
after power-up, at the same time as when other devices would be
initializing.

There is no latency in writing to the SRAM. The SRAM can be written to
starting at any random address, and can be written continuously
throughout the array, wrapping back to the beginning after the end is
reached. There is a small delay, specified as TWC in the data sheet,
when writing to the nonvolatile configuration bits of the STATUS
Register (SR).

Besides the AutoStore function, there are two other methods to store the
SRAM data to EEPROM:

• One method is the Hardware Store, initiated by a rising edge on the HS
pin.

• The other method is the Software Store, initiated by writing the
correct instruction to the command register via I2C.

<sub>The\_paragraph\_above\_is\_copyright\_Microchip:\_AN2047</sub>  

<span class="strong">**Explanation**</span>

The GCBASIC constants and commands shown below control the configuration
of the 47xxx EE-RAM device.    GCBASIC supports I2C hardware and
software connectivity - this is shown in the tables below.

To use the 47xxx driver simply include the following in your user code.
This will initialise the driver.

``` screen
    #include <47xxx_EERAM.H>

    ; ----- Define Hardware settings for EERAM Module
    #define I2C_Adr_EERAM 0x30      ; EERAM base Address
    #define EERAM_HS PortB.1        ; Optional hardware Store Pin

    Dir EERAM_HS Out                ; Rising edge initiates Backup

    EERAM_AutoStore(ON)             ; Enable Automatic Storage on power loss


    'EERAM_AutoStore(OFF)           ; Disable Automatic Storage on power loss
```

The device parameters for the device are shown in the table below.

<div class="informaltable">

| <span class="strong">**Part Number**</span> | <span class="strong">**Density (bits)**</span> | <span class="strong">**VCC Range**</span> | <span class="strong">**Max. I2C Frequency**</span> | <span class="strong">**Tstore Delay**</span> | <span class="strong">**Trecall Delay**</span> |
|:--------------------------------------------|:-----------------------------------------------|:------------------------------------------|:---------------------------------------------------|:---------------------------------------------|:----------------------------------------------|
| 47L04                                       | 4K                                             | 2.7-3.6V                                  | 1 MHz                                              | 8ms                                          | 25ms                                          |
| 47C04                                       | 4K                                             | 4.5-5.5V                                  | 1 MHz                                              | 8ms                                          | 2ms                                           |
| 47L16                                       | 16K                                            | 2.7-3.6V                                  | 1 MHz                                              | 25ms                                         | 5ms                                           |
| 47C16                                       | 16K                                            | 4.5-5.5V                                  | 1 MHz                                              | 25ms                                         | 5ms                                           |

</div>

The GCBASIC constants for control of the device are:

<div class="informaltable">

| <span class="strong">**Constant**</span> | <span class="strong">**Context**</span> | <span class="strong">**Example**</span> | <span class="strong">**Default**</span> |
|:-----------------------------------------|:----------------------------------------|:----------------------------------------|:----------------------------------------|
| EERAM\_I2C\_Adr                          | 8-bit I2C Address of device             | \#define I2C\_Adr\_EERAM 0x30           | Default is 0x30. This is mandated       |
| EERAM\_HS                                | Optional hardware Store Pin             | \#define EERAM\_HS portb.1              | No default - this is not mandated       |
| EERAM\_Tstore                            | Delay period for write to device        | \#define EERAM\_Tstore 25               | 25 (ms)                                 |
| EERAM\_Trecall                           | Delay period to read from device        | \#define EERAM\_Trecall 5               | 5 (ms)                                  |

</div>

The GCBASIC commands for control of the device are:

<div class="informaltable">

| <span class="strong">**Command**</span> | <span class="strong">**Context**</span>                                                                                | <span class="strong">**Example**</span>                  |
|:----------------------------------------|:-----------------------------------------------------------------------------------------------------------------------|:---------------------------------------------------------|
| EERAM\_AutoStore                        | Enable Automatic Storage on power loss or Disable Automatic Storage on power loss                                      | EERAM\_AutoStore(ON), or EERAM\_AutoStore(OFF)           |
| EERAM\_Status                           | Read the Status Register                                                                                               | User\_byte\_variable = EERAM\_Status()                   |
| EERAM\_Backup                           | Backup / Store Now                                                                                                     | EERAM\_Backup()                                          |
| EERAM\_Recall                           | Restore Now                                                                                                            | EERAM\_Recall()                                          |
| EERAM\_HWStore                          | Force Backup with HS Pin                                                                                               | EERAM\_HWStore()                                         |
| EERAM\_Write                            | Write a Byte of Data to address at the specified address. The address must be a word value and the data is byte value. | ERAM\_Write( EERAM\_Address\_word, EERAM\_Data\_byte)    |
| EERAM\_Read                             | Read a Byte of Data from address. The address must be a word value and returned data is byte value.                    | User\_byte\_variable = EERAM\_Read(EERAM\_Address\_word) |

</div>

This example shows how to use the device.

<span class="strong">**Example:**</span>

``` screen
    #CHIP 16F18855,32
    #OPTION EXPLICIT

    #INCLUDE <47XXX_EERAM.H>

    #startup InitPPS, 85

    Sub InitPPS
          'PPS is explicit to a specific chip.  Use PPSTool to ensure the PPS settings are correct.

          'Module: EUSART
              RC0PPS = 0x0010 'TX > RC0
              TXPPS  = 0x0008 'RC0 > TX (bi-directional)
          'Module: MSSP1
              SSP1DATPPS = 0x0013 'RC3 > SDA1
              RC3PPS = 0x0015 'SDA1 > RC3 (bi-directional)
              RC4PPS = 0x0014 'SCL1 > RC4
              SSP1CLKPPS = 0x0014 'RC4 > SCL1 (bi-directional)

        End Sub

    ; ----- Define Hardware Serial Print

    #DEFINE USART_BAUD_RATE 115200
    #DEFINE USART_TX_BLOCKING

    ; ----- Define Hardware settings for hwi2c

    #DEFINE HI2C_BAUD_RATE 400
    #DEFINE HI2C_DATA  PORTC.3
    #DEFINE HI2C_CLOCK PORTC.4

    'I2C pins need to be input for legacy I2C modules
    DIR HI2C_DATA  IN
    DIR HI2C_CLOCK IN

    'Initialise I2C Master
    hi2cMode Master

    ; ----- Define Hardware settings for EERAM Module

    #define EERAM_I2C_Adr 0x30      ; EERAM base Address
    #define EERAM_HS PortB.1        ; Optional hardware Store Pin

    Dir EERAM_HS Out                ; Rising edge initiates Backup

    'Library function
    EERAM_AutoStore(ON)             ; Enable Automatic Storage on power loss

    ; ----- Main body of program commences here.

    dim Idx as Byte

    HserPrintCRLF 2

    HserPrint "Hardware I2C EERAM Read Test at I2C Adr 0x"
    HserPrint  Hex(EERAM_I2C_Adr)
    HserPrint  " Reading RAM addresses 0x0 to 0xF" : HserPrintCRLF 2

    for Idx = 0x0 to 0xF

      HserPrint hex(Idx) + " = " : HserPrint Hex(EERAM_Read(Idx))
      If Idx = 7 or Idx = 0xf then
        HserPrintCRLF
      Else
        HserPrint " : "
      End if

    next

    HserPrintCRLF : HserPrint "Control Byte = " Hex(EERAM_Status()) : HserPrintCRLF 2

    wait 100 ms                     ; time for serial operations to complete
    end
```

<span class="strong">**For more help, see**</span>
<a href="_i2c_overview.html" class="link" title="I2C Overview">Software I2C</a>
or
<a href="_hi2c_overview.html" class="link" title="HI2C Overview">Hardware I2C</a>

</div>
