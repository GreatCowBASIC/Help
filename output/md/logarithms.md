<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="logarithms"></span>Logarithms

</div>

</div>

</div>

<span class="strong">**Explanation:**</span>

GCBASIC support logarithmic functions through the include file
&lt;maths.h&gt;.

These functions compute base 2, base e and base 10 logarithms accurate
to 2 decimal places, +/- 0.01.

The values returned are fixed-point numbers, with two decimal places
assumed on the right. Or if you prefer, think of the values as being
scaled up by 100.

The input arguments are word-sized integers, 1 to 65535. Remember,
logarithms are not defined for non-positive numbers. It is the calling
program’s responsibility to avoid these. Output values are also
word-sized.

Local variables consume 9 bytes, while the function parameters consume
another 4 bytes, for a grand total of 13 bytes of RAM used. The lookup
table takes 35 words of program memory.

<span class="strong">**For more help, see**</span>
<a href="log10" class="link" title="Log10">Log10</a>,
<a href="log2" class="link" title="Log2">Log2</a>,
<a href="loge" class="link" title="Loge">Loge</a>

<span class="strong">**Supported in &lt;MATHS.H&gt;**</span>

</div>
