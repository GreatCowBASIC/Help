<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="inittimer0"></span>InitTimer0

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    InitTimer0 source, prescaler
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers with a Timer 0 module.

See also see:
<a href="inittimer0_8bit_16bit" class="link" title="InitTimer0 8bit/16bit">InitTimer0 8bit/16bit</a>
for support for microcontrollers with a 8 bit/16 bit Timer 0 module.

<span class="strong">**Explanation:**</span>

`InitTimer0` will set up timer 0.

Parameters are required as detailed in the table below:

<div class="informaltable">

<table data-border="1">
<thead>
<tr class="header">
<th style="text-align: left;">Parameter</th>
<th style="text-align: left;">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">source</code></p></td>
<td style="text-align: left;"><p>The clock source for this specific timer. Can be either <code class="literal">Osc</code> or <code class="literal">Ext</code> where`Osc` is an internal oscillator and <code class="literal">Ext</code> is an external oscillator.<br />
<br />
<code class="literal">Osc</code> - Selects the clock source in use, as set by the microcontroller specific configuration (fuses or #config).  This could be an internal clock or an external clock source ( external clock sources are typically attached to the XTAL pins).</p>
<p><code class="literal">Ext</code> - Selects the clock source attached to a specific exernal interrupt input port.  This allows a different clock frequency than the main clock to be used, such as 32.768 kHz crystals commonly used for real time circuits.</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">prescaler</code></p></td>
<td style="text-align: left;"><p>The value of the prescaler for this specific timer. See the tables below for permitted values for Microchip PIC or the Atmel AVR microcontrollers.</p></td>
</tr>
</tbody>
</table>

</div>

When the timer overflows from 255 to 0, a `Timer0Overflow` interrupt
will be generated. This can be used in conjunction with `On Interrupt`
to run a section of code when the overflow occurs.  
  
  
  

<span class="strong">**Microchip PIC microcontrollers:**</span>

On Microchip PIC microcontrollers where the `prescaler` rate select bits
are in the range of 2 to 256 you should use one of the following
constants. If the `prescaler` rate select bits are in the range of 1 to
32768 then see the subsequent table.

<div class="informaltable">

<table data-border="1">
<thead>
<tr class="header">
<th style="text-align: center;"><span class="strong"><strong>Prescaler Value</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Primary GCB Constant</strong></span></th>
<th style="text-align: center;"><span class="strong"><strong>Constant Equates<br />
to value</strong></span></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: center;"><p>1:2</p></td>
<td style="text-align: left;"><p><code class="literal">PS0_2</code></p></td>
<td style="text-align: center;"><p>0</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:4</p></td>
<td style="text-align: left;"><p><code class="literal">PS0_4</code></p></td>
<td style="text-align: center;"><p>1</p></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p>1:8</p></td>
<td style="text-align: left;"><p><code class="literal">PS0_8</code></p></td>
<td style="text-align: center;"><p>2</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:16</p></td>
<td style="text-align: left;"><p><code class="literal">PS0_16</code></p></td>
<td style="text-align: center;"><p>3</p></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p>1:32</p></td>
<td style="text-align: left;"><p><code class="literal">PS0_32</code></p></td>
<td style="text-align: center;"><p>4</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:64</p></td>
<td style="text-align: left;"><p><code class="literal">PS0_64</code></p></td>
<td style="text-align: center;"><p>5</p></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p>1:128</p></td>
<td style="text-align: left;"><p><code class="literal">PS0_128</code></p></td>
<td style="text-align: center;"><p>6</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:256</p></td>
<td style="text-align: left;"><p><code class="literal">PS0_256</code></p></td>
<td style="text-align: center;"><p>7</p></td>
</tr>
</tbody>
</table>

</div>

These correspond to a prescaler of between 1:2 and 1:256 of the
oscillator speed where the oscillator speed is (FOSC/4). The prescaler
applies to both the internal oscillator or the external clock.  
  
  

<span class="strong">**Atmel AVR microcontrollers:**</span>

On Atmel AVR microcontrollers `prescaler` must be one of the following
constants:

The prescaler will only apply when the timer is driven from the `Osc`
the internal oscillator - the prescaler has no effect when the external
clock source is specified.

<div class="informaltable">

<table data-border="1">
<thead>
<tr class="header">
<th style="text-align: center;"><span class="strong"><strong>Prescaler Value</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Primary GCB Constant</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Secondary GCB Constant</strong></span></th>
<th style="text-align: center;"><span class="strong"><strong>Constant Equates<br />
to value</strong></span></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: center;"><p>1:1</p></td>
<td style="text-align: left;"><p><code class="literal">PS_1</code></p></td>
<td style="text-align: left;"><p><code class="literal">PS_0_1</code></p></td>
<td style="text-align: center;"><p>1</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:8</p></td>
<td style="text-align: left;"><p><code class="literal">PS_8</code></p></td>
<td style="text-align: left;"><p><code class="literal">PS_0_8</code></p></td>
<td style="text-align: center;"><p>2</p></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p>1:64</p></td>
<td style="text-align: left;"><p><code class="literal">PS_64</code></p></td>
<td style="text-align: left;"><p><code class="literal">PS_0_64</code></p></td>
<td style="text-align: center;"><p>3</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:256</p></td>
<td style="text-align: left;"><p><code class="literal">PS_256</code></p></td>
<td style="text-align: left;"><p><code class="literal">PS_0_256</code></p></td>
<td style="text-align: center;"><p>4</p></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p>1:1024</p></td>
<td style="text-align: left;"><p><code class="literal">PS_1024</code></p></td>
<td style="text-align: left;"><p><code class="literal">PS_0_1024</code></p></td>
<td style="text-align: center;"><p>5</p></td>
</tr>
</tbody>
</table>

</div>

  
  
  
<span class="strong">**Example 1 for 8-bit timer 0:**</span>

This code uses Timer 0 and On Interrupt to generate a Pulse Width
Modulation signal, that will allow the speed of a motor to be easily
controlled.

``` screen
    #chip 16F88, 8

    #define MOTOR PORTB.0

    'Call the initialisation routine
    InitMotorControl

    'Main routine
    Do
        'Increase speed to full over 2.5 seconds
        For Speed = 0 to 100
            MotorSpeed = Speed
            Wait 25 ms
        Next
        'Hold speed
        Wait 1 s
        'Decrease speed to zero over 2.5 seconds
        For Speed = 100 to 0
            MotorSpeed = Speed
            Wait 25 ms
        Next
        'Hold speed
        Wait 1 s
    Loop

    'Setup routine
    Sub InitMotorControl
        'Clear variables
        MotorSpeed = 0
        PWMCounter = 0

        'Add a handler for the interrupt
        On Interrupt Timer0Overflow Call PWMHandler

        'Set up the timer using the internal oscillator with a prescaler of 1/2 (Equates to 0)
        'Timer 0 starts automatically on a Microchip PIC microcontroller, therefore, StartTimer is not required.
        InitTimer0 Osc, PS0_2

    End Sub

    'PWM sub
    'This will be called when Timer 0 overflows
    Sub PWMHandler
        If MotorSpeed > PWMCounter Then
            Set MOTOR On
        Else
            Set MOTOR Off
        End If
        PWMCounter += 1
        If PWMCounter = 100 Then PWMCounter = 0
    End Sub
```

<span class="strong">**Example 1 for 18-bit timer 0 operating an 8-bit
timer:**</span>

The same example for a 16-bit timer 0 operating as an 8-bit timer.

``` screen
#chip 16f18855,32
#option Explicit
'timer test Program

dim speed, MotorSpeed, PWMCounter as byte

#define MOTOR PORTb.0
dir MOTOR out

'Call the initialisation routine
InitMotorControl

'Main routine
Do
    'Increase speed to full over 2.5 seconds
    For Speed = 0 to 100
        MotorSpeed = Speed
        Wait 25 ms
    Next
    'Hold speed
    Wait 1 s
    'Decrease speed to zero over 2.5 seconds
    For Speed = 100 to 0
        MotorSpeed = Speed
        Wait 25 ms
    Next
    'Hold speed
    Wait 1 s
Loop

'Setup routine
Sub InitMotorControl
    'Clear variables
    MotorSpeed = 0
    PWMCounter = 0

    'Add a handler for the interrupt
    On Interrupt Timer0Overflow Call PWMHandler

    InitTimer0(Osc, TMR0_FOSC4 + PRE0_1 , POST0_1)
    StartTimer 0

End Sub

'PWM sub
'This will be called when Timer 0 overflows
Sub PWMHandler

    If MotorSpeed > PWMCounter Then
        Set MOTOR On
    Else
        Set MOTOR Off
    End If
    PWMCounter += 1
    If PWMCounter = 100 Then PWMCounter = 0

End Sub
```

<span class="strong">**Supported in &lt;TIMER.H&gt;**</span>

</div>
