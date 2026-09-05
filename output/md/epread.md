<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="epread"></span>EPRead

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    EPRead location, store
```

<span class="strong">**Command Availability:**</span>

Available on all Microchip PIC and Atmel AVR microcontrollers with
EEPROM data memory.

<span class="strong">**Explanation:**</span>

`EPRead` reads a byte from the EEPROM data storage built into many
microcontroller chips. `location` is the address to read from, and its
valid range depends on the chip in use. `store` is the variable that
receives the value once it has been read.

<span class="strong">**Note:**</span> Do not read past the end of the
chip’s physical EEPROM. If the EEPROM is 256 bytes, `location` must stay
within 0 to 255; if it is 512 bytes, `location` must stay within 0 to
511 and should be a Word variable rather than a Byte.

<span class="strong">**Example:**</span>

``` programlisting
    'Program to turn a light on and off
    'Will remember the last status

    #chip tiny2313, 1
    #define Button PORTB.0
    #define Light PORTB.1

    Dir Button In
    Dir Light Out

    'Load saved status
    EPRead 0, LightStatus          ' <<< the EPRead instruction

    If LightStatus = 0 Then
      Set Light Off
    Else
      Set Light On
    End If

    Do
      'Wait for the button to be pressed
      Wait While Button = On
      Wait While Button = Off
      'Toggle value, record
      LightStatus = !LightStatus
      EPWrite 0, LightStatus

      'Update light
      If LightStatus = 0 Then
        Set Light Off
      Else
        Set Light On
      End If
    Loop
```

<span class="strong">**Key line:**</span>
`EPRead 0, LightStatus` — reads the byte stored at EEPROM address 0 back
into `LightStatus` when the chip powers up, so the light remembers
whatever state it was last left in.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="epwrite" class="link" title="EPWrite">EPWrite</a> — writing
    the value this page reads back
-   <a href="dir" class="link" title="Dir">Dir</a> — setting the
    button and light pin directions, as used above

</div>

</div>
