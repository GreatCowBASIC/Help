<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="about_glcd_library_support"></span>ABOUT GLCD Library Support

</div>

</div>

</div>

The GLCD capability supports over 40 GLCDs. GCBASIC automatically loads
the specific library required. The loading of the specific library(ies)
by the compiler improves performance and significantly reduces
compilation time.

The GLCD libraries that are automatically loaded are controlled by the
use of an include statement in the user program, `#include <glcd.h>`,
with a constant to define the specific GLCD driver to be loaded,
`#define GLCD_TYPE GLCD_TYPE_SSD1289`.

The compiler uses the file `include\glcd.dat` for this process.
`glcd.dat` has a strict format, where the row index has parameters as
shown below.

``` programlisting
    Format. This is strict.

    Use a comma delimiter; single quote for a comment line; ampersand to group libraries. No other format controls permitted.

    For each row.

        Index, glcd type, library[[&library]&library]

        Index =   the reference number from GLCD.H. There is a unique reference number per type of glcd.
        Type  =   the type. per type of glcd. must match those definition in GLCD.H
                    this is used as the search/match in the constant `GLCD_TYPE` in user source program
                    this is not case sensitive
        Library = library to be loaded, or, group of dependent libraries
                    delimiter must be '&'
```

  

</div>
