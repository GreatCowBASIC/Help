<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="smt_timers"></span>SMT Timers

</div>

</div>

</div>

The Signal Measurement Timer (SMT) capability is a 24-bit counter with
advanced clocking and gating logic, which can be configured for
measuring a variety of digital signal parameters such as pulse width,
frequency and duty cycle, and the time difference between edges on two
signals.  

<span class="strong">**Syntax:**</span>

``` screen
    SETSMT1PERIOD ( 4045000 )        ' 1.000s period
                                     ' a perfect internal clock would be 4000000

    SETSMT2PERIOD ( 9322401 )        ' 4.600s period

    InitSMT1(SMT_FOSC,SMTPres_1)
    InitSMT2(SMT_FOSC4,SMTPres_8)

    On Interrupt SMT1Overflow Call yourSMT1InterruptHandler
    On interrupt SMT2Overflow Call yourSMT1InterruptHandler

    StartSMT1
    StartSMT2
```

<span class="strong">**Command Availability:**</span>

Available on Microchip microcontrollers with the SMT timer module.

This command set supports the use of the SMT as a 24-bit timer only.

Microchip PIC Microcontrollers have either 1 or 2 Signal Measurement
Timers (SMT).   A 24-bit timer allows for very long timer periods/high
resolution and can be quite useful for certain applications.   SMT
timers support multiple clock sources and prescales.   Interrupt on
overflow/match is also supported.

SMT timers will "overflow" when the 24-bit timer value "matches" the
24-bit period registers.

The timer period can be precisely adjusted/set by writing a period value
to the respective period register for eact timer.

The maximum period is achieved by a period register value of
16,777,215.   16,777,215 is the default value at POR.   The timer period
is also affected by the ChipMhz, TimerSource and Timer Prescale.

The library supports "normal" timer operation of SMT1/SMT2.   The
library does not support the advanced signal measurement features.

<span class="strong">**Explanation:**</span>

Commands are detailed in the table below:

<div class="informaltable">

