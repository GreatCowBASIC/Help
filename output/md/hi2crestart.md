<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="hi2crestart"></span>HI2CRestart

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
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

``` programlisting
    HI2C2Restart
```

<span class="strong">**Example:**</span>

``` programlisting
    do
        HI2CReStart                           ;generate a start signal          ' <<< the HI2CRestart instruction
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

<span class="strong">**Key line:**</span> `HI2CReStart` — issues a start
condition without first sending a stop, letting the loop retry
addressing the same device (via `HI2CAckPollState`) or, on its second
use below, switch the transaction from writing to reading.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="hi2c_overview" class="link" title="HI2C Overview">HI2C Overview</a> — category
    overview
-   <a href="hi2creceive" class="link" title="HI2CReceive">HI2CReceive</a> — related
    command in the same category
-   <a href="hi2cackpollstate" class="link" title="HI2CAckPollState">HI2CAckPollState</a> — related
    command in the same category

</div>

Supported in &lt;HI2C.H&gt;

</div>
