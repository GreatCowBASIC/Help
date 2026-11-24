<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="new_example_3_bit_level_access_using_constants"></span>New Example 3: Bit-Level Access Using Constants

</div>

</div>

</div>

``` programlisting
    #Option Explicit
    #Chip 16F1825, 32

    Dim SerialByte As Byte = 0          ' <<< the Dim declaration this page documents

    #Define STATUSREADY  SerialByte.0
    #Define STATUSERROR  SerialByte.1
    #Define STATUSMOTOR  SerialByte.2

    Do
        SerialByte = SerialByte + 1

        If STATUSREADY = 1 Then
            STATUSERROR = 0
        End If

        If STATUSERROR = 1 Then
            STATUSMOTOR = 0
        End If
    Loop
```

<span class="strong">**Key line:**</span>
`Dim SerialByte As Byte = 0` — declares the single backing byte that the
three `#Define` bit constants below then address individually, starting
it at a known value of `0` rather than an undefined one.

</div>
