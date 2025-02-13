<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="hi2creceive"></span>HI2CReceive

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    HI2CReceive data

    HI2CReceive data, ACK
    HI2CReceive data, NACK
```

<span class="strong">**Command Availability:**</span>

Only available for microcontrollers with the hardware I2C or TWI module.

<span class="strong">**Explanation:**</span>

The HI2CReceive command will send <span class="emphasis">*data*</span>
through the I2C connection. If `ack` is TRUE, or no value is given for
`ack`, then `HI2CReceive` will send an ack to the I2C bus.

If in master mode, `HI2CReceive` will read the data immediately. If in
slave mode, `HI2CReceive` will wait for the master to send the data
before reading.

<span class="strong">**Note:**</span>

This command is also available on microcontrollers with a second
hardware I2C port.

``` screen
    HI2C2Receive  _data_

    HI2C2Receive _data_, ACK
    HI2C2Receive _data_, NACK
```

<span class="strong">**Example 1:**</span>

``` screen
    'This program reads an I2C register and sets an LED if it is over 100.

    'It will read from I2C device with an address of 83, register 1.
    ' Change the processor
    #chip 16F1937, 32
    #config MCLRE_ON


    ' Define I2C settings
    #define HI2C_BAUD_RATE 400

    #define HI2C_DATA PORTC.4
      #define HI2C_CLOCK PORTC.3

    'I2C pins need to be input for SSP module
    Dir HI2C_DATA in
    Dir HI2C_CLOCK in

    'MASTER I2C Device
    HI2CMode Master

    'Misc settings
    #define LED PORTB.0

    'Main loop
    Do
      'Send start
      HI2CStart

      'Request value
      HI2CSend 83
      HI2CSend 1

      'Read value
      HI2CReceive ValueIn

      'Send stop
      HI2CStop

      'Turn on LED if received value > 100
      Set LED Off
      If ValueIn > 100 Then Set LED On

      'Delay
      Wait 20 ms

    Loop
