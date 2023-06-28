<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="_bcdtodec_gcb"></span>BcdToDec\_GCB

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    BcdToDec_GCB ( ByteVariable )
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

Support Bytes only.

<span class="strong">**Explanation:**</span>

Converts numbers from Binary Coded Decimal format to decimal.

You can add this function. Just add this to your GCBASIC program and
then call it when you need it.

<span class="strong">**Example:**</span>

``` screen
    Function BcdToDec(va) as byte
        BcdToDec=(va/16)*10+va%16
    End Function
```

<span class="strong">**Also see**</span>
<a href="_dectobcd_gcb.html" class="link" title="DecToBcd_GCB">DecToBcd_GCB</a>

</div>
