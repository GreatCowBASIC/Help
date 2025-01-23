<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="hpwm_16_bit"></span>HPWM 16 Bit

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    HPWM16 channel, frequency, duty cycle    'Enable a 16-bit PWM channel'

    HPWM16On channel                         'Enable a specific PWM channel using parameters set by the HPWM16 method'

    HPWM16Off channel                        'Disable a specific PWM channel'
```

<span class="strong">**Command Availability:**</span>

<span class="strong">**Only**</span> available on Microchip PIC
microcontrollers with the 16-bit PWM module. 16-bit PWM support includes
both dynamic mode and fixed mode operations. See the examples below for
usage.

The PIC microcontroller chip specific DAT file must contain
`CHIPPWM16TYPE = 1`.   If the chip specific DAT does not contain
`CHIPPWM16TYPE = 1` and the microcontroller does support PWM 16 Bit
please report the omission to GCBASIC the support forum.  

For the Capture/Compare/PWM (CCP) module or the 10-bit PWM module, see
the other sections of the Help.

<span class="strong">**Explanation:**</span>

This command sets up the hardware PWM module of the Microchip PIC
microcontroller to generate a PWM waveform of the given frequency and
duty cycle. Once this command is called, the PWM will be emitted until
HPWM16Off method is called.

`channel` is 1, 2, 3.. 12. These corresponds to the 16-bit PWM channel
respectively.  
The 16-bit PWM channel <span class="strong">**MUST**</span> be supported
by the microcontroller. Check the microcontroller specific datasheet for
the available channel.

`frequency` sets the frequency of the PWM output. It is measured in KHz.
The maximum value allowed is 0xFFFF. The minimum value varies depending
on the clock speed. 1 KHz is the minimum on chips 16 MHz or under and 2
Khz is the lowest possible on 20 MHz chips. In situations that do not
require a specific PWM frequency, the PWM frequency should equal
approximately 1 five-hundredth the clock speed of the microcontroller
(ie 40 Khz on a 20 MHz chip, 16 KHz on an 8 MHz chip). This gives the
best duty cycle resolution possible.

`duty cycle` specifies the desired duty cycle of the PWM signal, and
ranges from 0 to 0xFFFF where 0xFFFF is 100% duty cycle.    This should
be a WORD value.

  
  

<span class="strong">**Example 1:**</span>

``` screen
    ' This program will enable dynamic mode PWM signals
    '
    ' All the 12 PWM16 channels can configured at separate dynamic frequencies  dynamic duty, the syntax is:
    '
    ' HPWM16(xx, frequency, duty )
    '
    ' xx can be 1 through 12, for this specific microcontroller there are three PWM16 channels.
    '
    ' To set the parameters of GCBASIC PWM fixed mode for the channels use the commands shown below::

        #chip 12F1572, 32
        #config mclr=on

        Dir PORTA Out

        HPWM16(1, 30, 16384)   '30 kHz, 25% duty cycle (16384/65535)
        HPWM16(2, 30, 16384)   '30 kHz, 25% duty cycle (16384/65535)
        HPWM16(3, 30, 16384)   '30 kHz, 25% duty cycle (16384/65535)


        do Forever
        loop


        #define USE_HPWM16_1 TRUE
        #define USE_HPWM16_2 TRUE
        #define USE_HPWM16_3 TRUE
        #define USE_HPWM16_4 FALSE
        #define USE_HPWM16_5 FALSE
        #define USE_HPWM16_6 FALSE
        #define USE_HPWM16_7 FALSE
        #define USE_HPWM16_8 FALSE
        #define USE_HPWM16_9 FALSE
        #define USE_HPWM16_10 FALSE
        #define USE_HPWM16_11 FALSE
        #define USE_HPWM16_12 FALSE
```

  
  
The 16-bit library also supports fixed mode PWM operations. The
following two examples show the constants and the commands to control
16-bit PWM Fixed Mode operations.  
  
<span class="strong">**Example 2:**</span>

``` screen
    ' This program will enable fix mode PWM signals
    '
    ' All the 12 PWM16 channels can configured at separate fixed frequencies and fixed duty, the syntax is:
    '
    ' #define HPWM16_xx_Freq 38     'Set frequency in KHz on channel xx
    ' #define HPWM16_xx_Duty 50     'Set duty cycle to 50%  on channel xx
    '
    ' xx can be 1 through 12
    '
    ' To set the parameters of GCBASIC PWM fixed mode on channel 1 use the following:
    '
    '    #define HPWM16_1_Freq 0.1 to > 1000         'Set the frequency, but, the clock speed must be low for low PWM frequency
    '    #define HPWM16_1_Duty 0.1 to 100            'Set duty cycle as percentage 0-100%, just change the number
    '


        #chip 12F1572, 32
        #config mclr=on

        Dir PORTA Out

        #define HPWM16_1_Freq 400         '800Hz to greater than 1mhz... greater than 1mhz at a clock speed of 32hz provides a clipped square wave.
        #define HPWM16_1_Duty 50
        HPWM16On ( 1 )

        do Forever
        loop
```

  
  
<span class="strong">**Example 3:**</span>

``` screen
    ' This program will enable fix mode PWM signals
    '
    ' All the 12 PWM16 channels can configured at separate fixed frequencies and fixed duty, the syntax is:
    '
    ' #define HPWM16_xx_Freq 38     'Set frequency in KHz on channel xx
    ' #define HPWM16_xx_Duty 50     'Set duty cycle to 50%  on channel xx
    '
    ' xx can be 1 through 12, for this specific microcontroller there are three PWM16 channels.
    '
    ' To set the parameters of GCBASIC PWM fixed mode for the three channels use the following:

        #chip 12F1572, 32
        #config mclr=on

        Dir PORTA Out

        #define HPWM16_1_Freq 100         '100khz
        #define HPWM16_1_Duty 40          '40% duty
        HPWM16On ( 1 )

        #define HPWM16_2_Freq 200         '200khz
        #define HPWM16_2_Duty 50          '50% duty
        HPWM16On ( 2 )

        #define HPWM16_3_Freq 300         '300khz
        #define HPWM16_3_Duty 60          '60% duty
        HPWM16On ( 3 )

        do Forever
        loop
```

<span class="strong">**For more help, see**</span>
<a href="pwmoff" class="link" title="PWMOff">PWMOff</a>

</div>
