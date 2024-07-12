<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="variable_memory_allocation"></span>Variable Memory Allocation

</div>

</div>

</div>

This section discusses the allocation of variables to RAM ( GPR, SRAM or
other TLA).

Variables in GCBASIC can be bits, bytes, words, integers, longs, arrays
or reals.   This section will NOT address reals as these are
developmental variables only.

Variables can also be defined as Aliases - this is discussed later in
this section.

<span class="strong">**Basic variable allocation**</span>

Variables of type <span class="emphasis">*byte*</span>, <span
class="emphasis">*word*</span>, <span class="emphasis">*integer*</span>,
<span class="emphasis">*longs*</span> are placed in RAM using the
following simple rules.

<div class="orderedlist">

1.  A RAM memory location is automatically assigned starting at the
    first available memory location.
2.  The first memory location is first RAM location as defined in the
    chip datasheet.
3.  Once a variable is allocated the RAM location is marked as used and
    this specific location can be reviewed in the ASM source.
4.  Bytes use a single RAM location, words two RAM locations, integer
    and longs four RAM locations.
5.  Subsequent variables of type byte, word, integer, longs are placed
    in RAM at the next available RAM location.

</div>

Variables of <span class="emphasis">*array*</span> and <span
class="emphasis">*strings*</span> type are placed in RAM using the
following simple rules.

<div class="orderedlist">

1.  A RAM memory location is automatically assigned from the end of RAM
    less the ( size of the array + 1 byte ).
2.  The last memory location is last RAM location as defined in the chip
    datasheet.
3.  Once an array is allocated the RAM location is marked as used and
    the start of the array RAM location can be reviewed in the ASM
    source.
4.  Subsequent variables of type array in RAM at the next available RAM
    location subtracted from the start the of previous RAM location
    minus the size of this next array.

</div>

Variables of <span class="emphasis">*bit*</span> type are placed in RAM
using the following simple rules.

<div class="orderedlist">

1.  Bit memory location is automatically assigned to the first bit with
    the creation of a BYTE variable at a RAM memory location that is
    automatically assigned starting at the first available memory
    location.    This byte can handle 8 bits.
2.  Once a bit is allocated the byte is marked as used and this specific
    location can be reviewed in the ASM source.
3.  Subsequent bits are allocation either to an existing byte variable,
    or when 8 bits are allocated to an existing byte variable another
    byte variable will be created.

</div>

<span class="strong">**Addressing Variables**</span>

Addressing variable can be achieved by using the @ prefix.    This will
return the address of the variable (the same @ applies to table data).

The following example shows registers DMAnSSAU, DMAnSSAH, DMAnSSAL being
loaded with the address of the array WaveArray.

``` screen
    ' Source start address
    Dim addressdummy as byte
    Dim DMAnSS as long ALIAS addressdummy, DMAnSSAU, DMAnSSAH, DMAnSSAL
    DMAnSS = @WaveArray
```

  

<span class="strong">**AT allocation**</span>

The Dim variable command can be used to instruct GCBASIC to allocate
variables at a specific memory location using the parameter AT.

The compiler will inspect the provided AT memory location and if the
memory location is already used ( by an existing variable), lower than
the minimum memory location or greater than the maximum memory location
an error will be issued.

  
<span class="strong">**Variable Aliases**</span>

Variable can be defined as aliases.    Aliases are used to refer to
existing memory locations SFR or RAM and aliases can be used to
construct other variables.   Constructed variables can be a mix ( or not
) of SFR or RAM.    These are useful for joining predefined byte
variables together to form a word/long variable.

Aliases are not like pointers in many languages - they must always refer
to an existing variable or variables and cannot be changed.

When setting a register/variable bit ( i.e
my\_variable.my\_bit\_address\_variable ) and using a alias for the
variable then you must ensure the bytes that construct the variable are
consecutive.

Aliases are shown in the ASM source in the ;ALIAS VARIABLES section.

The coding approach should be to DIMension the variable (word, integer,
or long) first, then create the byte aliases:

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

<span class="strong">**Memory Specification**</span>

All memory specifics like RAM size, lower and upper RAM addresses are
specified in the chip specific dat file.

The dat file details should be reviewed in PICINFO application. See the
PICINFO/CHIPDATA tab for RAM and MaxAddress etc.

A simple calculation is MaxAddress - RAM +1 = the 'first memory
address'. And, 'first memory address' + RAM -1 = 'the last memory
address.

This can be confirmed by review the DAT file. See the section
\[FreeRAM\] for the start and end of RAM.

The dat file also has a \[NoBankRAM\]. NoBankRAM is somewhat misnamed -
it is used for the defintion of (any) access bank locations.   If a
memory location is defined in both NoBankRAM and FreeRAM, then the
compiler knows that it is access bank RAM.  If an SFR location is in one
of the NoBankRAM ranges, then the compiler knows not to do any bank
selection when accessing that register.

The \[NoBankRAM\] section includes two ranges, one for access bank RAM,
one for access bank SFRs. The first range MUST be the ACCESS RAM range
The first range is the FAST SFR range

If there are no ranges defined in NoBankRAM, the compiler will try to
guess them.   On 18Fs, it will guess based on where the lowest SFR is,
and from what the total RAM on the chip is.   If there’s only one range
defined.    in the NoBankRAM locations, the compiler will assume that is
the range for the RAM, and then will guess where the range for the
access bank SFRs is.

``` screen
    'GCBASIC/GCGB Chip Data File
    'Chip: 18F27Q43

    [ChipData]

    .... many other data rows

    'This constant is exposed as ChipRAM
    RAM=8192             'Dec values

    .... many other data rows

    'This constant is exposed as ChipMaxAddress
    MaxAddress=9471      'Dec values

    .... many other data rows

    [FreeRAM]
    500:24FF             'Hex value

    [NoBankRAM]
    500:55F              'Hex value
    460:4FF              'Hex value

    .... many other data rows
```

  

In the example shown above the following can be extracted.  

<div class="orderedlist">

1.  RAM size: RAM = 8192d
2.  Minimum RAM address: FREERAM = 0x500
3.  Maximum RAM address: FREERAM = 0x24FF
4.  Maximum RAM address: MAXADDRESS=9471d or 0x24FF
5.  ACCESS RAM: NOBANKRAM = 0x500-0x55F
6.  BANKED SFR: NOBANKRAM = 0x460-0x4FF

</div>

  
  

</div>
