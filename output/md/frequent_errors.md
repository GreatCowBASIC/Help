<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="frequent_errors"></span>Frequent errors

</div>

</div>

</div>

Frequent errors that may happen, from the initial creation of a program
and onwards.

<span class="red">Strange timings:</span> You declared an oscillator
frequency, different from the oscillator actually attached to the
microcontroller.  
  
<span class="red">No oscillator:</span> Keep in mind that, besides the
frequency, you must also set the type of oscillator, internal or
external.  
  
<span class="red">No GCBASIC frequency stated:</span> If not declared in
your source program, GCBASIC uses a preset frequency suitable for
operating the microcontroller as the fastest practical.  
  
<span class="red">External oscillators:</span> It must be explicitly
stated. If not stated, GCBASIC will attempt to set up the internal
oscillator.  
  
<span class="red">Ports:</span> GCBASIC will set the ports
automatically, but you may need to set the ports outputs or inputs when
needed.  
  
<span class="red">Analog levels:</span> When applied on the ports
defined as digital inputs, this can cause current consumption in the
input buffer, which is outside the device specifications. Beware.  
  
<span class="red">Current drawn:</span> Current taken from the
microcontroller outputs, exceeding the maximum allowed (not all pins
supply the same current). Beware of drawing too much current.  
  
<span class="red">Watchdog Timer (WDT):</span> The WDT is a useful
timer. Enable it to reset the microcontroller when processing gets stuck
in a loop.  
  
<span class="red">Interrupts:</span> A badly controlled interrupt (in
some cases) will prevent the execution of the entire program.  
  
<span class="red">No action:</span> The circuit is not powered.  
  
<span class="red">Still no action:</span> The microcontroller is not
present or different from the device you expected.  
  
<span class="red">Still no action:</span> The microcontroller is
inserted incorrectly in the appropriate socket.  
  
<span class="red">Cannot program:</span> Incorrect programmer, incorrect
programmer parameters, or the circuit connections are incorrect.  
  
<span class="red">Still cannot program:</span> Values of excessively
incorrect circuit resistances.  
  
<span class="red">Serial communications:</span> The TX and RX pins of
the serial port are exchanged, and/or the connections with the level
converter, TTL/RS232 or TTL/USB.  
  
<span class="red">Still no serial communications:</span> Serial speed
different from the one set in the circuit with which it is intended to
communicate, or vice versa.  
  
<span class="red">No I2C/TWI:</span> SDA and/or SCL pin exchanged on the
I2C/TWI bus connection, and/or no pull-up resistors, and/or no common 0V
reference.  
  
<span class="red">Incorrect timing:</span> Calculation of any timings
related to the frequency of the external oscillator, without taking into
account the division by 4.  
  
<span class="red">Strange numeric values:</span> The variables declared
are insufficient to contain the values to be processed - see
<a href="variable_types" class="link" title="Variable Types">Variable Types</a>
for the numeric range each variable type can hold.  

</div>
