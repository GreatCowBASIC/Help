<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="serial_rs232_buffer_ring"></span>Serial/RS232 Buffer Ring

</div>

</div>

</div>

<span class="strong">**Explanation:**</span>

This program demonstrates how to create a serial input buffer ring.

The program receives a character into the buffer and sends back. Try
sending large volumes of characters…​..

This program program uses an interrupt event to capture the incoming
byte value and place in the buffer ring. When a byte is received the
buffer ring is incremented to ensuer the next byte is handled correctly.

Testing `bkbhit` will set to True when a byte has been received. Reading
the function `bgetc` will return the last byte received.

<span class="strong">**Demonstration program:**</span>

This demonstration program will support up to 256 bytes. For a larger
buffer change the variables to words.

``` screen
    #chip 16F1937
    // #chip mega4809
    // #chip mega328p, 16


    // Add PPS if appropiate for your chip
    // [change to your config] This is the config for a serial terminal

    // assumes USART1 ( or USART0 on AVRDx ), if you select USART1/2/3/4 then you MUST add the comport parameter to all HSerxxxxx functions.
    // turn on the RS232 and terminal port.
    // Define the USART settings
    #DEFINE USART_BAUD_RATE 9600

    // This assumes you are using an ANSI compatible terminal.  Use PUTTY.EXE it is very easy to use.

    //   Main program

    // Wait for terminal to settle
    wait 3 s

    // Create the supporting variables
    Dim next_in As Byte
    Dim next_out As Byte
    Dim syncbyte As Byte
    Dim temppnt As Byte

    // Constants etc required for Buffer Ring
    #DEFINE BUFFER_SIZE 8
    #DEFINE bkbhit (next_in <> next_out)

    // Define the Buffer
    Dim buffer( BUFFER_SIZE - 1 ) // we will use element 0 in the array as part of out buffer

    // Call init the buffer
    InitBufferRing

    HSerSend 10
    HSerSend 13
    HSerSend 10
    HSerSend 13
    HSerPrint "Started: Serial between two devices"
    HSerSend 10
    HSerSend 13


    // Get character(s) and send back
    // Get character(s) and send back
    Do

        //  Do we have data in the buffer?
        if bkbhit then

            // Send the next character in the buffer to the terminal, exposed via the function `bgetc` back the terminal
            HSerSend bgetc

        end if
    Loop


    // Supporting subroutines

    Sub readUSART

        buffer(next_in) = HSerReceive
        temppnt = next_in
        next_in = ( next_in + 1 ) % BUFFER_SIZE
        If ( next_in = next_out ) Then  // buffer is full!!
            next_in = temppnt
        End If

    End Sub

    Function bgetc
        Dim local_next_out as Byte    // maintain a local copy of the next_out variable to ensure it does not change when an Interrupt happens
        local_next_out = next_out
        bgetc = buffer(local_next_out)
        local_next_out=(local_next_out+1) % BUFFER_SIZE
        INTOFF
        next_out = local_next_out
        INTON
    End Function




    Sub InitBufferRing

        // Set the buffer to the first address
        next_in = 0
        next_out = 0
        // Interrupt Handler - some have RCIE and some have U1RXIE, so handle
        //
        // You would need to change the Interrupt if you use USART1,2,3, or 4
        //
        #IFDEF BIT( RCIE )
            On Interrupt UsartRX1Ready Call readUSART
        #ENDIF
        #IFDEF BIT( U1RXIE )
            On Interrupt UART1ReceiveInterrupt Call readUSART
        #ENDIF

        #IFDEF AVR
            #IFNDEF CHIPAVRDX
                //~ Support for legacy AVR
                On Interrupt UsartRX1Ready Call readUSART
            #ELSE
                //~ Support for AVRDx - AVRDx chips are USART0,USART1,USART2,USART3 and USART4 not USART.
                On Interrupt Usart0RXReady Call readUSART
            #ENDIF
        #ENDIF

    End Sub
```

</div>
