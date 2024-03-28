<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="dectobcd_gcb"></span>DecToBcd\_GCB

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
 DectoBcd( ByteVariable )
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

Converts numbers from Decimal to Binary Coded Decimal format. Support
Bytes only.

You can add this function. Just add this to your GCBASIC program and
then call it when you need it.

<span class="strong">**Example:**</span>

``` screen
    Function DecToBcd(va) as Byte
       DecToBcd=(va/10)*16+va%10
    End Function
```

<span class="strong">**Also see**</span>
<a href="bcdtodec_gcb" class="link" title="BcdToDec_GCB">BcdToDec_GCB</a>

</div>
