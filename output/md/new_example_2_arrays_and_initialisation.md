<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="new_example_2_arrays_and_initialisation"></span>New Example 2: Arrays and Initialisation

</div>

</div>

</div>

``` programlisting
    ' Create an array of 10 bytes, all initialised to zero
    Dim DataList(10) As Byte = 0          ' <<< Dim on an array, with an initial value applied to every element

    ' Create a word array with no initial values
    Dim WordList(4) As Word

    DataList(1) = 15
    WordList(0) = 1024
```

<span class="strong">**Key line:**</span>
`Dim DataList(10) As Byte = 0` — declares a 10-element `Byte` array and
initialises every element to `0`, guaranteeing its starting contents
even on chip families that do not zero-initialise RAM.

Note: on chip families that do not zero-initialise by default (see the
table under "Dim" above), `WordList` will contain unknown values until
written to; only `DataList` is guaranteed zero here because it is
explicitly initialised.

</div>
