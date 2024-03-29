<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="flashing_leds_and_an_interrupt"></span>Flashing LEDs and an Interrupt

</div>

</div>

</div>

<span class="strong">**Explanation:**</span>

This code implements four flashing LEDs. This is based on the Microchip
PIC Low Pin Count Demo Board.

The example program will blink the four red lights in succession. Press
the Push Button Switch, labeled <span class="strong">**SW1**</span>, and
the sequence of the lights will reverse. Rotate the potentiometer,
labeled <span class="strong">**RP1**</span>, and the light sequence will
blink at a different rate.

This implements an interrupt for the switch press, reads the analog port
and set the LEDs.

<span class="strong">**Demonstration program:**</span>

``` screen
    #chip 18F14K22, 32
    #config MCLRE_OFF

    'Works with the low count demo board

    'Set the input pin direction
        #define SwitchIn1 PORTa.3
        Dir SwitchIn1 In

    #define LedPort PORTc
        DIR PORTC OUT

    'Setup the ADC  pin direction
        Dir PORTA.0 In
        dim ADCreading as word


    'Setup the input pin direction
        #define IntPortA PORTA.1
        Dir IntPortA In

    'Variable and constants
        #define intstate as byte
        intstate = 0
        #define minwait 1

        dim ccount as byte
        dim leddir as byte

        ccount = 8
        leddir = 0

        SET PORTC = 15
        WAIT 1 S

        SET PORTC = 0

    'Setup the Interrupt
        Set IOCA.3 on
        Dir porta.3 in
        On Interrupt PORTABCHANGE Call Setir

    'Set initial LED direction
        setLedDirection

    DO FOREVER


        INTON
        ADCreading = ReadAD10(AN0)
        if ADCreading < minwait then ADCreading = minwait

        'Set LEDs
        Set PortC = ccount
        wait ADCreading ms

        if leddir = 0 then
          rotate ccount left simple
          'Restart LED position
          if ccount = 16 then
              ccount = 128
          end if

        end if

        if leddir = 1 then
          rotate ccount Right simple
          'Restart LED position
          if ccount = 128 then
            ccount = 8
          end if

        end if
        'Reset interrupt - this may be been reset so set to zero so interrupt can operate.
        intstate = 0

    Loop


    'Interrupt routine.
    sub Setir

        if IntPortA  = 0 and intstate = 0 then
          intstate = 1
          wait while SwitchIn1 = 0
          setLedDirection
        end if


    end sub

    sub setLedDirection

      'Set LED values
      select case leddir

        case 0
          leddir = 1
          ccount  = 8

        case 1
          leddir = 0
          ccount = 1

        end select

    End Sub
```

<span class="strong">**See Also**</span>
<a href="interrupts" class="link" title="Interrupts">Interrupts</a>,
<a href="readad10" class="link" title="ReadAD10">ReadAD10</a>

</div>
