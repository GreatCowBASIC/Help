<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="_option_includepath"></span>\#Option IncludePath

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    #option IncludePath "folder;folder;..."
```

<span class="strong">**Explanation:**</span>

`#option IncludePath` gives the folders that GCBASIC searches for
`#include <…​>` files <span class="strong">**before**</span> its own
include folder (`..\GCBASIC\include`). A project can then keep its own
libraries in a folder of its own and still include them with `<` and
`>`, the same way as GCBASIC’s libraries, without copying them into
GCBASIC’s include folder.

<div class="itemizedlist">

-   The folders are separated by `;`. A folder can be relative to the
    program’s folder, or a full path.

-   A folder can start with a variable for a GCBASIC folder (build
    1679), so the path is right on every install, wherever GCBASIC is
    installed:

    <div class="itemizedlist">

    -   `%instdir%` - GCBASIC’s own folder, the folder of the compiler
        (for example `C:\GCstudio\gcbasic`).

    -   `%GCSTUDIO_INSTALL_PATH%` - the folder above it (for example
        `C:\GCstudio`).

        The names can be in capitals or lower case. These are GCBASIC’s
        own variables, not Windows environment variables.

    </div>

-   The folders are searched in the order given; the first one that has
    the file is used. When none of them has it, GCBASIC’s include folder
    is used, as without the option.

-   The option applies to every `#include <…​>` after it: in the
    program, and in every file the program includes. So a library in a
    project folder can include another library of the project with
    `<…​>`. Put the option before the first `#include` that needs it.

-   `#insert <…​>` uses the same search.

-   `#include "…​"` (quotation marks) is not changed: the file is read
    from the program’s folder.

-   The option is read from the main program only (not from an include
    file).

-   Without the option, `#include <…​>` reads only GCBASIC’s include
    folder, as in earlier builds.

</div>

<span class="strong">**A local copy of a system library:**</span>

GCBASIC always loads its system libraries, the files listed in
`..\GCBASIC\include\lowlevel.dat` (for example `usart.h`, `a-d.h`,
`hwspi.h`, `hwi2c.h`, `lcd.h`, `random.h`, `string.h`, `system.h` and
`timer.h`), from its `include\lowlevel` folder. You do not include them.

When the program includes a file with the same name as one of these
libraries, the program’s file is used in place of the system library.
The file can be found with `#include <…​>` in an `#option IncludePath`
folder, or with `#include "…​"`. Only that copy is loaded, so only its
`#script` runs and the constants it sets are the ones used, and each of
its methods exists once. The compiler shows an Information message, for
example
`C:\Project\libraries\usart.h is used in place of the system library usart.h`.

``` programlisting
    #chip 16F1825, 32
    #option IncludePath "libraries"

    #include <usart.h>                // libraries\usart.h is used in place of include\lowlevel\usart.h
```

The local copy replaces the whole system library, so start from a copy
of the system library of the same GCBASIC build and keep every method
the program, or another library, uses.

<span class="strong">**Example:**</span>

The program `BOOTLOADER_GCB.gcb` with its libraries in the folder
`libraries` next to it:

``` programlisting
    #chip 18F46J50, 48
    #option IncludePath "libraries"

    #include <usb_msd_polled.h>       // libraries\usb_msd_polled.h
    #include <sd_card.h>              // libraries\sd_card.h
    #include <glcd.h>                 // GCBASIC's own include folder
```

`usb_msd_polled.h` itself has `#include <usb_debug.h>`: that is found in
`libraries` too.

Two folders, the first one searched first:

``` programlisting
    #option IncludePath "libraries;..\SharedLibraries"
```

A project folder, then the `AdditionalLibraries` folder beside GCBASIC’s
include folder, named with `%instdir%`, not a fixed path:

``` programlisting
    #option IncludePath "..\GCBASICLibraries;%instdir%\AdditionalLibraries"

    #include <sd_card.h>              // C:\GCstudio\gcbasic\AdditionalLibraries\sd_card.h
```

<span class="strong">**Errors and warnings:**</span>

<div class="itemizedlist">

-   A file found in none of the folders gives the error
    `Cannot find …​`, followed by the folders that were searched, for
    example
    `Cannot find C:\GCstudio\gcbasic\include\not_there.h (searched: C:\Project\libraries; C:\GCstudio\gcbasic\include)`.
-   A folder in the option that does not exist gives the warning
    `#option IncludePath: folder not found: …​`; the other folders are
    still searched. A folder named with `%instdir%` is shown with the
    variable replaced, for example
    `#option IncludePath: folder not found: C:\GCstudio\gcbasic\NoSuchFolder`.

</div>

This option was added in build 1661. The `%instdir%` and
`%GCSTUDIO_INSTALL_PATH%` variables were added in build 1679.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="_include" class="link" title="#include">#include</a>
-   <a href="_insert" class="link" title="#insert">#insert</a>

</div>

</div>
