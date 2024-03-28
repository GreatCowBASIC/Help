<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="ds18b20"></span>DS18B20

</div>

</div>

</div>

The DS18B20 is a 1-Wire digital temperature sensor from Maxim IC.

The sensor reports degrees C with 9 to 12-bit precision from -55C to
125C (+/- 0.5C).

Each sensor has a unique 64-Bit Serial number etched into it. This
allows for a number of sensors to be used on one data bus. This sensor
is used in many data-logging and temperature control projects.

Reading the temperature from a DS18B20 takes up to 750ms(max).

To use the DS18B20 driver the following is required to added to the
GCBASIC source file.

``` screen
    #include <DS18B20.h>
```

Note the GCBASIC commands do not work with the older DS1820 or DS18S20
as they have a different internal resolution.

These commands are not designed to be used with parasitically powered
DS18B20 sensors.

<div class="informaltable">

<table data-border="1">
<thead>
<tr class="header">
<th style="text-align: left;">Command</th>
<th style="text-align: left;">Usage</th>
<th style="text-align: left;">Returns</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><p>ReadDigitalTemp</p></td>
<td style="text-align: left;"><p>Returns two global variables.  As follows:</p>
<p><span class="strong"><strong><code class="literal">DSint</code></strong></span> the integer value read from the sensors <span class="strong"><strong><code class="literal">DSdec</code></strong></span> the string value read from the sensors</p></td>
<td style="text-align: left;"><p>Byte variables: <span class="strong"><strong><code class="literal">DSint</code></strong></span></p>
<p>String variable: <span class="strong"><strong><code class="literal">DSdec</code></strong></span></p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>ReadTemp</p></td>
<td style="text-align: left;"><p><span class="strong"><strong><code class="literal">ReadTemp</code></strong></span> is a function that returns the raw value of the sensor.</p>
<p>The temperature is read back in whole degree steps, and the sensor operates from -55 to + 125 degrees Celsius.; &amp;#160Note that bit 7 is 0 for positive temperature values and 1 for negative values (ie negative values will appear as 128 + numeric value).</p></td>
<td style="text-align: left;"><p>Word variable via the ReadTemp() function</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>ReadTemp12</p></td>
<td style="text-align: left;"><p><span class="strong"><strong><code class="literal">ReadTemp</code></strong></span> is a function that returns the raw 12bit value of the sensor.</p>
<p>The temperature is read back as the raw 12 bit data into a word variable (0.0625 degree resolution).; &amp;#160The user must interpret the data through mathematical manipulation. See the DS18B20 datasheet for more information on the 12 bit temperature/data information construct.</p></td>
<td style="text-align: left;"><p>Word variable via the ReadTemp12() function</p></td>
</tr>
</tbody>
</table>

</div>

  
  

<span class="strong">**For more help, see**</span>
<a href="readdigitaltemp" class="link" title="ReadDigitalTemp">ReadDigitalTemp</a>,
<a href="readtemp" class="link" title="ReadTemp">ReadTemp</a> or
<a href="readtemp12" class="link" title="ReadTemp12">ReadTemp12</a>

</div>
