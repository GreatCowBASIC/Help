<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="lcd_width"></span>LCD\_WIDTH

</div>

</div>

</div>

<span class="strong">**Using LCD\_WIDTH:**</span>

This constant changes the width characteristics of a LCD display.    The
standard width is assumed to be 20 characters.

This constant allows the width to be optimised for specific LCD
chipsets.

<span class="strong">**Example**</span>

``` literallayout
#DEFINE LCD_WIDTH  16
```

<div class="informaltable">

<table data-border="1">
<thead>
<tr class="header">
<th style="text-align: left;">Define</th>
<th style="text-align: left;">Required Connections</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">LCD_WIDTH</code></p></td>
<td style="text-align: left;"><p>Default is 20<br />
<code class="literal">16</code> - Set the WIDTH 16 characters<br />
</p></td>
</tr>
</tbody>
</table>

</div>

If `LCD_WIDTH` is not defined, the WIDTH defaults to `20`

</div>
