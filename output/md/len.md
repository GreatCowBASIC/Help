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

Available on all microcontrollers

<span class="strong">**Explanation:**</span>

The `Len` function returns an byte value which is the length of a phrase
or a sentence, including the empty spaces. The format is:

``` screen
    target_byte_variable = Len("Phrase")
```

or another example. This code will loop through the for-next loop 12
times as determined by the length of the string:  

``` screen
    ' create a test string of 12 characters
    dim teststring as string * 12

    teststring = "0123456789AB"
    for loopthrustring = 1 to len(teststring)
       hserprint mid(teststring, loopthrustring , 1)
    next
```

</div>
