<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="hpwm_fixed_mode"></span>HPWM Fixed Mode

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    PWMOn               'only applies to CCP/PWM channel 1
    'or
    PWMOff

    PWMOn( channel )            'where the parameter can be any valid CCP/PWM channel, 1, 2, 3, 4 or 5
    'or
    PWMOff( channel )

    PWMOn( module_number , PWMModule)            'where the parameter can be any valid PWM channel 1 .. 9
    'or
    PWMOff( module_number , PWMModule)
```

<span class="strong">**Command Availability:**</span>

<span class="strong">**Only**</span> available on Microchip PIC
microcontrollers with a CCP/PWM or PWM module.

See here
<a href="hpwm_ccp" class="link" title="HPWM CCP">HPWM CCP</a> for
the method to change PWM parameters dynamically or to use other CCP
channels - this method support CCP1/PWM, CCP2/PWM, CCP3/PWM, CCP4/PWM
and CCP5/PWM.

<span class="strong">**Explanation:**</span>

This command sets up the hardware PWM module of the Microchip PIC
microcontroller to generate a PWM waveform of the given frequency and
duty cycle.   Once this command is called, the PWM will be emitted until
PWMOff is called.

These constants are required to set the parameters for the PWM. The
frequency and the duty applies to all channels when using the method(s)
or macro(s) shown above.

<div class="informaltable">

| <span class="strong">**Constant Name**</span> | <span class="strong">**Controls**</span>                           | <span class="strong">**Default Value**</span> |
|:----------------------------------------------|:-------------------------------------------------------------------|:----------------------------------------------|
| `PWM_Freq`                                    | Specifies the output frequency of the PWM module in KHz.           | 38                                            |
| `PWM_Duty`                                    | Sets the duty cycle of the PWM module output. Given as percentage. | 50                                            |

</div>

  
For CCP/PWM modules are also supported using a call to a method or a
macro, as follows:  

<div class="informaltable">

<table data-border="1">
<thead>
<tr class="header">
<th style="text-align: left;"><span class="strong"><strong>Method/Macro</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Controls</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Default Value</strong></span></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><p>PWMOn</p></td>
<td style="text-align: left;"><p>No parameter enables CCP1/PWM only</p></td>
<td style="text-align: left;"><p>No parameter</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>PWMOff</p></td>
<td style="text-align: left;"><p>Disables CCP1/PWM only</p></td>
<td style="text-align: left;"> </td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>PWMOn( <code class="literal">channel</code> )</p></td>
<td style="text-align: left;"><p>Where the parameter is any valid CCP/PWM channel</p></td>
<td style="text-align: left;"><p><code class="literal">channel</code> can be 1, 2, 3, 4 or 5</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>PWMOff( <code class="literal">channel</code> )</p></td>
<td style="text-align: left;"><p>Where the parameter is any valid CCP/PWM channel</p></td>
<td style="text-align: left;"><p><code class="literal">channel</code> can be 1, 2, 3, 4 or 5</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>PWMOn( <code class="literal">module</code>, PWMMODULE )</p></td>
<td style="text-align: left;"><p>Where the parameter is any valid PWM module</p></td>
<td style="text-align: left;"><p><code class="literal">module</code> can be 1..9<br />
See the example below for the constants to control fixed mode PWM using PWM modules.</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>PWMOff( <code class="literal">channel</code>, PWMMODULE )</p></td>
<td style="text-align: left;"><p>Where the parameter is any valid CCP/PWM module</p></td>
<td style="text-align: left;"><p><code class="literal">module</code> can be 1..9</p></td>
</tr>
</tbody>
</table>

</div>

  
  
<span class="strong">**Fixed Mode PWM for PWM Modules.**</span>

To set the Fixed Mode PWM for PWM Modules you need to set a timer
frequency, a PWM module cycle and the PWM model source clock.

The options for source clock are shown below. These are the PWM timers
supported by the PWM modules, where `nn` is the frequency.

``` screen
    PWM_Timer2_Freq `nn` or
    PWM_Timer4_Freq `nn` or
    PWM_Timer6_Freq `nn`.
```

The PWM module duty is set using PWM\_\`yy\`\_Duty `` xx' where `yy ``
is between 1 and 9 and is a valid PWM module, and, `xx` is the Duty
cycle for specific channels

``` screen
    #define PWM_yy_Duty xx
```

The PMW module clock source us PWM\_\`zz\`\_Clock\_Source `tt`. Where
`zz` is channel and `tt` is the PWM clock source.

``` screen
    #define PMW_zz_Clock_Source tt
```

You do not need to define all the timers and or all the channels, just
define the constants you need.

The minimum is A timer with a frequency A PWM channel with a duty A PWM
channel clock source

Example: For PWM channel 6 with a frequency of 38Khz with a duty of 50%
with a clock source of timer 2, use

``` screen
        #define PWM_Timer2_Freq 38
        #define PWM_7_Duty 50
        #define PMW_7_Clock_Source 6
