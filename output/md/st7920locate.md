<div class="section">

<div class="titlepage">

<div>

<div>

###### <span id="st7920locate"></span>ST7920Locate

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    ST7920Locate ( Xpos, Ypos)
```

<span class="strong">**Explanation:**</span>

This command locates the pixel at the specific X and Y location of the
text screen. Subsequent printing to the GLCD will place a character to
the GLCD controller on the specified row and column. Due to the design
of the ST7920 controller (to accomodate Mandarin and Cyrillic), you must
place the text on the column according to the numbers above the diagram
below. The addressing is handle by the command.

``` screen
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

``` screen
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

``` screen
    ST7920Locate ( 64, 31) ‘the pixel at the mid screen point
```

</div>
