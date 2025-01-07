<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="_initser"></span>InitSer

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
   InitSer channel, rate, start, data, stop, parity, invert
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

This command will set up the serial communications. The parameters are
as follows:

`channel` is 1, 2 or 3, and refers to the I/O ports that are used for
communication.

`rate` is the bit rate, which is given by the letter r and then the
desiredrate in bps. Acceptable units are r300, r600, r1200, r2400,
r4800, r9600 and r19200.

`start` gives the number of start bits, which is usually 1. To make the
microcontroller wait for the start bit before proceeding with the
receive, add 128 to `start`. (Note: it may be desirable to use the
`WaitForStart` constant here.)

`data` tells the program how many data bits are to be sent or received.
In most situations t his is 8, but it can range between 1 and 8,
inclusive.

`stop` is the number of stop bits. If <span
class="emphasis">*start*</span> bit 7 is on, then this number will be
ignored.

`parity` refers to a system of error checking used by many devices. It
can be odd (in which there must always be an odd number of high bits),
even (where the number of high bits must always be even), or none (for
systems that do not use parity).

`invert` can be either "normal" or "invert". If it in "invert", then
high bits will be changed to low, and low to high.

<span class="strong">**Example:**</span>

Please refer to
<a href="_sersend.html" class="link" title="SerSend">SerSend</a> for an
example of `InitSer`

<span class="strong">**For more help, see**</span>
<a href="_rs232_software_overview.html" class="link" title="RS232 Software Overview">RS232 Software Overview</a>

</div>
