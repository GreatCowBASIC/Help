<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="analog_digital_conversion_code_optimisation"></span>Analog/Digital Conversion Code Optimisation

</div>

</div>

</div>

<span class="strong">**About Analog/Digital Conversion Code
Optimisation**</span>

The analog-to-digital converter (ADC or A/D) module support is
implemented by GCBASIC to provide 8-bit, 10-bit, and 12-bit
single-channel measurement mode and differential-channel measurement
mode, with support for up to 34 channels. For compatibility, all
channels are supported by default.

There are two methods to optimise the code:

<div class="orderedlist">

1.  Minimise the code by using constants to disable support for specific
    channels.
2.  Adapt the ADC configuration by inserting specific commands to set
    registers or register bits.

</div>

<span class="strong">**1. Minimise the Code**</span>

The example below disables support for ADC port 0 (AD0).

``` programlisting
    #define USE_AD0 FALSE
```

The following tables show the `#define` constants that can be used to
reduce code size — these are the defines for the standard
microcontrollers. For 16F1688x and similar microcontrollers, see the
second table.

<div class="informaltable">

| Channel    | Optimisation Value | Default Value |
|:-----------|:-------------------|:--------------|
| `USE_AD0`  | `FALSE`            | `TRUE`        |
| `USE_AD1`  | `FALSE`            | `TRUE`        |
| `USE_AD2`  | `FALSE`            | `TRUE`        |
| `USE_AD3`  | `FALSE`            | `TRUE`        |
| `USE_AD4`  | `FALSE`            | `TRUE`        |
| `USE_AD5`  | `FALSE`            | `TRUE`        |
| `USE_AD6`  | `FALSE`            | `TRUE`        |
| `USE_AD7`  | `FALSE`            | `TRUE`        |
| `USE_AD8`  | `FALSE`            | `TRUE`        |
| `USE_AD9`  | `FALSE`            | `TRUE`        |
| `USE_AD10` | `FALSE`            | `TRUE`        |
| `USE_AD11` | `FALSE`            | `TRUE`        |
| `USE_AD12` | `FALSE`            | `TRUE`        |
| `USE_AD13` | `FALSE`            | `TRUE`        |
| `USE_AD14` | `FALSE`            | `TRUE`        |
| `USE_AD15` | `FALSE`            | `TRUE`        |
| `USE_AD16` | `FALSE`            | `TRUE`        |
| `USE_AD17` | `FALSE`            | `TRUE`        |
| `USE_AD18` | `FALSE`            | `TRUE`        |
| `USE_AD19` | `FALSE`            | `TRUE`        |
| `USE_AD20` | `FALSE`            | `TRUE`        |
| `USE_AD21` | `FALSE`            | `TRUE`        |
| `USE_AD22` | `FALSE`            | `TRUE`        |
| `USE_AD23` | `FALSE`            | `TRUE`        |
| `USE_AD24` | `FALSE`            | `TRUE`        |
| `USE_AD25` | `FALSE`            | `TRUE`        |
| `USE_AD26` | `FALSE`            | `TRUE`        |
| `USE_AD27` | `FALSE`            | `TRUE`        |
| `USE_AD28` | `FALSE`            | `TRUE`        |
| `USE_AD29` | `FALSE`            | `TRUE`        |
| `USE_AD30` | `FALSE`            | `TRUE`        |
| `USE_AD31` | `FALSE`            | `TRUE`        |
| `USE_AD32` | `FALSE`            | `TRUE`        |
| `USE_AD33` | `FALSE`            | `TRUE`        |
| `USE_AD34` | `FALSE`            | `TRUE`        |

</div>

For 16F1688x devices, see the table below.

<div class="informaltable">

| Channel    | Optimisation Value | Default Value |
|:-----------|:-------------------|:--------------|
| `USE_ADA0` | `FALSE`            | `TRUE`        |
| `USE_ADA1` | `FALSE`            | `TRUE`        |
| `USE_ADA2` | `FALSE`            | `TRUE`        |
| `USE_ADA3` | `FALSE`            | `TRUE`        |
| `USE_ADA4` | `FALSE`            | `TRUE`        |
| `USE_ADA5` | `FALSE`            | `TRUE`        |
| `USE_ADA6` | `FALSE`            | `TRUE`        |
| `USE_ADA7` | `FALSE`            | `TRUE`        |
| `USE_ADC0` | `FALSE`            | `TRUE`        |
| `USE_ADC1` | `FALSE`            | `TRUE`        |
| `USE_ADC2` | `FALSE`            | `TRUE`        |
| `USE_ADC3` | `FALSE`            | `TRUE`        |
| `USE_ADC4` | `FALSE`            | `TRUE`        |
| `USE_ADC5` | `FALSE`            | `TRUE`        |
| `USE_ADC6` | `FALSE`            | `TRUE`        |
| `USE_ADC7` | `FALSE`            | `TRUE`        |
| `USE_ADD0` | `FALSE`            | `TRUE`        |
| `USE_ADD1` | `FALSE`            | `TRUE`        |
| `USE_ADD2` | `FALSE`            | `TRUE`        |
| `USE_ADD3` | `FALSE`            | `TRUE`        |
| `USE_ADD4` | `FALSE`            | `TRUE`        |
| `USE_ADD5` | `FALSE`            | `TRUE`        |
| `USE_ADD6` | `FALSE`            | `TRUE`        |
| `USE_ADD7` | `FALSE`            | `TRUE`        |
| `USE_ADE0` | `FALSE`            | `TRUE`        |
| `USE_ADE1` | `FALSE`            | `TRUE`        |
| `USE_ADE2` | `FALSE`            | `TRUE`        |

