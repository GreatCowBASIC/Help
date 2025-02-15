<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="keypad_overview"></span>Keypad Overview

</div>

</div>

</div>

<span class="strong">**Introduction**</span>

The keypad routines allow for a program to read from a 4 x 4 matrix
keypad.

There are two ways that the keypad routines can be set up. One option is
to connect the wires from the keypad in a particular order, and then to
set the KeypadPort constant. The other option is to connect the keypad
in whatever way is easiest, and then set the `KEYPAD_ROW_x` and
`KEYPAD_COL_x` constants. The option (setting `KeypadPort`) will
generate slightly more efficient code.

<span class="strong">**Configuration using**</span> `KEYPAD_ROW_x` <span
class="strong">**and**</span> `KEYPAD_COL_x`:

These constants must be set:

<div class="informaltable">

| <span class="strong">**Constant Name**</span> | <span class="strong">**Controls**</span>                                    | <span class="strong">**Default Value**</span> |
|:----------------------------------------------|:----------------------------------------------------------------------------|:----------------------------------------------|
| `KEYPAD_ROW_1`                                | The pin on the microcontroller that connects to the Row 1 pin on the keypad | N/A                                           |
| `KEYPAD_ROW_2`                                | The pin on the microcontroller that connects to the Row 2 pin on the keypad | N/A                                           |
| `KEYPAD_ROW_3`                                | The pin on the microcontroller that connects to the Row 3 pin on the keypad | N/A                                           |
| `KEYPAD_ROW_4`                                | The pin on the microcontroller that connects to the Row 4 pin on the keypad | N/A                                           |
| `KEYPAD_COL_1`                                | The pin on the microcontroller that connects to the Col 1 pin on the keypad | N/A                                           |
| `KEYPAD_COL_2`                                | The pin on the microcontroller that connects to the Col 2 pin on the keypad | N/A                                           |
| `KEYPAD_COL_3`                                | The pin on the microcontroller that connects to the Col 3 pin on the keypad | N/A                                           |
| `KEYPAD_COL_4`                                | The pin on the microcontroller that connects to the Col 4 pin on the keypad | N/A                                           |

</div>

If using a 3 x 3 keypad, do not set the `KEYPAD_ROW_4` or `KEYPAD_COL_4`
constants.

<span class="strong">**Configuration using**</span> `KeypadPort`:

When setting up the keypad code using the `KeypadPort` constant, only
`KeypadPort` needs to be set.

Pull-ups or pull-downs go on the columns only, and are typically 4.7k to
10k in value.

<div class="informaltable">

| <span class="strong">**Constant Name**</span> | <span class="strong">**Controls**</span>                              | <span class="strong">**Default Value**</span> |
|:----------------------------------------------|:----------------------------------------------------------------------|:----------------------------------------------|
| `KeypadPort`                                  | The port on the microcontroller chip that the keypad is connected to. | N/A                                           |

</div>

<span class="strong">**Configuration when using Pull down
resistors**</span>

The keypad routine has a feature when using pull-down resistors, simply
add the constant to your program and the and the scan logic will be
inverted appropriately.

<div class="informaltable">

| <span class="strong">**Constant Name**</span> | <span class="strong">**Controls**</span> | <span class="strong">**Default Value**</span> |
|:----------------------------------------------|:-----------------------------------------|:----------------------------------------------|
| `KEYPAD_PULLDOWN`                             | Support pull down resistors.             | N/A                                           |

</div>

For this to work, the keypad must be connected as follows:

<div class="informaltable">

| <span class="strong">**Microcontroller port pin**</span> | <span class="strong">**Keypad connector**</span> |
|:---------------------------------------------------------|:-------------------------------------------------|
| 0                                                        | Row 1                                            |
| 1                                                        | Row 2                                            |
| 2                                                        | Row 3                                            |
| 3                                                        | Row 4                                            |
| 4                                                        | Column 1                                         |
| 5                                                        | Column 2                                         |
| 6                                                        | Column 3                                         |
| 7                                                        | Column 4                                         |

</div>

Note: To use a 3 x 3 keypad in this mode, the pins on the
microcontroller for any unused columns must be pulled up.

</div>
