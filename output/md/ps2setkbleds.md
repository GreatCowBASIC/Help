<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="ps2setkbleds"></span>PS2SetKBLeds

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    PS2SetKBLeds (LedStatus)
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

This routine will turn the status LEDs on a keyboard on or off.
`LedStatus` is a variable, of which the lower 3 bits correspond to the 3
LEDs. Bit 0 is for Scroll Lock, bit 1 controls Num Lock and bit 2
controls Caps Lock.

Note that this routine does not alter the status variables within the
INKEY routine - so even if the Caps Lock LED is turned on, Caps Lock
will stay off.

<span class="strong">**Example:**</span>

``` screen
  'A spinning LED program for a keyboard
    'Will flash Num Lock, then Caps Lock, then Scroll Lock.

    'Hardware settings
    #chip 16F88, 8

    #define PS2Clock PORTB.2
    #define PS2Data PORTB.3
    #define PS2_DELAY 10 ms

    'Main Loop
    Do

        'Turn on only Num Lock (bit 1)
        PS2SetKBLeds b'00000010'
        Wait 250 ms

        'Turn on only Caps Lock (bit 2)
        PS2SetKBLeds b'00000100'
        Wait 250 ms

        'Turn on only Scroll Lock (bit 0)
        PS2SetKBLeds b'00000001'
        Wait 250 ms

    Loop
```

</div>
