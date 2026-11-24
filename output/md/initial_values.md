<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="initial_values"></span>Initial Values

</div>

</div>

</div>

You may optionally assign an initial value using `= value`:

``` programlisting
    Dim Counter As Byte = 10
    Dim Temperature As Integer = -5
    Dim Flag As Bit = 1
```

This improves readability and reduces the need for separate
initialisation code. It is also the only way to guarantee a variable’s
starting value on chip families that do not zero-initialise variables by
default (see the table above).

Initialisation is supported for:

<div class="itemizedlist">

-   Byte, Integer, Word, Long, Float
-   Bit variables
-   Aliased variables (if the alias target is valid)
-   Arrays (initial value applies to all elements if supported by the
    compiler)

</div>

Example:

``` programlisting
    Dim Buffer(8) As Byte = 0
```

</div>
