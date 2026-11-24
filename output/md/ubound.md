<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="ubound"></span>UBound

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    output = UBound( array_name )
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers. From build 1644.

<span class="strong">**Explanation:**</span>

The `UBound` function returns the number of elements declared for an
array, exactly as written in its `Dim` statement. Because an array’s
size is fixed at compile time, `UBound` is resolved entirely by the
compiler — the call is replaced with a plain numeric constant before the
program is assembled. It costs no RAM and no runtime instructions to
use.

``` programlisting
    Dim Buffer(512) As Byte
    Dim BufferSize As Word

    BufferSize = UBound(Buffer)          ' <<< resolves to the literal 512
```

<span class="strong">**Key line:**</span> `UBound(Buffer)` — compiles
directly to the constant `512`; nothing is read from memory at runtime.

This replaces the older workaround of maintaining a separate `#Define`
constant purely to remember an array’s size:

``` programlisting
    Dim MySensorReadings(10) As Word

    For i = 1 to UBound(MySensorReadings)
        MySensorReadings(i) = 0
    Next
```

<span class="strong">**Key line:**</span>
`UBound(MySensorReadings)` — always matches the array’s actual declared
size, even if the `Dim` line above it is edited later, because it reads
the size from the declaration itself rather than from a second,
hand-maintained constant that could drift out of sync.

`UBound` also works on a fixed-length `String` variable, returning its
declared maximum length in characters — see
<a href="dim" class="link" title="Dim">Dim</a> for why strings and
arrays share this size mechanism internally.

``` programlisting
    Dim Greeting As String * 20
    Dim MaxChars As Byte

    MaxChars = UBound(Greeting)          ' <<< resolves to the literal 20
```

<span class="strong">**Constraint:**</span> `UBound` only accepts the
name of an array or a `String` variable. Using it on a plain scalar
variable (a `Byte`, `Word`, etc. that was not declared with array
brackets) raises a compile-time error, since a scalar has no declared
element count to return.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="arrays" class="link" title="Arrays">Arrays</a> — declaring
    arrays, and how element 0 is used (or not used)
-   <a href="dim" class="link" title="Dim">Dim</a> — declaring
    arrays and strings
-   <a href="len" class="link" title="Len">Len</a> — the runtime
    length of a string’s current contents, as opposed to its declared
    maximum size

</div>

</div>
