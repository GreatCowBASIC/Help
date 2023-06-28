<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="_hserprint"></span>HSerPrint

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    HSerPrint user_value [,1|2|3|4]  'Choose comport with optional parameter
                                       'Default comport is 1

    'Send a series of ASCII characters using the buffer called SerialPacket
    Dim SerialPacket as Alloc
    SerialPacket = 66, 105, 108, 108, 38, 69, 118, 97, 110, 13, 10
    HserPrint ( SerialPacket, 1 )  ’explicit to comport 1
    SerialPacket = 66,44,73,44,82,13,10
    HserPrint ( SerialPacket )  ’defaults to comport 1
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers with a USART or UART module.  

Microchip PIC supports USART1 and 2.  
Atmel AVR supports USART 1,2,3 and 4.

<span class="strong">**Enabling Constants:**</span>

To enable the use of the USART these are the enabling constants.   These
constants are required.  You can change the `USART_BAUD_RATE` and to
meet your needs.  For addition USART ports use
`#define USARTn_BAUD_RATE 9600` where `` n` `` is the required port
number.

``` screen
    'USART settings for USART1
    #define USART_BAUD_RATE 9600
    #define USART_TX_BLOCKING
    #define USART_DELAY OFF
```

<span class="strong">**Explanation:**</span>

`HSerPrint` is used to send a value over the serial connection.
`user_value` can be a string, integer, long, word or byte. `HSerPrint`
is very similar to `Print`. The data will be sent out the hardware
serial module.

`HSerPrint` will not send any new line characters. If the chip is
sending to a terminal, these commands should follow every `HSerPrint` :

``` screen
  HSerPrint 13
  HSerPrint 10
```

<span class="strong">**Example:**</span>

``` screen
  'This program will display any values received over the serial
  'connection. If "pot" is received, the value of the analog sensor
  'will be sent.
  'Note: This has been adapted from the SerPrint example.

  'Chip settings
  #chip 18F2525, 8

  'LCD settings
  #define LCD_IO 4
  #define LCD_WIDTH 20                ;specified lcd width for clarity only.  20 is the default width
  #define LCD_RS PORTC.7
  #define LCD_RW PORTC.6
  #define LCD_Enable PORTC.5
  #define LCD_DB4 PORTC.4
  #define LCD_DB5 PORTC.3
  #define LCD_DB6 PORTC.2
  #define LCD_DB7 PORTC.1

  'USART settings
  #define USART_BAUD_RATE 9600
  #define USART_TX_BLOCKING
  #define USART_DELAY OFF

  'Potentiometer
  #define POT_PORT PORTA.0
  #define POT_AN AN0

  'Set pin directions
  Dir POT_PORT In

  'Create buffer variables to store received messages
  Dim Buffer As String
  Dim OldBuffer As String
  BufferSize = 0

  'Show test messages
  Print "Serial Tester"
  Wait 1 s
  HSerPrint "GCBASIC RS232 Test"
  HSerSend 13
  HSerSend 10
  Wait 1 s

  'Main loop
  Do
    'Get a byte from the terminal
    HSerReceive Temp

    'If Enter key was pressed, deal with buffer contents
    If Temp = 13 Then
      Buffer(0) = BufferSize

      'Try to execute commands in buffer
      If Not ExecCommand (Buffer) Then
        'Show message on bottom line, last message on top.
        CLS
        Print OldBuffer
        Locate 1, 0
        Print Buffer
        'Store the message for next time
        OldBuffer = Buffer
      End If

      BufferSize = 0
    End If
    'Backspace code, delete last character in buffer
    If Temp = 8 Then
      If BufferSize > 0 Then BufferSize -= 1
    End If
    'Received ASCII code between 32 and 127, add to buffer
    If Temp >= 32 And Temp <= 127 Then
      BufferSize += 1
      Buffer(BufferSize) = Temp
    End If
  Loop

  'Takes a sensor reading and sends it to terminal
  Sub SendSensorReading
    HSerPrint "Sensor Reading: "
    HSerPrint ReadAD10(POT_AN)
    HSerSend 13
    HSerSend 10
  End Sub

  'Will check the buffer for a command
  'If command found, run it and return true
  'If not, return false
  Function ExecCommand (CmdIn As String)
    ExecCommand = False
    'If received command is "pot", show potentiometer value
    If CmdIn = "pot" Then
      SendSensorReading
      ExecCommand = True
    End If
  End Function
```

<span class="strong">**For more help, see also**</span>
<a href="_hserprintbytecrlf.html" class="link" title="HserPrintByteCRLF">HserPrintByteCRLF</a>,
<a href="_hserprintstringcrlf.html" class="link" title="HSerPrintStringCRLF">HserPrintStringCRLF</a>
<span class="strong">**and**</span>
<a href="_hserprintcrlf.html" class="link" title="HserPrintCRLF">HserPrintCRLF</a>

</div>
