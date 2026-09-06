<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="fvrinitialize"></span>FVRInitialize

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    FVRInitialize ( FVR_OFF | FVR_1x | FVR_2x | FVR_4x  )
```

<span class="strong">**Command Availability:**</span>

Available on all Microchip microcontrollers with the Fixed Voltage
Reference (FVR) module.

<span class="strong">**Explanation:**</span>

This subroutine sets the state of the FVR.   

`FVR_OFF` = Fixed Voltage Reference is set to OFF

`FVR_1x` = Fixed Voltage Reference is set to 1.024V

`FVR_2x` = Fixed Voltage Reference is set to 2.048V

`FVR_4x` = Fixed Voltage Reference is set to 4.096V

Using the 16F1828 device’s datasheet as a general case
([datasheet](https://ww1.microchip.com/downloads/en/DeviceDoc/40001419F.pdf),
from the device’s product page at [product
page](https://www.microchip.com/wwwproducts/en/pic16f1828)), parameter
AD06 in table 30-8 on page 359, and the corresponding Note 4, show that
the Vref voltage (Vref+ minus Vref-) should not be less than 1.8V,
regardless of the reference voltage used, for the ADC module to work
within the datasheet specifications.   Also, since Vref- cannot be a
negative voltage (voltages below GND), the lowest voltage on it is
0V.  This means an FVR of 1.024V cannot be used as VREF+ for the
ADC — only the 2.048V and 4.096V values can.

The 1.024V FVR value still exists for use with other modules, not just
the ADC module.

<span class="strong">**Example:**</span>

``` programlisting
    '// use FVR 4096 as Reference
    FVRInitialize ( FVR_4x )          ' <<< the FVRInitialize instruction
    wait while FVRIsOutputReady = false
    ADVal = ReadAd(AN0)

    '// Turn off FVR
    FVRInitialize ( FVR_Off )
```

<span class="strong">**Key line:**</span>
`FVRInitialize ( FVR_4x )` — switches on the internal Fixed Voltage
Reference at 4.096V, ready to be used as the ADC’s voltage reference
once `FVRIsOutputReady` confirms it has stabilised.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="fvrisoutputready" class="link" title="FVRIsOutputReady">FVRIsOutputReady</a> — polling
    for the FVR to stabilise before use, as shown above
-   <a href="readad" class="link" title="ReadAD">ReadAD</a> — taking
    an ADC reading against the FVR

</div>

</div>
