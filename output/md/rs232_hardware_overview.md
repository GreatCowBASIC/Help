<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="rs232_hardware_overview"></span>RS232 Hardware Overview

</div>

</div>

</div>

<span class="strong">**Introduction**</span>

Great Cow BASIC support programs to communicate easily using RS232.

Great Cow BASIC included microcontroller hardware-based serial routines
are intended for use on microcontrollers with built in serial
communications modules - normally referred to in datasheets as USART or
UART modules. Check the microcontroller data sheet for the defined
transmit and receive (TX/Rx) pins. Make sure your program sets the Tx
pin direction to Out and the Rx pin direction to In respectively. If the
RS232 lines are connected elsewhere, or the microcontroller has no USART
module, then the Great Cow BASIC software based RS232 routines must be
used.

Initialization of the USART module is handled automatically from your
program by defining the chip, speed, and the baudrate. The baudrate
generator values are calculated and set, usart is set to asynchronous,
usart is enabled , the receive and transmit are enabled. See the table
below.

<span class="strong">**Example:**</span>

``` screen
  #chip mega328p, 16
  #define USART_BAUD_RATE 9600
  #define USART_TX_BLOCKING
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers with a USART or UART module.  
Microchip PIC supports USART1 and 2.  
Atmel AVR supports USART 1,2,3 and 4.

The following table explains the methods that can be implemented when
using the Great Cow BASIC serial routines.

<span class="strong">**Commands:**</span>

<div class="informaltable">

<table data-border="1">
<thead>
<tr class="header">
<th style="text-align: left;"><span class="strong"><strong>Command</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Parameters</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Example</strong></span></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><p><span class="strong"><strong>Serially print numbers (byte, word, long) or strings.</strong></span></p></td>
<td style="text-align: left;"> </td>
<td style="text-align: left;"> </td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">HSerPrint</code></p></td>
<td style="text-align: left;"><p>Number_constant or number_variable or string [,optional usart address]</p>
<p>The optional usart address is microcontroller specific buy can be 1, 2, 3 or 4.</p></td>
<td style="text-align: left;"><p>This subroutine prints a variable value to usart 1. No additional parameter for the usart number is used.</p>
<p><code class="literal">HSerprint</code> ( mynum )</p>
<p>To print a variable value to usart 2. Note the additional parameter for the usart address.</p>
<p><code class="literal">HSerprint</code> ( mynum, 2 )</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><span class="strong"><strong>Serially receive ascii number characters and assign to a word variable.</strong></span></p></td>
<td style="text-align: left;"> </td>
<td style="text-align: left;"> </td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">HSerGetNum</code></p></td>
<td style="text-align: left;"><p>Number_variable [,optional usart address]</p>
<p>The optional usart address is microcontroller specific buy can be 1, 2, 3 or 4.</p></td>
<td style="text-align: left;"><p>This subroutine ensures that the characters received are numbers. When a carriage return (CR or ASCII code 13) is received this signifies the end of the character stream. Defaults to usart1.</p>
<p>To receive number characters use.</p>
<p><code class="literal">HSerGetNum</code> ( mynum )</p>
<p>To receive number characters via usart2 use.</p>
<p><code class="literal">HSerGetNum</code> ( mynum, 2 )</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><span class="strong"><strong>Serially receive characters as a string.</strong></span></p></td>
<td style="text-align: left;"> </td>
<td style="text-align: left;"> </td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">HSerGetString</code></p></td>
<td style="text-align: left;"><p>User_string_variable [,optional usart address]</p>
<p>The optional usart address is microcontroller specific buy can be 1, 2, 3 or 4.</p></td>
<td style="text-align: left;"><p>This subroutine ensures that the characters treated as a string. When a carriage return (CR or ASCII code 13) is received this signifies the end of the character stream. Great Cow BASIC will determine the default buffering size for strings. See here for more help on string sizes. Defaults to usart1.</p>
<p>To receive a string use.<br />
<code class="literal">HserGetString</code> ( mystring )</p>
<p>To a string via usart2 use.<br />
<code class="literal">HserGetString</code> ( mystring, 2 )</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><span class="strong"><strong>Serially receive a character using a subroutine.</strong></span></p></td>
<td style="text-align: left;"> </td>
<td style="text-align: left;"> </td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">HSerReceive</code></p></td>
<td style="text-align: left;"><p>byte_variable</p></td>
<td style="text-align: left;"><p>This subroutine handles the incoming characters as raw ASCII values.</p>
<p>The subroutine receives a single byte value in the range of 0 to 255.</p>
<p>The subroutine can receive a byte from usart 1, 2, 3 or 4.</p>
<p>The public variable comport can be set before the use of this method to select the desired usart address.</p>
<p>If ‘#define USART_BLOCKING’ is defined then this methods will wait until it a byte is received.</p>
<p>If ‘#define USART_BLOCKING’ is NOT defined then the method will returns ASCII value received or the method will return the value of 255 to indicate not ASCII data was received. You can change the value returned by setting redefining ‘#define DefaultUsartReturnValue = [0-255]’. When ‘#define USART_BLOCKING’ is NOT defined this method becomes a non- blocking method which allows for the testing and handling of incoming ASCII data within the user program.</p>
<p>To receive an ASCII byte value in blocking mode use. Defaults to usart1</p>
<p>#define USART_BLOCKING<br />
…<br />
…<br />
<code class="literal">HSerReceive</code> (user_byte_variable)</p>
<p>To receive an ASCII byte value via usart 3 using blocking mode use</p>
<p>#define USART_BLOCKING<br />
…<br />
…<br />
Comport = 3<br />
<code class="literal">HSerReceive</code> ( user_byte_variable)</p>
<p>To receive an ASCII byte value use in non-blocking mode use. Ensure #define USART_BLOCKING is NOT defined. This method fefaults to usart1</p>
<p><code class="literal">HSerReceive</code> (user_byte_variable)</p>
<p>To receive an ASCII byte value via usart 4 using non-blocking mode use. Ensure #define USART_BLOCKING is NOT defined.</p>
<p>Comport = 4<br />
<code class="literal">HSerReceive</code> ( user_byte_variable )</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><span class="strong"><strong>Serially receive a character using a function specifically via usart1.</strong></span></p></td>
<td style="text-align: left;"> </td>
<td style="text-align: left;"> </td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">HSerReceive1</code></p></td>
<td style="text-align: left;"><p>none</p></td>
<td style="text-align: left;"><p>This function handles the incoming characters as raw ASCII values.</p>
<p>The function receives a single byte value in the range of 0 to 255.</p>
<p>The function can return only a byte value from usart 1.</p>
<p>The blocking and non-blocking mode and the methods are the same as shown in the previous method.</p>
<p>To receive an ASCII byte value via usart 1 using blocking mode use</p>
<p>#define USART_BLOCKING<br />
…<br />
…<br />
user_number_variable = <code class="literal">HSerReceive1</code></p>
<p>To receive an ASCII byte value use in non-blocking mode use. Ensure #define USART_BLOCKING is NOT defined.</p>
<p>user_number_variable = <code class="literal">HSerReceive1</code></p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><span class="strong"><strong>Serially receive a character using a function specifically via usart2</strong></span></p></td>
<td style="text-align: left;"> </td>
<td style="text-align: left;"> </td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">HSerReceive2</code></p></td>
<td style="text-align: left;"><p>none</p></td>
<td style="text-align: left;"><p>This function handles the incoming characters as raw ASCII values.</p>
<p>The function receives a single byte value in the range of 0 to 255.</p>
<p>The function can receive only a byte value from usart 2.</p>
<p>The blocking and non-blocking mode and the methods are the same as shown in the previous method.</p>
<p>To receive an ASCII byte value via usart 2 using blocking mode use</p>
<p>#define USART_BLOCKING<br />
…<br />
…<br />
user_byte_variable = <code class="literal">HSerReceive2</code></p>
<p>To receive an ASCII byte value use in non-blocking mode use. Ensure #define USART_BLOCKING is NOT defined.</p>
<p>user_byte_variable = <code class="literal">HSerReceive2</code></p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><span class="strong"><strong>Serially receive a character using a function from either usart ports using a parameter to select the usart.</strong></span></p></td>
<td style="text-align: left;"> </td>
<td style="text-align: left;"> </td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">HSerReceiveFrom</code></p></td>
<td style="text-align: left;"><p>Usart_number,<br />
Default is 1</p></td>
<td style="text-align: left;"><p>This function handles the incoming characters as raw ASCII values.</p>
<p>The function return a single byte value in the range of 0 to 255.</p>
<p>The function can receive only a byte value from usart 1 and usart 2</p>
<p>The blocking and non-blocking mode and the methods are the same as shown in the previous method.</p>
<p>To receive an ASCII byte value via usart 1 using blocking mode use</p>
<p>#define USART_BLOCKING<br />
…<br />
…<br />
user_byte_variable = <code class="literal">HSerReceiveFrom</code></p>
<p>To receive an ASCII byte value use in non-blocking mode use. Ensure #define USART_BLOCKING is NOT defined.</p>
<p>'Chosen_usart = 2<br />
user_byte_variable = <code class="literal">HSerReceiveFrom</code> (2)</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><span class="strong"><strong>Serially send a byte using any of the usart ports.</strong></span></p></td>
<td style="text-align: left;"> </td>
<td style="text-align: left;"> </td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">HSerSend</code></p></td>
<td style="text-align: left;"><p>Byte or byte_variable [,optional usart address] + The optional usart address is microcontroller specific buy can be 1, 2, 3 or 4.</p></td>
<td style="text-align: left;"><p>This subroutine sends a byte value to usart 1. No additional parameter for the usart number is used.</p>
<p><code class="literal">HSerSend</code>( user_byte )</p>
<p>To print a variable value to usart 2. Note the additional parameter for the usart address.</p>
<p><code class="literal">HSerSend</code> ( user_byte, 2 )</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><span class="strong"><strong>Serially send a byte and a CR&amp;LF using any of the usart ports</strong></span></p></td>
<td style="text-align: left;"> </td>
<td style="text-align: left;"> </td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">HSerPrintByteCRLF</code></p></td>
<td style="text-align: left;"><p>Byte or byte_variable + [,optional usart address] The optional usart address is microcontroller specific buy can be 1, 2, 3 or 4.</p></td>
<td style="text-align: left;"><p>This subroutine sends a byte value to usart 1.</p>
<p><code class="literal">HserPrintCRLF</code> users_byte,2</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><span class="strong"><strong>Serially send CR&amp;LF (can be multiple) using any of the usart ports</strong></span></p></td>
<td style="text-align: left;"> </td>
<td style="text-align: left;"> </td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">HSerPrintCRLF</code></p></td>
<td style="text-align: left;"><p>Number of CR&amp;LF to be sent + [,optional usart address] The optional usart address is microcontroller specific buy can be 1, 2, 3 or 4.</p></td>
<td style="text-align: left;"><p>This subroutine sends a CR&amp;LF to port 2.</p>
<p><code class="literal">HserPrintCRLF</code> 1,2 ' Will send a CR &amp; LF out of comport 2 to the terminal</p></td>
</tr>
</tbody>
</table>

</div>

<span class="strong">**Constants**</span> These constants affect the
operation of the hardware RS232 routines:

<div class="informaltable">

<table data-border="1">
<thead>
<tr class="header">
<th style="text-align: left;"><span class="strong"><strong>Constant Name</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Controls</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Default Value</strong></span></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">USART_BAUD_RATE</code></p></td>
<td style="text-align: left;"><p>Baud rate (in bps) for the routines to operate at.</p></td>
<td style="text-align: left;"><p>No default, user must enter a baud. Doesn’t have to be a standard baud.</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">USART_BLOCKING</code></p></td>
<td style="text-align: left;"><p>If defined, this constant will cause the USART routines to wait until data can be sent or received.</p></td>
<td style="text-align: left;"><p>No parameter needed. Use “#defining” it implement the action.</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">USART_TX_BLOCKING</code></p></td>
<td style="text-align: left;"><p>If defined, this constant will cause the Transmit USART routines to wait until Transmit register is empty before writing the next byte which prevents over running the register and losing data.</p></td>
<td style="text-align: left;"><p>No parameter needed. Use “#defining” it implement the action.</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">USART2_BAUD_RATE</code></p></td>
<td style="text-align: left;"><p>Baud rate (in bps) for the routines to operate at.</p></td>
<td style="text-align: left;"><p>No default, user must enter a baud. Doesn’t have to be a standard baud.</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">USART2_BLOCKING</code></p></td>
<td style="text-align: left;"><p>If defined, this constant will cause the USART routines to wait until data can be sent or received.</p></td>
<td style="text-align: left;"><p>No parameter needed. Use “#defining” it implement the action.</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">USART2_TX_BLOCKING</code></p></td>
<td style="text-align: left;"><p>If defined, this constant will cause the Transmit USART routines to wait until Transmit register is empty before writing the next byte which prevents over running the register and losing data.</p></td>
<td style="text-align: left;"><p>No parameter needed. Use “#defining” it implement the action.</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">USART3_BAUD_RATE</code></p></td>
<td style="text-align: left;"><p>Baud rate (in bps) for the routines to operate at.</p></td>
<td style="text-align: left;"><p>No default, user must enter a baud. Doesn’t have to be a standard baud.</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">USART3_BLOCKING</code></p></td>
<td style="text-align: left;"><p>If defined, this constant will cause the USART routines to wait until data can be sent or received.</p></td>
<td style="text-align: left;"><p>No parameter needed. Use “#defining” it implement the action.</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">USART3_TX_BLOCKING</code></p></td>
<td style="text-align: left;"><p>If defined, this constant will cause the Transmit USART routines to wait until Transmit register is empty before writing the next byte which prevents over running the register and losing data.</p></td>
<td style="text-align: left;"><p>No parameter needed. Use “#defining” it implement the action.</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">USART4_BAUD_RATE</code></p></td>
<td style="text-align: left;"><p>Baud rate (in bps) for the routines to operate at.</p></td>
<td style="text-align: left;"><p>No default, user must enter a baud. Doesn’t have to be a standard baud.</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">USART4_BLOCKING</code></p></td>
<td style="text-align: left;"><p>If defined, this constant will cause the USART routines to wait until data can be sent or received.</p></td>
<td style="text-align: left;"><p>No parameter needed. Use “#defining” it implement the action.</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">USART4_TX_BLOCKING</code></p></td>
<td style="text-align: left;"><p>If defined, this constant will cause the Transmit USART routines to wait until Transmit register is empty before writing the next byte which prevents over running the register and losing data.</p></td>
<td style="text-align: left;"><p>No parameter needed. Use “#defining” it implement the action.<br />
<br />
</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">USART_DELAY</code></p></td>
<td style="text-align: left;"><p>This is the delay between characters.</p></td>
<td style="text-align: left;"><p><code class="literal">1 ms</code></p>
<p>To disable this delay between characters …​ Use #define <code class="literal">USART_DELAY  0 MS</code>, or, To disable this delay between characters …​ Use #define <code class="literal">USART_DELAY  OFF</code></p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">CHECK_USART_BAUD_RATE</code></p></td>
<td style="text-align: left;"><p>Instruct the compiler to show the real BPS to be used</p></td>
<td style="text-align: left;"><p>Not the default operation</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">ISSUE_CHECK_USART_BAUD_RATE_WARNING</code></p></td>
<td style="text-align: left;"><p>Instruct the compiler to show BPS calculation errors</p></td>
<td style="text-align: left;"><p>Not the default operation</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">SerPrintCR</code></p></td>
<td style="text-align: left;"><p>Causes a Carriage return to be sent after every HserPrint automatically.</p></td>
<td style="text-align: left;"><p>No parameter needed. User “#defining” it implements the action</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">SerPrintLF</code></p></td>
<td style="text-align: left;"><p>Causes a LineFeed to be sent after every HserPrint. Some communications require both CR and LF</p></td>
<td style="text-align: left;"><p>No parameter needed. User “#defining” it implements the action</p></td>
</tr>
</tbody>
</table>

</div>

</div>
