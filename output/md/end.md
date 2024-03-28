<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="end"></span>End

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    End
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

When the `End` command is used, the program will immediately stop
running. There are very few cases where this command is needed -
generally, the program should be an endless loop.

<span class="strong">**Example:**</span>

``` screen
    'This program will turn on the red light, but not the green light
    Set RED On
    End
    Set GREEN On
```

</div>
