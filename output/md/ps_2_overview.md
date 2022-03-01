<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="ps_2_overview"></span>PS/2 Overview

</div>

</div>

</div>

<span class="strong">**PS2 Overview**</span>

These routines make it easier to communicate with a PS/2 device,
particularly an external keyboard.

<span class="strong">**Relevant Constants**</span>

These constants affect the operation of the PS/2 routines:

<div class="informaltable">

| <span class="strong">**Constant Name**</span> | <span class="strong">**Controls**</span>                                                                                     | <span class="strong">**Default Value**</span> |
|:----------------------------------------------|:-----------------------------------------------------------------------------------------------------------------------------|:----------------------------------------------|
| `PS2Data`                                     | Pin connected to PS/2 data line                                                                                              | Must be specified                             |
| `PS2Clock`                                    | Pin connected to PS/2 clock line.                                                                                            | Must be specified                             |
| `PS2_DELAY`                                   | This constant can be set to a delay, such as 10 ms. If set, a delay will be added at the end of every byte sent or received. | Not set                                       |

</div>

<span class="strong">**Connections between the Keyboard and the
Microcontroller**</span> The following diagram show a typical connection
between the keyboard and the microcontroller. The value of R1 and R2 is
typically 4.7k for a 5v system.

<div class="informalfigure">

<div class="mediaobject" align="center">

![\[graphic](./images/overview_ps21.PNG)

</div>

</div>

</div>
