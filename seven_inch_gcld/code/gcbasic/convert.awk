BEGIN {
	print "/*"
	print "  GCBASIC Levetop Init Codes - see later for supported LCD resolution and characteristics" 
	print "  0x11 - command to specific register"
	print "  0x12 - read command. Read back the content of register [0xnn], and, keep reading the register until it reads specific value of the 4th parameter."
	print "  0x13 - write command. write explicit value of the 4th parameter."
	print "  0xAA - delay command. wait 100 us and a check LT7686_StatusRead & 0x08 = 0x08 "
	
	print "  The dataset is for a specific LCD panel."
	print "  For different panels, you must generate a valid dataset."
	print "  */"
	p1=""
}
{
	#dump header line
	if ( index($0, "61 72 77" ) != 0 )
		next
	if ( index($0, "11" ) == 1 ) {
		p1 = $3
		p2 = $4
		p3 = $1
		p4 = $2
		outstring()
		}
	else {
		
		if ( $1 == "AA" && $4 == "AA" ) {
			print trim( "0x"$1 ", 0x"$2 ", 0x" $3 ", 0x"$4)
		}
		else if ( $1 == "AA" && $2 == "AA" && $3 != "AA"  ) {
			p3 = $3
			p4 = $4
			print "0xAA, 0xAA"
			next
			}
		else {
			if ( p1=="" )
				{
					print trim("0x"$1 ", 0x"$2)
				}
			else {
				p1 = $1
				p2 = $2
				outstring()
				p3 = $3
				p4 = $4
				}		
			}
	}

	 
}

END {

	if ( Y_L == "DF" && Y_H == "01" ) {
	print "// Specific graphics dimensions for 800x480 LCD & Levetop LT7686 Solution"
	}
	
	print "0x11, 0x68, 0x13, 0x00"
	print "0x11, 0x69, 0x13, 0x00"
	print "0x11, 0x6A, 0x13, 0x00"
	print "0x11, 0x6B, 0x13, 0x00"

	#write 799 * 479 dimensions
	if ( Y_L == "DF" && Y_H == "01" ) {
		X_L = "1F"
		X_H = "03"
	}
	printf("0x11, 0x6C, 0x13, 0x%s\n",X_L)
	printf("0x11, 0x6D, 0x13, 0x%s\n",X_H)
	printf("0x11, 0x6E, 0x13, 0x%s\n",Y_L)
	printf("0x11, 0x6F, 0x13, 0x%s\n",Y_H)
	print "0xAA, 0xAA"
}	

    function ltrim(s) { sub(/^[ \t\r\n]+/, "", s); return s }
    function rtrim(s) { sub(/[ \t\r\n]+$/, "", s); return s }
    function trim(s)  { return rtrim(ltrim(s)); }

    function outstring() {
			#print p1" "p2" "p3" "p4


			if ( p4 == "1A")
				Y_L = p2
			if ( p4 == "1B")
				Y_H = p2
							
			if ( p4 == "B6" )		
				print trim("// 0x"p3 ", 0x"p4 ", 0x"p1 ", 0x"p2 " // Do not call DMA  enable")
		else if ( p1 == "12" ) {
				print "// Read register [0x"p4"], and, validate previous write operation 0x" p2" was sucessful"
				print trim("0x"p3 ", 0x"p4 ", 0x"p1 ", 0x"p2)
				}
			else if ( p4 == "12" ) {
				print "// Display Configuration Register (DPCR)"
				print trim("0x"p3 ", 0x"p4 ", 0x"p1 ", 0x"p2)
				}
			else if ( p4 == "20" ) {
				print "// Main Image Start Address 0 (MISA0))"
				print trim("0x"p3 ", 0x"p4 ", 0x"p1 ", 0x"p2)
				}
			else if ( p4 == "BB" ) {
				print "// SPI Clock period (SPI_DIVSOR)"
				print trim("0x"p3 ", 0x"p4 ", 0x"p1 ", 0x"p2)
				}
			else if ( p4 == "E0" ) {
				print "// SDRAM attribute register (SDRAR)"
				print trim("0x"p3 ", 0x"p4 ", 0x"p1 ", 0x"p2)
				}
			else if ( p4 == "50" ) {
				print "// Canvas Start address 0 (CVSSA0)"
				print trim("0x"p3 ", 0x"p4 ", 0x"p1 ", 0x"p2)
				}
			else if ( p4 == "84" ) {
				print "// PWM Section"
				print trim("0x"p3 ", 0x"p4 ", 0x"p1 ", 0x"p2)
				}
			else if ( p4 == "B7" ) {
				print "// Serial Flash/ROM Controller Register (SFL_CTRL)"
				print trim("0x"p3 ", 0x"p4 ", 0x"p1 ", 0x"p2)
				}
			else if ( p4 == "05" ) {
				print "// PLL Section"
				print trim("0x"p3 ", 0x"p4 ", 0x"p1 ", 0x"p2)
				}				
			else if ( p4 == "BC" ) {
				print "// DMA Section"
				print trim("0x"p3 ", 0x"p4 ", 0x"p1 ", 0x"p2)
				}
			else if ( p4 == "8E" ) {
				print "// Set value is 0x00..reg[0x8C] as %"
				print trim("0x"p3 ", 0x"p4 ", 0x"p1 ", 0x"p2)
				}
			else
				print trim("0x"p3 ", 0x"p4 ", 0x"p1 ", 0x"p2)
	}