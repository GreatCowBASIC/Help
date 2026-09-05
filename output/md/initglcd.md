<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="initglcd"></span>InitGLCD

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    InitGLCD
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers with a Graphical LCD configured.

<span class="strong">**Explanation:**</span>

`InitGLCD` initializes the Graphical LCD for operation: it sets the
required control pins to their correct direction, resets the display
controller, selects both controller chips, and clears the screen so the
display starts from a known state. Call it once, before any other GLCD
command.

<span class="strong">**Example:**</span>

``` programlisting
    'Set pin directions
    Dir GLCD_RS Out
    Dir GLCD_RW Out
    Dir GLCD_ENABLE Out
    Dir GLCD_CS1 Out
    Dir GLCD_CS2 Out
    Dir GLCD_RESET Out

    'Reset
    Set GLCD_RESET Off
    Wait 1 ms
    Set GLCD_RESET On
    Wait 1 ms

    'Select both chips
    Set GLCD_CS1 On
    Set GLCD_CS2 On

    'Set on
    Set GLCD_RS Off
    GLCDWriteByte 63          ' <<< turns the controller display on

    'Set Z to 0
    GLCDWriteByte 192

    'Deselect chips
    Set GLCD_CS1 Off
    Set GLCD_CS2 Off

    'Clear screen
    GLCDCLS
```

<span class="strong">**Key line:**</span> `GLCDWriteByte 63` — sends the
controller’s "display on" command directly, since this is the manual,
pin-level setup sequence `InitGLCD` performs internally; a user program
simply calls `InitGLCD` once instead of reproducing these steps.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="glcd_overview" class="link" title="GLCD Overview">GLCD Overview</a> — the
    GLCD command family this initialisation supports
-   <a href="glcdcls" class="link" title="GLCDCLS">GLCDCLS</a> — clearing
    the screen, the last step InitGLCD performs
-   <a href="glcdwritebyte" class="link" title="GLCDWriteByte">GLCDWriteByte</a> — the
    low-level command used internally to reach the controller

</div>

</div>
