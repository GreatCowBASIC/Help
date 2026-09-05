<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="make_asm_make_hex_and_programming_operations_using_the_provided_linux_scripts"></span>Make ASM, Make HEX and Programming Operations using the provided Linux scripts

</div>

</div>

</div>

The scripts provided are intended to assist in the creation of the ASM
file (from a GCBASIC source file), creation of the HEX file (also from a
GCBASIC source file), and to support programming operations (often
called \`FLASH\`ing the microcontroller).

<div class="informaltable">

| <span class="strong">**Script**</span> | <span class="strong">**Usage**</span>                                                                                                              | <span class="strong">**Example**</span> |
|:---------------------------------------|:---------------------------------------------------------------------------------------------------------------------------------------------------|:----------------------------------------|
| `makeasm.sh`                           | To compile the GCBASIC source program to create the ASM.                                                                                           | `makeasm.sh sourcefile.gcb`             |
| `makehex.sh`                           | To compile and assemble the GCBASIC source program to create the ASM and a microcontroller-specific HEX file.                                      | `makehex.sh sourcefile.gcb`             |
| `flash.sh`                             | To compile, assemble the GCBASIC source program to create the ASM and a microcontroller-specific HEX file, and then to program the microcontroller | `flash.sh sourcefile.gcb`               |

</div>

<span class="strong">**Examples**</span>

There are multiple constructs to run multiple programs on a single
command line. The most common are `;` and `&&`.

To run another command immediately after running makehex.sh, use the
following:

``` programlisting
   makehex.sh sourcefile.gcb; anothercommand
```

To run another command only if makehex.sh does not exit with an error,
such as a compiler error, use the following:

``` programlisting
   makehex.sh sourcefile.gcb && anothercommand          ' <<< running a follow-on command only if compilation succeeded
```

<span class="strong">**Key line:**</span>
`makehex.sh sourcefile.gcb && anothercommand` — the shell `&&` operator
only runs `anothercommand` if `makehex.sh` exits with a success status;
a compiler error causes `makehex.sh` to exit with a failure status,
which skips `anothercommand` entirely, unlike the `;` form above it,
which always runs the second command regardless.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="overview_apple_macos_gcbasic" class="link" title="Overview - Apple macOS GCBASIC">Overview - Apple macOS GCBASIC</a> — the
    equivalent instructions for macOS
-   <a href="overview_freebsd_gcbasic" class="link" title="Overview - FreeBSD GCBASIC">Overview - FreeBSD GCBASIC</a> — the
    equivalent instructions for FreeBSD

</div>

</div>
