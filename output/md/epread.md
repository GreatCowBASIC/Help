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

`EPRead` is used to read information from the EEPROM data storage that
many microcontroller chips are equipped with. `location` represents the
location to read data from, and varies from one chip to another. `store`
is the variable in which to store the data after it has been read from
EEPROM.

Note Do not exceed the location ( also known as the EEProm address ) of
the physical EEProm. If the EEProm size is 256 ensure location is in the
range of 0 to 255; If the EEProm size is 512 ensure location is in the
range of 0 to 511 and use a Word variable as the location parameter.
Example:

<span class="strong">**Example:**</span>

``` screen
    'Program to turn a light on and off
    'Will remember the last status

    #chip tiny2313, 1
    #define Button PORTB.0
    #define Light PORTB.1

    Dir Button In
    Dir Light Out

    'Load saved status
    EPRead 0, LightStatus

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

<span class="strong">**For more help, see
<a href="epwrite" class="link" title="EPWrite">EPWrite</a>**</span>

</div>
