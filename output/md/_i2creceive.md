<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="_i2creceive"></span>I2CReceive

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
  I2CReceive data
  I2CReceive data, ack
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers except 12 bit instruction Microchip
PIC microcontrollers (10F, 12F5xx, 16F5xx chips)

<span class="strong">**Explanation:**</span>

The I2CReceive command will send `data` through the I2C connection. If
`ack` is TRUE, or no value is given for `ack`, then `I2CReceive` will
send an ack.

If in master mode, `I2CReceive` will read the data immediately.

If in slave mode, `I2CReceive` will wait for the master to send the data
before reading. When the method `I2CReceive` is used in Slave mode the
global variable `I2CMatch` will be set to true when the received value
is equal to the constant `I2C_ADDRESS`.

<span class="strong">**Example 1 - Master Mode:**</span>

``` screen
  ' I2C Receive - using the ChipIno board, see here for information. ' This program reads an I2C register and LED is set to on if the value  is over 100.
  ' This program will read from address 83, register 1.

  #chip 16F886, 8
  #config MCLRE_ON

  'I2C settings
  #define I2C_MODE Master
  #define I2C_DATA PORTC.4
  #define I2C_CLOCK PORTC.3

  'Misc settings
  #define LED PORTB.5
  dir LED Out

  'Main loop
  Do
    'Send start
    I2CStart

    'Request value
    I2CSend 83
    I2CSend 1

    'Read value
    I2CReceive ValueIn

    'Send stop
    I2CStop

    'Turn on LED if received value > 100
    Set LED Off
    If ValueIn > 100 Then Set LED On

    'Delay
    Wait 20 ms

  Loop
```

<span class="strong">**Example 2 - Slave Mode:**</span>

See the
<a href="_i2c_overview.html" class="link" title="I2C Overview">I2C Overview</a>
for the Master mode device to control this Slave mode device.

``` screen
  ' I2CReceive_Slave.gcb - using a 16F88.
  ' This program receives commands from a GCB Master. This Slave has three LEDs attached.

  ;----- Configuration

  #chip 16F88, 8
  #config MCLR_OFF


  #define I2C_MODE    Slave     ;this is a slave device now
  #define I2C_CLOCK   portb.4    ;SCL on pin 10
  #define I2C_DATA    portb.1    ;SDA on pin 7
  #define I2C_ADDRESS 0x60      ;address of the slave device

  ;----- Variables

  dim addr, reg, value as byte

  ;----- Program
  #define LED0  porta.2          ;pin 1
  #define LED1  porta.3          ;pin 2
  #define LED2  porta.4          ;pin 3

  dir LED0 out                  ;0, 1 and 2 are outputs (LEDs)
  dir LED1 out                  ;0, 1 and 2 are outputs (LEDs)
  dir LED2 out                  ;0, 1 and 2 are outputs (LEDs)

  do
    I2CStart                 ;wait for Start signal
    I2CReceive( addr )         ;then wait for an address

    if I2CMatch  = true then    ;if it matches, proceed

    I2CReceive(regval, ACK)   ;get the register number
    I2CReceive(value, ACK)    ;and its value
    I2CStop                   ;release the bus from this end

    select case regval        ;now turn proper LED on or off
      case 0:
      if value then
        set LED0 on
      else
        set LED0 off
      end if

      case 1:
      if value then
        set LED1 on
      else
        set LED1 off
      end if

      case 2:
      if value then
        set LED2 on
      else
        set LED2 off
      end if
      case else
           ;other register numbers are ignored
    end select
    else
     I2CStop           ;release bus in any event
    end if

  loop
```

Supported in &lt;I2C.H&gt;

</div>
