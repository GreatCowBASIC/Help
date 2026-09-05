<div class="section">

<div class="titlepage">

<div>

<div>

###### <span id="st7920locate"></span>ST7920Locate

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    ST7920Locate ( Xpos, Ypos)
```

<span class="strong">**Explanation:**</span>

This command locates the pixel at the specific X and Y location of the
text screen. Subsequent printing to the GLCD will place a character to
the GLCD controller on the specified row and column. Due to the design
of the ST7920 controller (to accomodate Mandarin and Cyrillic), you must
place the text on the column according to the numbers above the diagram
below. The addressing is handle by the command.

``` programlisting
|--0--|--1--|--2--|...      ...|--7--|

+--+--+--+--+--+---------------------+

|H |e |l |l |o |  ...                | <- row 0 (address 0x80)

+--+--+--+--+--+---------------------+

|T |h |i |s |  |i ...                | <- row 1 (address 0x90)

+--+--+--+--+--+---------------------+

|' |' |' |' |' |' ...                | <- row 2 (address 0x88)

+--+--+--+--+--+---------------------+

|- |- |- |- |- |- ...                | <- row 3 (address 0x98)

+--+--+--+--+--+---------------------+
```

Writing 'a' onto the 1st column, and 1st row:

``` programlisting
|--0--|--1--|--2--|...      ...|--7--|

+--+--+--+--+--+---------------------+

|  |  |  |  |  |  ...                | <- row 0 (address 0x80)

+--+--+--+--+--+---------------------+

|  |  |a |  |  |  ...                | <- row 1 (address 0x90)

+--+--+--+--+--+---------------------+

|  |  |  |  |  |  ...                 | <- row 2 (address 0x88)

+--+--+--+--+--+---------------------+

|  |  |  |  |  |  ...                | <- row 3 (address 0x98)

+--+--+--+--+--+---------------------+
```

<span class="strong">**Example usage:**</span>

``` programlisting
    ST7920Locate ( 64, 31) 'the pixel at the mid screen point          ' <<< the ST7920Locate instruction
```

<span class="strong">**Key line:**</span>
`ST7920Locate ( 64, 31)` — positions the text cursor at pixel column 64,
row 31 (the middle of a 128x64 display); the ST7920 controller then maps
this to the correct internal row/column address itself, as shown in the
diagrams above.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="glcd_overview" class="link" title="GLCD Overview">GLCD Overview</a> — category
    overview
-   <a href="st7920glcddisablegraphics" class="link" title="ST7920GLCDDisableGraphics">ST7920GLCDDisableGraphics</a> — switching
    to text mode before printing at this location
-   <a href="st7920ctile" class="link" title="ST7920cTile">ST7920CTile</a> — placing
    a custom character tile at a specific location

</div>

</div>
