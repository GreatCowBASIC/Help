<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="hi2cstopped"></span>HI2CStopped

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    HI2CStopped
```

<span class="strong">**Command Availability:**</span>

Only available for microcontrollers with the hardware I2C or TWI module.

<span class="strong">**Explanation:**</span>

In Slave mode only. Checks whether a stop condition has been received
since the last use of `HI2CStopped`.

<span class="strong">**Note:**</span>

This command is also available on microcontrollers with a second
hardware I2C port.

``` programlisting
    HI2C2Stopped
```

<span class="strong">**Example:**</span>

``` programlisting
    'Slave-mode polling loop that detects when the master has ended the transmission
    Do
        If HI2CStopped Then          ' <<< the HI2CStopped instruction
            'The master has released the bus; the transaction is complete
        End If
    Loop
```

<span class="strong">**Key line:**</span> `If HI2CStopped Then` — checks
whether the master has issued a stop condition on the hardware I2C
module since this function was last called, signalling that the current
transaction has ended.

Supported in &lt;HI2C.H&gt;

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="hi2c_overview" class="link" title="HI2C Overview">HI2C Overview</a> — category
    overview
-   <a href="hi2cstart" class="link" title="HI2CStart">HI2CStart</a> — related
    command in the same category
-   <a href="hi2cstartoccurred" class="link" title="HI2CStartOccurred">HI2CStartOccurred</a> — related
    command in the same category

</div>

</div>
