<div class="section">

<div class="titlepage">

<div>

<div>

###### <span id="lcd_io_14_port_configuration"></span>LCD\_IO 14 Port Configuration

</div>

</div>

</div>

<span class="strong">**Using mode 14:**</span>

When using LCD mode 14 this is an example program to show a working
solution,

``` screen
        #chip 18F67K40, 8
        #option explicit

            'PPS Tool version: 0.0.6.3
            // Generated for 18f67k40

            #startup InitPPS, 85
            #define PPSToolPart 18f67k40

            Sub InitPPS

                    #ifdef LCD_HARDWARESPI
                        SSP1CLKPPS = 0x13;   //RC3->MSSP1:SCK1;
                        RC3PPS = 0x19;   //RC3->MSSP1:SCK1;
                        RC5PPS = 0x1A;   //RC5->MSSP1:SDO1;
                        SSP1DATPPS = 0x14;   //RC4->MSSP1:SDI1;
                    #endif

                End Sub

            //Constants - LCD connectivity type
            #define LCD_IO 14

            //Comment out to use software SPI
            #define LCD_HARDWARESPI

            #define LCD_SPEED FAST

            //Optional. Can also select MASTERSLOW or MASTER.  The compiler will set automatically.
            #define HWSPIMODE MASTERFAST

            //These are phyiscal connections from the expander to the LCD.  These are automatically set in the library and are shown here purely for clarity.
                #define     LCD_SPI_EXPD_ADDRESS        0x40
                #define LCD_SPI_EXPANDER_E_ADDRESS      0x40     // GPA6 on the expander
                #define LCD_SPI_EXPANDER_RS_ADDRESS     0x80     // GPA7 on the expander

            //Mandated Pin mappings for LCD IO SPI Expander
            #define LCD_SPI_DO          portc.5
            #define LCD_SPI_SCK         portc.3
            #define LCD_SPI_CS          porta.2
            // Optional(s) reset Port.Pin connection to expander, select one.
                // #define LCD_SPI_RESET_IN       portb.5
                #define LCD_SPI_RESET_OUT      portb.5


        ; ----- Main body of program commences here.

        ClS
        Print "Hello World"
```

</div>
