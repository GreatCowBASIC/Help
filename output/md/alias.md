<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="alias"></span>Alias

</div>

</div>

</div>

Alias creates a variable that shares the same memory location as another
variable: These are useful for joining predefined byte variables
together to form a word/long variable. When reading or writing to this
variable, it is effectively the aliases that are being read or written
to.   Aliases are used to refer to existing memory locations SFR or RAM
and aliases can be used to construct other variables.   Constructed
variables can be a mix ( or not ) of SFR or RAM.    These are useful for
joining predefined byte variables together to form a word/long variable.

Aliases are not like pointers in many languages - they must always refer
to an existing variable or register.

When setting a register/variable bit ( i.e
my\_variable.my\_bit\_address\_variable ) and using a alias for the
variable then you must ensure the bytes that construct the variable are
consecutive.

Alias and At cannot be used together on the same declaration line.  
Alias does not support Bit variables.    For bit‑level aliasing, use
constants or \#Define macros.

Aliases are alaways shown in the ASM source in the ;ALIAS VARIABLES
section.

The coding approach should be to DIMension the variable (word, integer,
or long) first, then create the byte aliases:

Example 1:

``` screen
    Dim my_variable as LONG
    Dim ByteOne   as Byte alias my_variable_E
    Dim ByteTwo   as Byte alias my_variable_U
    Dim ByteThree as Byte alias my_variable_H
    Dim ByteFour  as Byte alias my_variable

    Dim my_bit_address_variable as Byte
    my_bit_address_variable = 23

    'set the bit in the variable
    my_variable.my_bit_address_variable = 1

    'then, use the four byte variables as you need to.
```

To set a series of registers that are not consecutive, it is recommended
to use a mask variable then apply it to the registers:

Example 2:

``` screen
    Dim my_variable as LONG
    Dim my_bit_address_variable as Byte
    my_bit_address_variable = 23

    'set the bit in the variable
    my_variable.my_bit_address_variable = 1

    porta =  my_variable_E
    portb =  my_variable_E
    portc =  my_variable_E
    portd =  my_variable_E
```

Example 3:

``` screen
        Dim MyADResult As Word Alias ADRESH, ADRESL
        //MyADResult reads the A/D values stored in registers ADRESH, ADRESL
```

Example4:

``` screen
    dim Myhibyte, Mylobyte as Byte
    dim Myvariable As Word Alias Myhibyte, Mylobyte
    Myvariable=294
    //294 is stored here: Myhibyte=1 Mylowbyte=38.
```

</div>
