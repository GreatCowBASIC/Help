<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="hi2crestart"></span>HI2CRestart

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    HI2CRestart
```

<span class="strong">**Command Availability:**</span>

Only available for microcontrollers with the hardware I2C or TWI module.

<span class="strong">**Explanation:**</span>

If the HI2C routines are operating in Master mode, this command will
send a start and restart condition in a single command.

<span class="strong">**Note:**</span>

This command is also available on microcontrollers with a second
hardware I2C port.

``` screen
    HI2C2Restart
```

<span class="strong">**Example:**</span>

``` screen
    do
        HI2CReStart                           ;generate a start signal
        HI2CSend(eepDev)                      ;inidcate a write
    loop While HI2CAckPollState

    HI2CSend(eepAddr_H)                   ;as two bytes
    HI2CSend(eepAddr)
    HI2CReStart
    HI2CSend(eepDev + 1)                  ;indicate a read

    eep_i = 0                             ;loop consecutively
    do while (eep_i < eepLen)             ;these many bytes
        eep_j = eep_i + 1                   ;arrays begin at 1 not 0
        if (eep_i  < (eepLen - 1)) then
        HI2CReceive(eepArray(eep_j), ACK)  ;more data to get
        else
        HI2CReceive(eepArray(eep_j), NACK ) ;send NACK on last byte
        end if
        eep_i++                             ;get set for next
    loop
    HI2CStop
```

Supported in &lt;HI2C.H&gt;

``` literallayout
==== HI2CSend
```

<span class="strong">**Syntax:**</span>

``` screen
    HI2CSend data
```

<span class="strong">**Command Availability:**</span>

Only available for microcontrollers with the hardware I2C or TWI module.

<span class="strong">**Explanation:**</span>

The HI2CSend command will send `data` through the I2C connection. If in
master mode, HI2CSend will send the data immediately. If in slave mode,
HI2CSend will wait for the master to request the data before sending.

<span class="strong">**Note:**</span>

This command is also available on microcontrollers with a second
hardware I2C port.

``` screen
    HI2C2Send  data
```

<span class="strong">**Example:**</span>

This example code retrieves multiple bytes from an EEPROM memory device.

``` screen
 do
      HI2CReStart                         ;generate a start signal
      HI2CSend(eepDev)                    ;indicate a write
    loop While HI2CAckPollState

    HI2CSend(eepAddr_H)                   ;as two bytes
    HI2CSend(eepAddr)
    HI2CReStart
    HI2CSend(eepDev + 1)                  ;indicate a read

    eep_i = 0                             ;loop consecutively
    do while (eep_i < eepLen)             ;these many bytes
      eep_j = eep_i + 1                   ;arrays begin at 1 not 0
      if (eep_i  < (eepLen - 1)) then
        HI2CReceive(eepArray(eep_j), ACK)  ;more data to get
      else
        HI2CReceive(eepArray(eep_j), NACK ) ;send NACK on last byte
      end if
      eep_i++                             ;get set for next
    loop
    HI2CStop
```

Supported in &lt;HI2C.H&gt;

</div>
