<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="hi2csend"></span>HI2CSend

</div>

</div>

</div>

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

``` programlisting
    HI2C2Send  data
```

<span class="strong">**Example:**</span>

This example code retrieves multiple bytes from an EEPROM memory device.

``` programlisting
 do
      HI2CReStart                         ;generate a start signal
      HI2CSend(eepDev)                    ;indicate a write          ' <<< the HI2CSend instruction
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

<span class="strong">**Key line:**</span> `HI2CSend(eepDev)` — sends the
device address byte with the write bit set; the loop retries until the
device ACKs (`HI2CAckPollState` returns false).

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="hi2cstart" class="link" title="HI2CStart">HI2CStart</a>
    /
    <a href="hi2crestart" class="link" title="HI2CRestart">HI2CRestart</a> — generating
    the start/restart condition used above
-   <a href="hi2creceive" class="link" title="HI2CReceive">HI2CReceive</a> — the
    receiving counterpart used later in the example
-   <a href="hi2cstop" class="link" title="HI2CStop">HI2CStop</a> — ending
    the transaction
-   <a href="hi2cackpollstate" class="link" title="HI2CAckPollState">HI2CAckPollState</a> — checking
    for a device ACK, as polled by the retry loop above
-   <a href="hi2cmode" class="link" title="HI2CMode">HI2CMode</a> — selecting
    master/slave mode before sending

</div>

Supported in &lt;HI2C.H&gt;

</div>
