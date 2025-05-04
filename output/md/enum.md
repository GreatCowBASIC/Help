<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="enum"></span>Enum

</div>

</div>

</div>

<span class="strong">**Overview**</span>

Enums in GCBASIC provide a convenient way to define named constants,
improving code readability and maintainability.    Instead of using raw
numeric values, users can define meaningful names for states, modes, or
categories.

<span class="strong">**Syntax:**</span>

The `Enum` keyword allows users to declare an enumeration with automatic
assignment of values:

``` programlisting
Enum ModbusState [Reset]
    MODBUS_IDLE           ' Waiting for a new message
    MODBUS_SYNC           ' Sync with Modbus device address
    MODBUS_FUNCTION_CODE  ' Identify function code
    MODBUS_PROCESS_DATA   ' Read incoming data bytes
    MODBUS_COMPLETE       ' Packet processing finished
End Enum
```

The optional `Reset` parameter will start this specific enum at
zero.  If `Reset` is not specified then every enum element will be
sequentially/uniquely numbered.

<span class="strong">**Enhanced Compatibility with External
Systems**</span>

Many protocols, such as Modbus, require specific numeric values for
states or function codes.    By letting users define their own values,
they can align their enums with standardised protocols.   The `Enum`
keyword also allows users to declare an enumeration with named
constants:

``` programlisting
Enum ModbusState
    MODBUS_IDLE = 1
    MODBUS_SYNC = 0x02
    MODBUS_FUNCTION_CODE = 0x03
    MODBUS_PROCESS_DATA = MODBUS_FUNCTION_CODE + 1
    MODBUS_COMPLETE = INT((30/2)+1)
End Enum
```

Users can manually assign enumeration values using constants and
expressions.    <span class="strong">**Calculations must use the equals
sign (`=`), following `#DEFINE` rules.**</span>

<span class="strong">**Usage**</span>

Users can declare variables of an enum type and assign values directly:

``` programlisting
Dim currentState As Byte
currentState = MODBUS_IDLE
```

Enums can be used in conditions for more readable logic:

``` programlisting
If currentState = MODBUS_FUNCTION_CODE Then
    ' Handle function code processing
End If
```

Users can also define additional Enum values using constants:

``` programlisting
#DEFINE CUSTOM_STATE = MODBUS_PROCESS_DATA + 2
If currentState = CUSTOM_STATE Then
    Print "Custom processing step reached."
End If
```

<span class="strong">**Conversion Support**</span>

Enums in GCBASIC can be used in mathematical operations and references
to other constants.    This allows developers to integrate enums
seamlessly into calculations and logical expressions.

<span class="strong">**Math Operations**</span>

Users can use enums in arithmetic expressions since they resolve to
numeric values:

``` programlisting
Dim nextState As Byte
nextState = MODBUS_SYNC + 1 ' Evaluates to MODBUS_FUNCTION_CODE
```

Enums can also be used in expressions involving comparisons:

``` programlisting
If currentState < MODBUS_COMPLETE Then
    ' Keep processing data
End If
```

<span class="strong">**Reference to Other Constants**</span>

Since enum values are numeric, users can reference them in calculations
that involve predefined constants:

``` programlisting
#DEFINE MAX_STATE = MODBUS_COMPLETE
If currentState = MAX_STATE Then
    Print "Processing complete."
End If
```

<span class="strong">**Summary**</span>

<div class="itemizedlist">

-   Users can use automatic enumeration values.
-   Users can manually assign enumeration values using constants and
    calculations.
-   Calculations must use the equals sign (`=`), following GCBASIC’s
    `#DEFINE` rules.
-   Enums allow users to define named constants.
-   Values start at `0` and increment automatically if not manually
    assigned.
-   Enums improve readability and eliminate the need for magic numbers.
-   Enums can be used in mathematical operations and references to
    constants.

</div>

</div>