</div>

The following is an example that disables every channel except the
specified channel, by defining every channel except `USE_AD0` as
`FALSE`.

This saves 146 bytes of program memory.

``` programlisting
    #chip 16F1939

    'USART settings
    #define USART_BAUD_RATE 9600
    #define USART_TX_BLOCKING

    'Set the input pin direction
    Dir PORTA.0 In

    'Print 255 reading
    For CurrentAddress = 0 to 255

        'Take a reading and show it
        HSerPrint str(ReadAD10(AN0))

        'Wait 10 minutes before getting another reading
        Wait 10 min
    Next

    #define USE_AD0 TRUE
    #define USE_AD1 FALSE
    #define USE_AD2 FALSE
    #define USE_AD2 FALSE
    #define USE_AD3 FALSE
    #define USE_AD4 FALSE
    #define USE_AD5 FALSE
    #define USE_AD6 FALSE
    #define USE_AD7 FALSE
    #define USE_AD8 FALSE
    #define USE_AD9 FALSE
    #define USE_AD10 FALSE
    #define USE_AD11 FALSE
    #define USE_AD12 FALSE
    #define USE_AD13 FALSE
    #define USE_AD14 FALSE
    #define USE_AD15 FALSE
    #define USE_AD16 FALSE
    #define USE_AD17 FALSE
    #define USE_AD18 FALSE
    #define USE_AD19 FALSE
    #define USE_AD20 FALSE
    #define USE_AD21 FALSE
    #define USE_AD22 FALSE
    #define USE_AD23 FALSE
    #define USE_AD24 FALSE
    #define USE_AD25 FALSE
    #define USE_AD26 FALSE
    #define USE_AD27 FALSE
    #define USE_AD28 FALSE
    #define USE_AD29 FALSE
    #define USE_AD30 FALSE
    #define USE_AD31 FALSE
    #define USE_AD32 FALSE
    #define USE_AD33 FALSE
    #define USE_AD34 FALSE
```

For the 16F18855 family of microcontrollers, the following is an
example. This saves 149 bytes of program memory.

``` programlisting
    '''  PIC: 16F18855
    '''  Compiler: GCB
    '''  IDE: GCode
    '''
    '''  Board: Xpress Evaluation Board
    '''  Date: 13.3.2021
    '''


        'Chip Settings.
        #CHIP 16F18855,32
        #CONFIG MCLRE_ON
        #OPTION EXPLICIT

        '' -------------------LATA-----------------
        '' Bit#:  -7---6---5---4---3---2---1---0---
        '' LED:   ---------------|D5 |D4 |D3 |D1 |-
        ''-----------------------------------------
        ''

        #define USART_BAUD_RATE 19200
        #define USART_TX_BLOCKING

        #define LEDD2 PORTA.0
        #define LEDD3 PORTA.1
        #define LEDD4 PORTA.2
        #define LEDD5 PORTA.3
        Dir     LEDD2 OUT
        Dir     LEDD3 OUT
        Dir     LEDD4 OUT
        Dir     LEDD5 OUT

        #define SWITCH_DOWN         0
        #define SWITCH_UP           1

        #define SWITCH              PORTA.5


        'Setup an Interrupt event when porta.5 goes negative.
        IOCAN5 = 1
        On Interrupt PORTABChange  Call InterruptHandler

        do

         'Read the value from the EEPROM from register Zero in the EEPROM
          EPRead ( 0, OutValue )

          'Leave the Top Bytes alone and set the lower four bits
          PortA = ( PortA & 0XF0 ) OR ( OutValue / 16 )
          Sleep

        loop


    sub InterruptHandler

        if IOCAF5 = 1 then                         'S2 was just pressed
            IOCAN5 = 0                             'Prevent the event from reentering the InterruptHandler routine
            IOCAF5 = 0                             'We must clear the flag in software

            wait 5 ms                              'debounce by waiting and seeing if still held down
            if ( SWITCH = SWITCH_DOWN ) then
                'Read the ADC
                adc_value = readad ( AN4 )
                'Write the value to register Zero in the EEPROM
                EPWrite ( 0, adc_value )
            end if
            IOCAN5 = 1                              'ReEnable the InterruptHandler routine

        end if

    end sub

    #define USE_ADA0 FALSE
    #define USE_ADA1 FALSE
    #define USE_ADA2 FALSE
    #define USE_ADA3 FALSE
    #define USE_ADA4 TRUE
    #define USE_ADA5 FALSE
    #define USE_ADA6 FALSE
    #define USE_ADA7 FALSE
    #define USE_ADB0 FALSE
    #define USE_ADB1 FALSE
    #define USE_ADB2 FALSE
    #define USE_ADB3 FALSE
    #define USE_ADB4 FALSE
    #define USE_ADB5 FALSE
    #define USE_ADB6 FALSE
    #define USE_ADB7 FALSE
    #define USE_ADC0 FALSE
    #define USE_ADC1 FALSE
    #define USE_ADC2 FALSE
    #define USE_ADC3 FALSE
    #define USE_ADC4 FALSE
    #define USE_ADC5 FALSE
    #define USE_ADC6 FALSE
    #define USE_ADC7 FALSE
    #define USE_ADD0 FALSE
    #define USE_ADD1 FALSE
    #define USE_ADD2 FALSE
    #define USE_ADD3 FALSE
    #define USE_ADD4 FALSE
    #define USE_ADD5 FALSE
    #define USE_ADD6 FALSE
    #define USE_ADD7 FALSE
    #define USE_ADE0 FALSE
    #define USE_ADE1 FALSE
    #define USE_ADE2 FALSE
```

