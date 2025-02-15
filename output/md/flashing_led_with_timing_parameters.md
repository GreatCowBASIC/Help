<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="flashing_led_with_timing_parameters"></span>Flashing LED with timing parameters

</div>

</div>

</div>

<span class="strong">**Explanation:**</span>

This is an example of how to define a subroutine.

When called, this subroutine will blink an LED for the number of times
and duration as determined by the input parameters.

The syntax of the subroutine is:

``` screen
    ' Flash_LED (numtimes, OnTime, (optional) OffTime)
    ' Where numtimes is from 1 - 255 and OnTime/OffTime is
    ' from 0 - 65535 ms. If OffTime is not entered, then
    ' OffTime = OnTime.

    Sub Flash_LED (in numtimes, in OnTime as WORD, Optional OffTime as WORD = OnTime)
        repeat numtimes
            set LED on
            wait OnTime ms
            set LED OFF
            wait OffTime ms
        end repeat
    End Sub
```

Shown below is a working example program using a Microchip PIC 18F25K22.

Change Settings/PORTS as needed for other Chips.

Connect an LED to the LED pin via a 1K series resistor.

<span class="strong">**Demonstration program:**</span>

``` screen
    #chip 18F25K22, 16
    #define LED PORTC.1       'Led on PIN 14 via 1K resistor
    DIR LED OUT
    wait 1 sec

    ;======== MAIN PROGRAM LOOP ================
    Do
       Flash_LED ( 3,250 )        '3 Flashes 250 ms equal on/off time
       Wait 2 Sec
       Flash_LED ( 5,250,500 )    '5 flashes On 250 ms / off 500 ms
       Wait 2 Sec
       Flash_LED ( 10,100 )       '10 rapid flashes
       Wait 2 Sec
    Loop
    ;==========================================

    Sub Flash_LED (in numtimes, in OnTime as WORD, optional OffTime as word = OnTime)
        repeat numtimes
            set LED on
            wait OnTime ms
            set LED OFF
            wait OffTime ms
        end repeat
    End Sub
```

</div>
