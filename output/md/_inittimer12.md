<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="_inittimer12"></span>InitTimer12

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
InitTimer12 prescaler, postscaler
```

<span class="strong">**Command Availability:**</span>

Available on Microchip microcontrollers with a Timer 12 module.

  
  

<span class="strong">**Explanation:**</span>

Parameters for this timer are detailed in the table below:

<div class="informaltable">

| Parameter    | Description                                                                                     |
|:-------------|:------------------------------------------------------------------------------------------------|
| `prescaler`  | The value of the prescaler for this specific timer. See the tables below for permitted values.  |
| `postscaler` | The value of the postscaler for this specific timer. See the tables below for permitted values. |

</div>

  
  

`prescaler` can be one of the following settings:

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
<td style="text-align: center;"><p>1:1</p></td>
<td style="text-align: left;"><p><code class="literal">PS12_1</code></p></td>
<td style="text-align: center;"><p>0</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:4</p></td>
<td style="text-align: left;"><p><code class="literal">PS12_4</code></p></td>
<td style="text-align: center;"><p>1</p></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p>1:16</p></td>
<td style="text-align: left;"><p><code class="literal">PS12_16</code></p></td>
<td style="text-align: center;"><p>2</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:64</p></td>
<td style="text-align: left;"><p><code class="literal">PS12_64</code></p></td>
<td style="text-align: center;"><p>3</p></td>
</tr>
</tbody>
</table>

</div>

Note that a 1:64 prescale is only avaialable on certain midrange
microcontrollers. Please refer to the datasheet to determine if a 1:64
prescale is supported by a spectific microcontroller.

  
  

`postscaler` slows the rate of the interrupt generation (or WDT reset)
from a counter/timer by dividing it down.

On Microchip PIC microcontroller one of the following constants where
the Postscaler Rate Select bits are in the range of 1 to 16.

<div class="informaltable">

| <span class="strong">**Postcaler Value**</span> | <span class="strong">**Use Numeric Constant**</span> |
|:-----------------------------------------------:|:----------------------------------------------------:|
|                 1:1 Postscaler                  |                          0                           |
|                 1:2 Postscaler                  |                          1                           |
|                 1:3 Postscaler                  |                          2                           |
|                 1:4 Postscaler                  |                          3                           |
|                 1:5 Postscaler                  |                          4                           |
|                 1:6 Postscaler                  |                          5                           |
|                 1:7 Postscaler                  |                          6                           |
|                 1:8 Postscaler                  |                          7                           |
|                 1:9 Postscaler                  |                          8                           |
|                 1:10 Postscaler                 |                          9                           |
|                 1:11 Postscaler                 |                          10                          |
|                 1:12 Postscaler                 |                          11                          |
|                 1:13 Postscaler                 |                          12                          |
|                 1:14 Postscaler                 |                          13                          |
|                 1:15 Postscaler                 |                          14                          |
|                 1:16 Postscaler                 |                          15                          |

</div>

</div>
