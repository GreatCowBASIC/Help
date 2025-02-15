<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="getuserid"></span>GetUserID

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
```

<span class="strong">**Command Availability:**</span>

Available on all Microchip microcontrollers that support UserIDs.

<span class="strong">**Explanation:**</span>

Reads the memory location and returns the ID for a specific
microcontroller.

If the microcontroller does not support GetUSerID then the following
message will be issued during compilation
`Warning: GetUserID not supported by this microcontroller`.

The method reads the memory location 0x8000 + Index and returns it as a
Word value, where the Index 0x00 to 0x0B as follows:

<div class="informaltable">

| Address     | Function                        | Read | Write |
|:------------|:--------------------------------|:-----|:------|
| 8000h-8003h | User IDs                        | Yes  | Yes   |
| 8006h/8005h | Device ID/Revision ID           | Yes  | No    |
| 8007h-800Bh | Configuration Words 1 through 5 | Yes  | No    |

</div>

Refer to your particular Device Datasheet to confirm the address table

<span class="strong">**Example:**</span>

``` screen
      #chip 16F1455
      #Config MCLRE_ON

      #include <GetUserID.h>

      #define USART_BAUD_RATE 19200
      #define USART_TX_BLOCKING

      'Implement ANSI escaope code for serial terminal NOT using a LCD!
      #define ESC   chr(27)
      #define CLS   HSerPrint(ESC+"[2J")
      #define HOME  HSerPrint(ESC+"[H")
      #define Print HSerPrint

      CLS
      HOME

      dim UserIDRegister as word

      For Index = 0 to 0xF
        UserIDRegister  = GetUserID(Index)
        HserPrint "80" + hex(NVIndex)
        HserPrint " : "
        HserPrint hex( UserIDRegister_H )
        HserPrint hex( UserIDRegister    )
      Next Index

    End
```

</div>
