<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="peripheral_pin_select_for_microchip_microcontrollers"></span>Peripheral Pin Select for Microchip microcontrollers.

</div>

</div>

</div>

<span class="strong">**Introduction:**</span>

Peripheral Pin Select (PPS) enables the digital peripheral I/O pins to
be changed to support mapping of external pins to different pins.

In older 8-bit Microchip devices, a peripheral was hard-wired to a
specific pin (example: PWM1 output on pin RC5).

PPS allows you to choose from a number of output and input pins to
connect to the digital peripheral.

This can be extremely useful for routing circuit boards.

There are cases where a change of I/O position can make a circuit board
easier to route Sometimes mistakes are found too late to fix so having
the option to change a pinout mapping in software rather than creating a
new printed circuit board can be very helpful.

You <span class="strong">**must**</span> use the command `UnLockPPS` to
enable setting of the PPS if the PPS have been previously locked, and,
you can, optionally, use `LockPPS` to prevent unintentional change to
PPS settings.

GCBASIC includes these two macros to ensure this process is handled
correctly.

Also, see <http://microchip.wikidot.com/8bit:pps> for more information.

<span class="strong">**Example:**</span>

``` screen
    'Please check configuration before using on an alternative microcontroller.

    #chip 16f18855,32
    #option explicit

    'Set the PPS of the I2C and the RS232 ports.
    #startup InitPPS, 85
    Sub InitPPS
      LOCKPPS
        RC0PPS = 0x0010       'RC0->EUSART:TX;
        RXPPS  = 0x0011       'RC1->EUSART:RX;

        SSP1CLKPPS = 0x14     'RC3->MSSP1:SCL1;
        SSP1DATPPS = 0x13     'RC4->MSSP1:SDA1;
        RC3PPS = 0x15         'RC3->MSSP1:SCL1;
        RC4PPS = 0x14         'RC4->MSSP1:SDA1;
      UnLockPPS
    End Sub
```

<span class="strong">**For more help, see:
<a href="unlockpps" class="link" title="UnLockPPS">UnlockPPS</a>
and
<a href="lockpps" class="link" title="LockPPS">LockPPS</a>.**</span>

</div>
