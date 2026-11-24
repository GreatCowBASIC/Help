<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="new_example_1_basic_variables_with_initial_values"></span>New Example 1: Basic Variables with Initial Values

</div>

</div>

</div>

``` programlisting
    ' Demonstrates variable declarations with and without initial values

    Dim Count As Byte = 5          ' <<< Dim with a type and an initial value -- the syntax this page documents
    Dim Threshold As Word = 300
    Dim Mode As Byte
    Dim Ready As Bit = 1

    Mode = 2
```

<span class="strong">**Key line:**</span>
`Dim Count As Byte = 5` — declares `Count` as a `Byte` and sets its
starting value in one statement, guaranteeing it (unlike `Mode`, which
is undefined until set) even on chip families that do not
zero-initialise RAM.

</div>
