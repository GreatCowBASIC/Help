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
    LOCKPPS
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

``` programlisting
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
      LOCKPPS          ' <<< the LockPPS instruction
    End Sub
```

<span class="strong">**Key line:**</span> `LOCKPPS` — re-locks the PPS
registers once the pin assignments above have been made, preventing
further inadvertent changes.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="unlockpps" class="link" title="UnLockPPS">UnLockPPS</a> — unlocking
    the PPS registers before making changes
-   <a href="peripheral_pin_select_for_microchip_microcontrollers" class="link" title="Peripheral Pin Select for Microchip microcontrollers.">Introduction to PPS</a> — background
    on Peripheral Pin Select

</div>

</div>
