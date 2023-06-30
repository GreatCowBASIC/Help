<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="lockpps"></span>LockPPS

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    LOCKPSS
```

<span class="strong">**Explanation:**</span>

Peripheral Pin Select (PPS) has an operation mode in which all input and
output selections can be prevented to stop inadvertent changes.

PPS selections are locked by setting by the use of the `LockPPS`
command.

Using this command will ensure the special sequence of Microchip
assembler is handled correctly.

<span class="strong">**Command Availability:**</span>

Available on all Microchip microcontrollers only.

``` screen
    #chip 16f18855,32
    #option explicit

    'Set the PPS of the I2C and the RS232 ports.
    #startup InitPPS, 85
    Sub InitPPS
      UNLOCKPPS
        RC0PPS = 0x0010       'RC0->EUSART:TX;
        RXPPS  = 0x0011       'RC1->EUSART:RX;

        SSP1CLKPPS = 0x14     'RC3->MSSP1:SCL1;
        SSP1DATPPS = 0x13     'RC4->MSSP1:SDA1;
        RC3PPS = 0x15         'RC3->MSSP1:SCL1;
        RC4PPS = 0x14         'RC4->MSSP1:SDA1;
      LOCKPPS
    End Sub
```

<span class="strong">**For more help, see:
<a href="unlockpps" class="link" title="UnLockPPS">UnlockPPS</a>.**</span>

</div>
