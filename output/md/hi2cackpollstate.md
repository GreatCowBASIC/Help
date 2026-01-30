<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="hi2cackpollstate"></span>HI2CAckPollState

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    <test condition[s]> HI2CAckPollState
```

<span class="strong">**Command Availability:**</span>

Only available for microcontrollers with the hardware I2C or TWI module.

<span class="strong">**Explanation:**</span>

Should only be used when I2C routines are operating in Master mode, this
command will return the last state of the acknowledge response from a
specific I2C device on the I2C bus.

`HI2CSend` sets the state of variable `HI2CAckPollState`.  
`HI2CAckPollState` can only read - it cannot be set.

<span class="strong">**Note:**</span>

This command is also available on microcontrollers with a second
hardware I2C port.

``` screen
    <test condition[s]> HI2C2AckPollState
```

<span class="strong">**Example:**</span>

This example code would display the devices on the I2C bus.

``` screen
     ...
    for deviceID = 0 to 255
      HI2CStart
      HI2CSend ( deviceID )

      if HI2CAckPollState = false then
      HSerPrint "ID: 0x"
      HSerPrint hex(deviceID)
      HSerSend 9
      end if
    next
     ...
```

Supported in &lt;HI2C.H&gt;

</div>