```

<span class="strong">**Example 2:**</span>

See the
<a href="i2c_overview" class="link" title="I2C Overview">I2C Overview</a>
for the Master mode device to control this Slave mode device.

``` screen
    ' I2CHardwareReceive_Slave.gcb - using a 16F88.
    ' This program receives commands from a GCB Master. This Slave has three LEDs attached.

    ; This Slave device responds to address 0x60 and may only be written to.
    ; Within it, there are three registers, 0,1 and 2 corresponding to the three LEDs. Writing a zero
    ; turns the respective LED off. Writing anything else turns it on.


    #chip 16F88, 4
    #config  MCLR_Off

    #define I2C_MODE    Slave     ;this is a slave device now
    #define I2C_CLOCK   portb.4   ;SCL on pin 10
    #define I2C_DATA    portb.1   ;SDA on pin 7
    #define I2C_ADDRESS 0x60      ;address of the slave device

    #define I2C_BIT_DELAY 20 us
    #define I2C_CLOCK_DELAY 10 us
    #define I2C_END_DELAY 10 us


    'Serial settings
    #define SerInPort PORTB.6
    #define SerOutPort PORTB.7

    #define SendAHigh Set SerOutPort OFF
    #define SendALow Set SerOutPort On
    'Set pin directions
    Dir SerOutPort Out
    Dir SerInPort In

    'Set up serial connection
    InitSer 1, r2400, 1 + WaitForStart, 8, 1, none, INVERT
    wait 1 s

    #define LED0  porta.2          ;pin 1
    #define LED1  porta.3          ;pin 2
    #define LED2  porta.4          ;pin 3

    ;----- Variables

    dim addr, reg, value,location as byte
    addr = 255
    reg = 255
    value = 255
    location = 0
    mempointer = 255

    ;----- Program

    dir LED0 out                  ;0, 1 and 2 are outputs (LEDs)
    dir LED1 out                  ;0, 1 and 2 are outputs (LEDs)
    dir LED2 out                  ;0, 1 and 2 are outputs (LEDs)

    set LED0 off
    set LED1 off
    set LED2 off

    #define SerialControlPort portb.3
    dir SerialControlPort in

    'Set up interrupt to process I2C

       dir I2C_CLOCK in           ; required to input for MSSP module
       dir I2C_DATA in            ; required to input for MSSP module
       SSPADD=I2C_ADDRESS         ; Slave address
       SSPSTAT=b'00000000'        ; configuration
       SSPCON=b'00110110'         ; configuration
       PIE1.SSPIE=1               ; enable interrupt


    repeat 3                      ;flash LEDs
      set LED0 on
      set LED1 on
      set LED2 on
      wait 50 ms
      set LED0 off
      set LED1 off
      set LED2 off
      wait  100 ms
    end Repeat

    oldvalue = 255                ; old value, set up value only
    oldreg = 255                  ; old value, set up value only

    UpdateLEDS                    ; call method to set LEDs
                    ; set up interrupt
    On Interrupt SSP1Ready call I2C_Interrupt

    do forever
       if reg <> oldreg then      ; only process when the reg is a new value
        oldreg = reg            ; retain old value
        show = 1                ; its time to show the LEDS!
        if  value <> oldvalue then    ; logic for tracking old values. You only want to update terminal once per change
          oldvalue = value
          show = 1
        end if
       end if

       UpdateLEDS                  ; Update date LEDs

                     ; update serial terminal
       if show = 1  and SerialControlPort = 1 then

        SerPrint 1, "0x"+hex(addr)
        SerSend 1,9

        SerPrint 1, STR(reg)
        SerSend 1,9

        SerPrint 1, STR(value)
        SerSend 1,10
        SerSend 1,13

        show = 0
       end if
    loop


    Sub I2C_Interrupt
      ' handle interrupt
      IF SSPIF=1 THEN                   ; its a valid interrupt

         IF SSPSTAT.D_A=0 THEN          ; its an address coming in!
          addr=SSPBUF
          IF addr=I2C_ADDRESS THEN    ; its our address

           mempointer = 0           ; set the memory pointer. This code emulates an EEPROM!

          end if
          IF addr = ( I2C_ADDRESS | 1 ) THEN    ; its our write address
           CKP = 0                            ; acknowledge command
                            ; If the SDA line was low (ACK), the transmit data must be loaded into
                            ; the SSPBUF register which also loads the SSPSR
                            ; register. Then, pin RB4/SCK/SCL should be enabled
                            ; by setting bit CKP.

           mempointer = 10                    ; set a pointer to track incoming write reqests
           if I2C_DATA = 0 then
            SSPBUF = 0x22
            CKP = 1
            readpointer = 0x55
           end if
          end if

         else

         if  SSPSTAT.P = 1 then             ' Stop bit has been detected - out of sequence
           ' handle event
         end if

         IF  SSPSTAT.S = 1 THEN             ' Start bit has been detected - out of sequence
           ' handle event
         END IF

         IF SSPSTAT.R_W = 0 THEN            ' Write operations requested

          SELECT CASE mempointer
               CASE 0
                reg = SSPBUF         ' incoming value
                mempointer++         ' increment our counter
               CASE 1
                value = SSPBUF       ' incoming value
                mempointer++         ' increment our counter
               CASE ELSE
                dummy = SSPBUF       ' incoming value
          END SELECT

         ELSE                                ' Read operations
          SSPBUF = readpointer             ' incoming value
          readpointer++                    ' increment our counter

         END IF
         END IF
         CKP = 1                               ' acknowledge command
         SSPOV = 0                             ' acknowledge command
      END IF
      SSPIF=0
    END SUB



    sub UpdateLEDS

      select case reg           ;now turn proper LED on or off
        case 0
        if value = 1 then
          set LED0 on
        else
          set LED0 off
        end if

        case 1
        if value = 1 then
          set LED1 on
        else
          set LED1 off
        end if

        case 2
        if value = 1 then
          set LED2 on
        else
          set LED2 off
        end if

      end select

    End Sub
```

Supported in &lt;HI2C.H&gt;

</div>
