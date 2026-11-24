<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="pset"></span>Pset

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    PSet(XPosition, YPosition, GLCDState)
```

<span class="strong">**Explanation:**</span>

Sets or clears a single pixel at the specified `XPosition`, `YPosition`.
Set `GLCDState` to 1 to set the pixel (draw it in the foreground
colour), or to 0 to clear it (return it to the background colour).

<span class="strong">**Example:**</span>

``` programlisting
    #include <glcd.h>

    PSet(64, 32, 1)          ' <<< the PSet instruction
```

<span class="strong">**Key line:**</span> `PSet(64, 32, 1)` — sets the
single pixel at the centre of a 128x64 display to the foreground colour.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="glcd_overview" class="link" title="GLCD Overview">GLCD Overview</a> — category
    overview
-   <a href="line" class="link" title="Line">Line</a> — drawing a
    straight run of pixels rather than one at a time
-   <a href="fonts_and_characters" class="link" title="Fonts and Characters">Fonts and Characters</a> — related
    command in the same category

</div>

</div>
