<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="at_fixed_memory_location"></span>At (Fixed Memory Location)

</div>

</div>

</div>

`At` places a variable at a specific RAM location:

``` screen
    Dim SerialBuffer As Byte At 0x20
```

If the location is already used or invalid, a warning is generated.

`At` and `Alias` are mutually exclusive.

</div>
