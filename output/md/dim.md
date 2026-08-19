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

If no initial value is provided, the starting state of the variable
depends on the target chip family. Do not assume a variable starts at
zero unless you have explicitly initialised it or confirmed your target
is in the "initialised to zero" category below.

<div class="informaltable">

| Chip Family                                              | Behaviour without an initial value                                                                                                                                                                     |
|:---------------------------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| AVR Dx (e.g. AVR128DA, AVR64DB, etc.)                    | Initialised to zero                                                                                                                                                                                    |
| LGT (LGT8F series)                                       | Initialised to zero                                                                                                                                                                                    |
| All other supported chips (PIC, classic/early AVR, etc.) | Unknown/undefined state — the variable holds whatever value was already present in memory (e.g. left over from a previous program, or the power-on state of RAM) until your program explicitly sets it |

</div>

<span class="strong">**Command Availability:**</span> Available on all
microcontrollers.

</div>
