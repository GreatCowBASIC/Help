<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="hi2cstartoccurred"></span>HI2CStartOccurred

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    HI2CStartOccurred
```

<span class="strong">**Command Availability:**</span>

Only available for microcontrollers with the hardware I2C or TWI module.

<span class="strong">**Explanation:**</span>

Check if a start condition has occurred since the last run of this
function.

Only used in slave mode.

<span class="strong">**Note:**</span>

This command is also available on microcontrollers with a second
hardware I2C port.

``` programlisting
    HI2C2StartOccurred
```

<span class="strong">**Example:**</span>

``` programlisting
    'Slave-mode polling loop that waits for the master to begin a transmission
    Do
        If HI2CStartOccurred Then          ' <<< the HI2CStartOccurred instruction
            HI2CReceive DataByte
        End If
    Loop
```

<span class="strong">**Key line:**</span>
`If HI2CStartOccurred Then` — checks whether the master has issued a
start condition on the hardware I2C module since this function was last
called, so the slave only attempts to receive data once a transmission
has actually begun.

Supported in &lt;HI2C.H&gt;

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="hi2c_overview" class="link" title="HI2C Overview">HI2C Overview</a> — category
    overview
-   <a href="hi2cstart" class="link" title="HI2CStart">HI2CStart</a> — related
    command in the same category
-   <a href="hi2cstop" class="link" title="HI2CStop">HI2CStop</a> — related
    command in the same category

</div>

</div>
