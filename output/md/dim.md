<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="dim"></span>Dim

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    For Variables:
    Dim variable    // will define a Byte variable
    Dim variable [As type]
    Dim variable [As type] [= initialvalue]
    Dim variable[, variable2 [, variable3]] [As type] [Alias othervar [, othervar2]]  [= initialvalue]
    Dim variable[, variable2 [, variable3]] [As type] [At location] [= initialvalue]

    For Arrays:
    Dim array(size) [As type] [At location]

    For Strings:
    Dim string [* size] [At location]
```

<span class="strong">**Explanation:**</span>

The `Dim` command is used to declare variables, arrays, and strings. It
can also create aliases for existing variables or place variables at
specific memory locations.

For PiC and early AVR, the variable is an undefined value unless
explicitly set within a user program.

GCBASIC supports <span class="strong">**optional initialisation**</span>
at the point of declaration:

``` screen
    Dim byte_var As Byte = 1
```

This sets the variable to the specified value at program start. The
traditional form remains fully valid:

``` screen
    Dim byte_var As Byte
```

If no initial value is provided, the variable is initialised to zero
unless the compiler determines otherwise.

<span class="strong">**Command Availability:**</span> Available on all
microcontrollers.

</div>