<span class="strong">**2. Adapt the ADC Configuration**</span>

Example 1:

The following example sets specific register bits. The instruction is
added to the compiled code.

``` programlisting
    #define ADReadPreReadCommand  ADCON.2=0:ANSELA.0=1
```

The constant `ADReadPreReadCommand` can be used to adapt the ADC
methods. The constant can enable registers or register bit(s) that need
to be managed for a specific solution.

In the example above, the following assembly is added to your code. This
is added just before the ADC is enabled and the acquisition delay is
set.

``` programlisting
  ;ADReadPreReadCommand
  banksel ADCON
  bcf ADCON,2
  banksel ANSELA
  bsf ANSELA,0
```

Example 2:

The following example can be used to change the ADMUX register to
support a sensor on ADC4.

This supports reading the internal temperature sensor on the ATtiny85.
This method also works on other similar chips — refer to the
chip-specific datasheet.

This calls a macro that changes the ADMUX register to read the ATtiny85
internal temperature sensor, sets the reference voltage to 1.1 V, and
then waits 100 ms.

``` programlisting
    #define ADREADPREREADCOMMAND ATTINY85ReadInternalTemperatureSensor

    Macro ATTINY85ReadInternalTemperatureSensor
    /*
    17.12 of the datasheet
    The temperature measurement is based on an on-chip temperature sensor that is coupled to a single ended ADC4
    channel. Selecting the ADC4 channel by writing the MUX[3:0] bits in ADMUX register to 1111 enables the temperature sensor. The internal 1.1V reference must also be selected for the ADC reference source in the
    temperature sensor measurement. When the temperature sensor is enabled, the ADC converter can be used in
    single conversion mode to measure the voltage over the temperature sensor.
    The measured voltage has a linear relationship to the temperature as described in Table 17-2 The sensitivity is
    approximately 1 LSB / ?C and the accuracy depends on the method of user calibration. Typically, the measurement
    accuracy after a single temperature calibration is +/-10?C, assuming calibration at room temperature. Better
    accuracies are achieved by using two temperature points for calibration.
    */
      IF ADReadPort=4 then
          ADMUX = ( ADMUX and 0X20 ) or 0X8F          ' <<< the register rewrite this page documents
          wait 100 ms
      End if

    End Macro
```

<span class="strong">**Key line:**</span>
`ADMUX = ( ADMUX and 0X20 ) or 0X8F` — masks out the existing
channel-select bits while preserving the rest of ADMUX, then ORs in the
ADC4-plus-1.1V-reference pattern this note describes.

This generates the following assembly.

``` programlisting
    ;ADREADPREREADCOMMAND  'adds user code below
      lds SysCalcTempA,ADREADPORT
      cpi SysCalcTempA,4
      brne  ENDIF2
      ldi SysTemp2,32
      in  SysTemp3,ADMUX
      and SysTemp3,SysTemp2
      mov SysTemp1,SysTemp3
      ldi SysTemp2,143
      or  SysTemp1,SysTemp2
      out ADMUX,SysTemp1
      ldi SysWaitTempMS,100
      ldi SysWaitTempMS_H,0
      rcall Delay_MS
    ENDIF2:
```

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="analog_digital_conversion_overview" class="link" title="Analog/Digital Conversion Overview">Analog/Digital Conversion Overview</a> — category
    overview
-   <a href="adformat_deprecated_do_not_use" class="link" title="ADFormat (Deprecated - Do not use)">ADFormat (Deprecated - Do not use)</a> — related
    command in the same category
-   <a href="adoff" class="link" title="ADOff">ADOff</a> — related
    command in the same category

</div>

</div>
