<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="shared_an_intended_overlap_of_a_fixed_location"></span>Shared (an intended overlap of a fixed location)

</div>

</div>

</div>

Sometimes two variables are <span class="strong">**meant**</span> to use
the same RAM: parts of a program that are never in use at the same time
can be purposely allocated to the same locations, to make the most of a
chip’s RAM. `Shared`, written straight after `At location`, tells the
compiler that the overlap is intended, so the warning is not shown for
that variable:

``` programlisting
    // A 512-byte buffer that is only used while USB is running ...
    Dim USBBuffer As Alloc * 512 At 0x400 Shared

    // ... and a file list that is only used while USB is not running, in the same RAM
    Dim FileNames(768) As Byte At 0x400 Shared
    Dim FileKinds(64) As Byte At 0x400 + 769 Shared
```

<div class="itemizedlist">

-   `Shared` applies to the one `Dim` it is written on. Every `Dim` in
    an intended overlap must say `Shared` itself - the first one too:
    the compiler, not the order in the source, decides which variable is
    given the location first, and the warning is shown for the others. A
    `Dim` that overlaps without `Shared` still gives the warning, so an
    accidental overlap is not hidden.
-   `Shared` must follow `At location`. Written without `At`, it is an
    error: `SHARED can only follow AT <location> in a DIM`.
-   With an initial value, `Shared` comes before it:
    `Dim Counter As Byte At 0x400 Shared = 0`.
-   In builds 1660 to 1664 this word was called `Override`. From build
    1665 `Override` is no longer recognised: use `Shared`.
-   The location can be a calculation of constants, such as
    `At USB_RAM_START + 769`. Writing every overlapping location
    relative to one constant keeps the layout correct when that constant
    changes.
-   The compiler cannot know when each part is in use: making sure the
    overlapping variables are never needed at the same time is up to the
    program.

</div>

</div>
