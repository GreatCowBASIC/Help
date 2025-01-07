<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="atmel_avr_pwm_overview"></span>ATMEL AVR PWM Overview

</div>

</div>

</div>

<span class="strong">**Introduction:**</span>

The methods described in this section allow the generation of Pulse
Width Modulation (PWM) signals. PWM signals enables the microcontroller
to control items like the speed of a motor, or the brightness of a LED
or lamp.  

The methods can also be used to generate the appropriate frequency
signal to drive an infrared LED for remote control applications.  

GCBASIC support the methods described in this section.

<span class="strong">**Hardware PWM using a Timer/Counter with a OCRnx
module**</span>

The AVR devices use a Timer/Counter and OCRnx module that has a variable
period register. The Hardware PWM is available through the OCnx pin.

The method uses three parameters to setup the HPWM.

``` literallayout
'HPWM channel, frequency, duty cycle
HPWM  2, 100, 50
```

<span class="strong">**Relevant Constants:**</span>

A number of constants are used to control settings for PWM hardware
module of the microcontroller. To set them, place a line in the main
program file that uses \#define to assign a value to the particular
constant.

   
   
   

<span class="strong">**See**</span>
<a href="hpwm_avr_ocrnx" class="link" title="HPWM AVR OCRnx">HPWM AVR OCRnx</a>

</div>