<table data-border="1">
<thead>
<tr class="header">
<th style="text-align: left;">Command</th>
<th style="text-align: left;">Description</th>
<th style="text-align: left;">Example  </th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">InitSMT1( Source,Presscaler )</code></p></td>
<td style="text-align: left;"><p>Source can be one of the below:<br />
<code class="literal">SMT_AT1_perclk</code>   equates to 6<br />
<code class="literal">SMT_MFINTOSC</code>       equates to 5 (500KHz)<br />
<code class="literal">SMT_MFINTOSC_16</code> equates to 4 (500Khz / 16)<br />
<code class="literal">SMT_LFINTOSC</code>       equates to 3 (32Khz)<br />
<code class="literal">SMT_HFINTOSC</code>      equates to 2<br />
<code class="literal">SMT_FOSC4</code>             equates to 1 (FOSC/4)<br />
<code class="literal">SMT_FOSC</code>               equates to 0<br />
<br />
Prescaler can be one of the following:<br />
<code class="literal">SMTPres_1</code> equates to 1:1<br />
<code class="literal">SMTPres_2</code> equates to 1:2<br />
<code class="literal">SMTPres_4</code> equates to 1:4<br />
<code class="literal">SMTPres_8</code> equates to 1:8<br />
<br />
</p></td>
<td style="text-align: left;"><p><code class="literal">InitSMT1(SMT_FOSC,SMTPres_1)</code></p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">InitSMT2( Source,Presscaler )</code></p></td>
<td style="text-align: left;"><p>Source can be one of the below:<br />
<code class="literal">SMT_AT1_perclk</code>   equates to 6<br />
<code class="literal">SMT_MFINTOSC</code>       equates to 5 (500KHz)<br />
<code class="literal">SMT_MFINTOSC_16</code> equates to 4 (500Khz / 16)<br />
<code class="literal">SMT_LFINTOSC</code>       equates to 3 (32Khz)<br />
<code class="literal">SMT_HFINTOSC</code>      equates to 2<br />
<code class="literal">SMT_FOSC4</code>             equates to 1 (FOSC/4)<br />
<code class="literal">SMT_FOSC</code>               equates to 0<br />
<br />
Prescaler can be one of the following:<br />
<code class="literal">SMTPres_1</code> equates to 1:1<br />
<code class="literal">SMTPres_2</code> equates to 1:2<br />
<code class="literal">SMTPres_4</code> equates to 1:4<br />
<code class="literal">SMTPres_8</code> equates to 1:8<br />
</p>
<p><br />
</p></td>
<td style="text-align: left;"><p><code class="literal">InitSMT2(SMT_FOSC4,SMTPres_8)</code></p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">ClearSMT1</code></p></td>
<td style="text-align: left;"><p>Clears the timer. No parameter required.</p></td>
<td style="text-align: left;"><p><code class="literal">ClearSMT1</code></p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">ClearSMT</code></p></td>
<td style="text-align: left;"><p>Clears the timer. No parameter required.</p></td>
<td style="text-align: left;"><p><code class="literal">ClearSMT2</code></p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">SetSMT1( TimerValue )</code></p></td>
<td style="text-align: left;"><p>Sets the timer to the specific value. The value can be 1 to 16777215</p></td>
<td style="text-align: left;"><p><code class="literal">SETSMT1(4045000)</code></p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">SetSMT2( TimerValue )</code></p></td>
<td style="text-align: left;"><p>Sets the timer to the specific value. The value can be 1 to 16777215</p></td>
<td style="text-align: left;"><p><code class="literal">SETSMT2(4045000)</code></p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">StopSMT1</code></p></td>
<td style="text-align: left;"><p>Stops the timer. No parameter required.</p></td>
<td style="text-align: left;"><p><code class="literal">StopSMT2</code></p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">StopSMT2</code></p></td>
<td style="text-align: left;"><p>Stops the timer. No parameter required.</p></td>
<td style="text-align: left;"> </td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">StartSMT1</code></p></td>
<td style="text-align: left;"><p>Starts the timer. No parameter required.</p></td>
<td style="text-align: left;"><p><code class="literal">StartSMT1</code></p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">StartSMT2</code></p></td>
<td style="text-align: left;"><p>Starts the timer. No parameter required.</p></td>
<td style="text-align: left;"><p><code class="literal">StartSMT2</code></p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">SetSMT1Period ( PeriodValue )</code></p></td>
<td style="text-align: left;"><p>Sets the timer period to the specific value. The value can be 1 to 16777215</p></td>
<td style="text-align: left;"><p><code class="literal">SETSMT1PERIOD(4045000)</code></p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">SetSMT2Period ( PeriodValue )</code></p></td>
<td style="text-align: left;"><p>Sets the timer period to the specific value. The value can be 1 to 16777215</p></td>
<td style="text-align: left;"><p><code class="literal">SETSMT1PERIOD(9322401)</code></p></td>
</tr>
</tbody>
</table>

</div>

  
  
<span class="strong">**Example 1 (Microchip Only):**</span>

This example will ..

``` screen
    #Chip 16F18855, 32

    #option explicit
    #Include <SMT_Timers.h>
    #config CLKOUTEN_ON


      '' -------------------LATA-----------------
      '' Bit#:  -7---6---5---4---3---2---1---0---
      '' LED:   ---------------|D5 |D4 |D3 |D1 |-
      ''-----------------------------------------
      ''
      #define LEDD2 PORTA.0
      #define LEDD3 PORTA.1
      #define LEDD4 PORTA.2
      #define LEDD5 PORTA.3
      #define Potentiometer   PORTA.4

      Dir     LEDD2 OUT
      Dir     LEDD3 OUT
      Dir     LEDD4 OUT
      Dir     LEDD5 OUT
      DIR     Potentiometer In


     SETSMT1PERIOD ( 4045000 )        ' 1.000s periodwith the parameters of SMT_FOSC and SMTPres_1 within the clock variance of the interclock
                                      ' a perfect internal clock would be 4000000

     SETSMT1PERIOD ( 9322401 )        ' 4.600s period with the parameters of SMT_FOSC4 and SMTPres_8

     InitSMT1(SMT_FOSC,SMTPres_1)
     InitSMT2(SMT_FOSC4,SMTPres_8)


     On Interrupt SMT1Overflow Call BlinkLEDD2
     On interrupt SMT2Overflow Call BlinkLEDD3

     StartSMT1
     StartSMT2


     Do
       '// Waiting for interrupts

     LOOP


    Sub BlinkLEDD2
      LEDD2 = !LEDD2
    End SUB



    Sub BlinkLEDD3
      LEDD3 = !LEDD3
    End SUB
```

  
  

<span class="strong">**Supported in &lt;SMT\_Timers.h&gt;**</span>

</div>
