<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="fasthwspitransfer"></span>FastHWSPITransfer

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
  FastHWSPITransfer tx
```

<span class="strong">**Command Availability:**</span>

Available on Microchip PIC microcontrollers with Hardware SPI modules.

<span class="strong">**Explanation:**</span>

This command only sends a byte of data using the SPI protocol. This
command only supports master mode.

As a master, `FastHWSPITransfer` will initiate a transfer. The data in
`tx` will be sent to the slave.

<span class="strong">**Example:**</span>

This is an example for this command.

<span class="strong">**Master Program:**</span>

``` programlisting
  'General hardware configuration
  #chip 16F877A, 20

  'Set SPI pin directions
  dir PORTC.5 out
  dir PORTC.4 in
  dir PORTC.3 out

  'Set SPI Mode to master, with fast clock
  SPIMode MasterFast

  'Main Loop
  do

      'Send the value of 0x55
      FastHWSPITransfer 0x55          ' <<< the FastHWSPITransfer instruction

  loop
```

<span class="strong">**Key line:**</span>
`FastHWSPITransfer 0x55` — sends the byte 0x55 to the slave without
waiting to receive a reply; because it discards any incoming byte, this
is faster than `SPITransfer` when the slave’s response is not needed.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="spitransfer" class="link" title="SPITransfer">SPITransfer</a> — the
    full send-and-receive equivalent of this command
-   <a href="spimode" class="link" title="SPIMode">SPIMode</a> — selecting
    master mode before transferring, as used above

</div>

</div>
