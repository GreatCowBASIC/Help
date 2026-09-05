<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="len"></span>Len

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    output= Len( string )
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The `Len` function returns a byte value that is the length of a phrase
or sentence, including spaces. The format is:

``` programlisting
    target_byte_variable = Len("Phrase")
```

Another example: this code loops through the `For`-`Next` loop 12 times,
as determined by the length of the string.  

``` programlisting
    ' create a test string of 12 characters
    dim teststring as string * 12

    teststring = "0123456789AB"
    for loopthrustring = 1 to len(teststring)          ' <<< the Len instruction
       hserprint mid(teststring, loopthrustring , 1)
    next
```

<span class="strong">**Key line:**</span> `len(teststring)` — returns
`12`, the number of characters in `teststring`, so the loop runs exactly
once per character regardless of how the string’s declared size changes.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="mid" class="link" title="Mid">Mid</a> — extracting
    characters using a position derived from `Len`
-   <a href="asc" class="link" title="Asc">Asc</a> — related
    command in the same category

</div>

</div>