```

Details of the constants with example parameters.

``` literallayout
#define PWM_Timer2_Freq 20        'Set frequency in KHz, just change the number
#define PWM_Timer4_Freq 40        'Set frequency in KHz, just change the number
#define PWM_Timer6_Freq 60        'Set frequency in KHz, just change the number
```

Supported PWM modules, with example parameters.

``` literallayout
#define PWM_1_Duty 10            'Set duty cycle as percentage 0-100%, just change the number
#define PMW_1_Clock_Source 2
```

``` literallayout
#define PWM_2_Duty 20
#define PMW_2_Clock_Source 4
```

``` literallayout
#define PWM_3_Duty 30
#define PMW_3_Clock_Source 6
```

``` literallayout
#define PWM_4_Duty 40
#define PMW_4_Clock_Source 2
```

``` literallayout
#define PWM_5_Duty 50
#define PMW_5_Clock_Source 6
```

``` literallayout
#define PWM_6_Duty 60
#define PMW_6_Clock_Source 6
```

``` literallayout
#define PWM_7_Duty 70
#define PMW_7_Clock_Source 4
```

``` literallayout
#define PWM_8_Duty 80
#define PMW_8_Clock_Source 4
```

``` literallayout
#define PWM_9_Duty 90
#define PMW_9_Clock_Source 6
```

  
  
<span class="strong">**Example \#1:**</span>

Enable CCP1/PWM channel only. This is the legacy command.

``` screen
    #chip 16f877a,20

    'Set the PWM pin to output mode
    DIR PORTC.2 out

    'Main code

    #define PWM_Freq 38      'Frequency of PWM in KHz
    #define PWM_Duty 50      'Duty cycle of PWM (%)

    PWMOn    'Will enable CCP1/PWM Only

    wait 10 s                'Wait 10 s

    PWMOff   'Will disable CCP1/PWM Only

    do
    loop
```

  
<span class="strong">**Example \#2:**</span>

Enable any CCP/PWM channel using a call to a method.

``` screen
    #chip 16f877a,20

    'Set the PWM pin to output mode
    DIR PORTC.2 out

    'Main code

    #define PWM_Freq 38      'Frequency of PWM in KHz
    #define PWM_Duty 50      'Duty cycle of PWM (%)

    PWMOn (2)    'Will enable any valid CCP/PWM channel

    wait 10 s                'Wait 10 s

    PWMOff (2)   'Will disable any valid CCP/PWM channel

    do
    loop
```

  
Example \#3:\*

Enable any PWM module using a PWM specific method.

``` screen
    'A real simple and easy PWM setup for 8 and 10 bit PWM channels
        #chip 18f25k42, 16

        #startup InitPPS, 85

        Sub InitPPS

                'Module: PWM5
                RA0PPS = 0x000D    'PWM5 > RA0
                'Module: PWM6
                RA1PPS = 0x000E    'PWM6 > RA1
                'Module: PWM7
                RA2PPS = 0x000F    'PWM7 > RA2
                'Module: PWM8
                RA3PPS = 0x0010    'PWM8 > RA3

        End Sub

        'Template comment at the end of the config file
        dir porta Out
        dir portb Out
        dir portc Out

    'This is the setup section for fixed mode PWM

        'The only options are PWM_Timer2_Freq nn|PWM_Timer4_Freq nn|PWM_Timer6_Freq nn. These are the PWM timers
        'The PWM_yy_Duty xx' where yy is between 1 and 9 and is a valid PWM module, and, xx is the Duty cycle for specific channels
        'The PMW_zz_Clock_Source tt.  Where zz is channel and tt is the PWM clock source.
        'You do not need to define all the timers and channels, just define the constants you need.
        'The minimum is
        '   A timer with a frequency
        '   A PWM channel with a duty
        '   A PWM channel clock source
        '   For PWM channel 2 with a frequency of 38Khz with a duty of 50% with a clock source of timer 2, use
        '     #define PWM_Timer2_Freq 38
        '     #define PWM_7_Duty 50
        '     #define PMW_7_Clock_Source 2

        #define PWM_Timer2_Freq 20        'Set frequency in KHz, just change the number
        #define PWM_Timer4_Freq 40        'Set frequency in KHz, just change the number
        #define PWM_Timer6_Freq 60        'Set frequency in KHz, just change the number


      '    Supported PWM module but not by this specific microcontroller
      '
      '    #define PWM_1_Duty 10            'Set duty cycle as percentage 0-100%, just change the number
      '    #define PMW_1_Clock_Source 2
      '
      '    #define PWM_2_Duty 20
      '    #define PMW_2_Clock_Source 4
      '
      '    #define PWM_3_Duty 30
      '    #define PMW_3_Clock_Source 6
      '
      '    #define PWM_4_Duty 40
      '    #define PMW_4_Clock_Source 2

        #define PWM_5_Duty 50
        #define PMW_5_Clock_Source 6

        #define PWM_6_Duty 60
        #define PMW_6_Clock_Source 6

        #define PWM_7_Duty 70
        #define PMW_7_Clock_Source 4

        #define PWM_8_Duty 80
        #define PMW_8_Clock_Source 4

        '    Supported PWM module but not by this specific microcontroller
        '
        '    #define PWM_9_Duty 90
        '    #define PMW_9_Clock_Source 6


        '   Enable module 7
        HPWMOn ( 7, PWMModule )
        wait 2 s
        '   Disable channel 7
        HPWMOff ( 7, PWMModule)
        '    wait 2 s

        '   Enable others module
        HPWMOn ( 5, PWMModule )
        HPWMOn ( 6, PWMModule )
        HPWMOn ( 7, PWMModule )
        HPWMOn ( 8, PWMModule )

        '  Enable CCP/PWM channel 1  - uses constants FREQ and DUTY
        PWMOn

        '  Enable CCP/PWM channel 2
        PWMOn ( 2 )
        do
        loop

    End
```

  
  

  

<span class="strong">**For more help, see**</span>
<a href="pwmon" class="link" title="PWMOn">PWMOn</a> and
<a href="pwmoff" class="link" title="PWMOff">PWMOff</a> <span
class="strong">**or, for AVR see**</span>
<a href="hpwm_fixed_mode_for_avr" class="link" title="HPWM Fixed Mode for AVR">Fixed Mode PWM for AVR</a>

</div>
