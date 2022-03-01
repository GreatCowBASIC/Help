<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="sersend"></span>SerSend

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
  SerSend channel, data
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

This command will send a byte given by `data` using the RS232 channel
referred to as `channel` according to the rules set using `InitSer`.

<span class="strong">**Example:**</span>

``` screen
  'This program will send a byte using PORTB.2, the value of which
  'depends on whether a button is pressed. This can be used with the example for SerReceive.

  #chip 16F819, 8

  #define RS232Out PORTB.2
  #define RS232In  PORTB.1

  Dir RS232Out Out
  Dir RS232In In

  'Config Software-UART
  #define SendAHigh Set RS232Out ON
  #define SendALow Set RS232Out OFF
  #define RecAHigh Set RS232In ON
  #define RecALow Set RS232In OFF

  Dir Button In

  InitSer 1, r9600, 1+WaitForStart, 8, 1, none, normal
  Do
    If Button = On Then Temp = 100
    If Button = Off Then Temp = 0
    SerSend 1, Temp
    Wait 100 ms
  Loop
```

<span class="strong">**For more help, see**</span>
<a href="rs232_software_overview" class="link" title="RS232 Software Overview">RS232 Software Overview</a>,
<a href="initser" class="link" title="InitSer">InitSer</a>

</div>
