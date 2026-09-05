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

``` programlisting
    #DEFINE LCD_WIDTH  16          ' <<< the constant this page documents

    Do
      CLS
      Locate 0, 0
      Print "1234567890123456"          'fills all 16 columns of a 16-character-wide LCD
      Wait 2 s
    Loop
```

<span class="strong">**Key line:**</span> `#DEFINE LCD_WIDTH 16` — tells
the LCD driver the display is 16 characters wide instead of the default
20, so commands such as `Locate` and word-wrap behaviour in `Print` stay
within the physical bounds of the panel.

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

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="lcd_io_4" class="link" title="LCD_IO 4">LCD_IO 4</a> — setting
    up a 4-bit character LCD connection
-   <a href="locate" class="link" title="Locate">Locate</a> — positioning
    the cursor within the display width set here
-   <a href="print" class="link" title="Print">Print</a> — printing
    text that wraps within the display width

</div>

</div>
