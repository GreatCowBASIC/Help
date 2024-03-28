<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="line_continuation"></span>Line Continuation

</div>

</div>

</div>

<span class="strong">**About Line Continuation**</span>

A single \_ (underscore) character at the end of a line of code tells
the compiler that the line continues in the next line. This allows a
single statement (line of code) to be spread across multiple lines in
the input file, which can provide nice formatting.

Be careful when adding the \_ line continuation character right behind
an identifier or keyword. It MUST be separated with at least <span
class="strong">**one space**</span> character, otherwise it would be
treated as part of the identifier or keyword.

<span class="strong">**Example 1:**</span>

``` screen
    #CHIP 18f27k42

    Dim sMyString As String
        sMyString ="one _
                   two _
                   three _
                   four _
                   five _
                   six _
                   seven _
                   eight _
                   nine _
                   ten _
                   eleven _
                   twelve _
                   thirteen _
                   fourteen _
                   fifteen _
                   sixteen _
                   seventeen _
                   eighteen _
                   nineteen _
                   twenty _
                   twentyOne _
                   twentyTwo _
                   twentyThree _
                   twentyFour _
                   twentyFive"

    HSerPrint sMyString
```

This example will print on the serial terminal the string "one two three
four five six seven eight nine ten eleven twelve thirteen fourteen
fifteen sixteen seventeen eighteen nineteen twenty twentyOne twentyTwo
twentyThree twentyFour twentyFive"

<span class="strong">**Example 2:**</span>

``` screen
    Sub Aiguillages (In voie_principale As Byte, _
                     In voie_marchandises As Byte, _
                     In voie_gravier As Byte)

        ' code segment
        ' code segment
        ' code segment

    End Sub
```

This example improves the layout of definition of the sub-routine.

<span class="strong">**Example 3:**</span>

``` screen
 #DEFINE Ouvrir_voie_marchandises Aiguillages _
              (0, Marche_avant, Marche_arriere)
```

This example creates a constants over two lines. This improves
readability.

</div>
