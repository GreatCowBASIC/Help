<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="i2csend"></span>I2CSend

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
 I2CSend data
    I2CSend data, ack
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers except 12 bit instruction Microchip
PIC microcontrollers (10F, 12F5xx, 16F5xx chips)

<span class="strong">**Explanation:**</span>

The I2CSend command will send <span class="emphasis">*data*</span>
through the I2C connection. If `ack` is TRUE, or no value is given for
`ack`, then `I2CSend` will wait for an Ack from the receiver before
continuing. If in master mode, `I2CSend` will send the data immediately.
If in slave mode, `I2CSend` will wait for the master to request the data
before sending.

<span class="strong">**Example 1:**</span>

``` screen
  ' I2CSend - using the ChipIno board, see here for information.
    ' This program send commands to a GCB Slave with three LEDs attached.

    #chip 16F886, 8
    #config MCLRE_ON

    'I2C settings
    #define I2C_MODE Master
    #define I2C_DATA PORTC.4
    #define I2C_CLOCK PORTC.3
    #define I2C_BIT_DELAY 20 us
    #define I2C_CLOCK_DELAY 30 us


    #define I2C_ADDRESS 0x60      ;address of the slave device
    ;----- Variables

    dim reg as byte

    ;----- Program

    do

      for reg = 0 to 2            ;three LEDs to control
        I2CStart                  ;take control of the bus
        I2CSend I2C_ADDRESS       ;address the device
        if I2CSendState = ACK then
          I2CSend reg               ;address the particular register
          I2CSend ON                ;command to turn on LED
        end if
        I2CStop                   ;relinquish the bus
        wait  100 ms
      next reg
      wait 1 S                  ;pause to show results

      for reg = 0 to 2            ;similarly, turn them off
        I2CStart                  ;take control of the bus
        I2CSend I2C_ADDRESS       ;address the device
        if I2CSendState = ACK then
          I2CSend reg               ;address the particular register
          I2CSend OFF               ;command to turn off LED
        end if
        I2CStop                   ;relinquish the bus
        wait  100 ms
      next reg
      wait 1 S                  ;pause to show results

    loop
```

<span class="strong">**Example 2:**</span>

``` screen
    'This program will act as an I2C analog to digital converter
    'When data is requested from address 83, registers 0 through
    '3, it will return the value of AN0 through AN3.

    'Chip model
    #chip 16F88, 8

    'I2C settings
    #define I2C_MODE Slave
    #define I2C_CLOCK PORTB.0
    #define I2C_DATA PORTB.1

    #define I2C_DISABLE_INTERRUPTS ON

    'Main loop
    Do
        'Wait for start condition
        I2CStart

        'Get address
        I2CReceive Address
        If Address = 83 Then
            'If address was this device's address, respond
            I2CReceive Register

            OutValue = ReadAD(Register)
            I2CSend OutValue
        End If

        I2CStop

        Wait 5 ms
    Loop
```

Supported in &lt;I2C.H&gt;

</div>
