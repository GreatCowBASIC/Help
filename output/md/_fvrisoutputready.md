<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="_fvrisoutputready"></span>FVRIsOutputReady

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    user_var = FVRIsOutputReady()
```

<span class="strong">**Command Availability:**</span>

Available on all Microchip microcontrollers with the Fixed Voltage
Reference (FVR) module.

<span class="strong">**Explanation:**</span>

The method is a function that returns the state of the FVR.   The
returned value can be assigned to a variable to used as function.

The method returns 0 or 1.   As follows:

0 = Fixed Voltage Reference output is not ready or not enabled

1 = Fixed Voltage Reference output is ready for use

<span class="strong">**Example:**</span>

``` screen
    '// use FVR 4096 as Reference
    FVRInitialize ( FVR_4x )
    wait while FVRIsOutputReady = false
    ADVal = ReadAd(AN0)
```

<span class="strong">**For more help, see**</span>
<a href="_fvrinitialize.html" class="link" title="FVRInitialize">FVRInitialize</a>

</div>
