<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="usb_without_a_driver_winusb"></span>USB without a driver (WinUSB)

</div>

</div>

</div>

<span class="strong">**Description:**</span>

With `USB_WCID` defined, the USB library answers the Microsoft OS 1.0
descriptor requests that Windows sends to a new device. Windows 8.1 and
later then load their own WinUSB driver for the device when it is first
plugged in: there is no driver to install, no installer to run and no
reboot.

The program is unchanged otherwise: it uses the same vendor requests
(`USB_SETUP_HANDLER`, `USBBufferWrite`), and a PC program using
LibUsbDotNet, libusb or WinUSB opens the device by its vendor ID and
product ID, or by its device interface GUID.

<span class="strong">**Enabling Constants:**</span>

<div class="informaltable">

| <span class="strong">**Constant**</span> | <span class="strong">**Controls**</span>                                                                                                                                                                                             | <span class="strong">**Default**</span> |
|:-----------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:----------------------------------------|
| `USB_WCID`                               | Define it to answer the Microsoft OS 1.0 descriptor requests (the OS string, the Extended Compat ID "WINUSB" and the Extended Properties).                                                                                           | Not defined                             |
| `USB_WCID_GUID`                          | The device interface GUID, as a string of 38 characters in the form `"{xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}"`. Required with `USB_WCID`: the compiler stops with an error when it is missing. Give each solution a GUID of its own. | None                                    |
| `USB_WCID_VENDOR_CODE`                   | The request code Windows uses to read the descriptors. It must not be one of the program’s own request codes.                                                                                                                        | `0x20`                                  |

</div>

<span class="strong">**Example:**</span>

``` programlisting
    #chip 18F14K50, 48

    #define USB_VID 0x04D8
    #define USB_PID 0x0052
    #define USB_REV 0x0100

    'WinUSB without a driver
    #define USB_WCID
    #define USB_WCID_GUID "{BFC2B144-FB5A-4F56-98AC-93BC164EED46}"

    #define USB_PRODUCT_NAME "GCBASIC WinUSB " + CHIPNAMESTR
    #define USB_SETUP_HANDLER SetupHandler_CallBack

    #include <usb.h>
```

<span class="strong">**Notes:**</span>

<div class="itemizedlist">

-   Windows asks a device for its Microsoft OS descriptors only once for
    each vendor ID, product ID and `USB_REV` (bcdDevice), and remembers
    the answer. A device first plugged in without `USB_WCID` is not
    asked again until `USB_REV` changes, or until its key under
    `HKLM\SYSTEM\CurrentControlSet\Control\usbflags\` (vendor ID,
    product ID and revision as twelve hexadecimal digits) is deleted.
-   The vendor ID and product ID are not those of the LibK driver above
    (`0x1209` / `0x2006`): a PC with that driver installed would use it
    for the device instead of WinUSB.
-   LibUsbDotNet reads the revision from the device’s hardware ID as a
    decimal number: for `USB_REV 0x0100`, search for revision `100`.
-   Windows 7 does not read these descriptors: it still needs a driver.

</div>

<span class="strong">**Tested on (but not limited to)**</span>

``` programlisting
    PIC18F14K50, PIC16F1454, PIC16F1455, PIC16F1459, PIC18F46J50 (PIC18F Starter Kit 1)
    Windows 11 x64
```

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="inputs_outputs" class="link" title="Inputs/Outputs">Inputs/Outputs</a> — category
    overview

</div>

</div>
