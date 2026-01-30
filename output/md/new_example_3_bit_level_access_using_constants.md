<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="new_example_3_bit_level_access_using_constants"></span>New Example 3: Bit‑Level Access Using Constants

</div>

</div>

</div>

``` screen
    #Option Explicit
    #Chip 16F1825, 32

    Dim SerialByte As Byte = 0

    #Define StatusReady  SerialByte.0
    #Define StatusError  SerialByte.1
    #Define StatusMotor  SerialByte.2

    Do
        SerialByte = SerialByte + 1

        If StatusReady = 1 Then
            StatusError = 0
        End If

        If StatusError = 1 Then
            StatusMotor = 0
        End If
    Loop
```

<span class="strong">**For more help, see:**</span>
<a href="serprint" class="link" title="SerPrint">SerPrint</a> for
string handling examples and
<a href="variables" class="link" title="Variables">Variables Types</a>
for more information on variable types.

</div>
