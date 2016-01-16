;AsmIDE autoload="load" autogo="g 2000"
*
* Lab Assignment 4, Fall 2014
*
* This is the EE333 Lab Starting Point. The spots marked with *** are the places to add your
* code. Values stored in the four bytes starting at disptn will be displayed on the 7-segment display.
* The mapping between the values and the character displayed is done by table segm_ptrn. The values 0
* through 9 display the characters "0" through "9" which is generally convenient. The row of LEDs display
* the bits in variable displ. The temperature value (scaled 10.24/5 counts per degree C) is available
* at location ADR05H and is a 16 bit value. The variable setpoint is the thermostat setting in degrees
* Fahrenheit. 
* The light sensor amplitude is the 16 bit value at ADR04H and will be in the range 0 to 1023.
* The Trimmer pot position is in the 16 bit value at ADR07H and will be in the range 0 to 1023.
* Example program written by Tom Almy, July, 2012

#include        registers.inc   ; include register equates and memory map

        org     DATASTART
;
char:          ds      1        ; Character last displayed (index 0, 1, 2, 3, 4 for LEDs)
disptn:        ds      4        ; These four bytes will be displayed
displ:         ds      1        ; This will be displayed in the row of LEDs
setpoint:      ds      2        ; Thermostat setpoint
                                ; Using the segment values shown below in segm_ptrn
* *** Add your variables here
RED     equ     $10     ; PP4
GREEN   equ     $40     ; PP6
BLUE    equ     $20     ; PP5
RELAY   equ     $4      ; PE2
lumavg:        ds       2       ; Lumination *256
tempavg:       ds       2       ; Temperature *256
counter:        ds      1       ; counter
flag:           ds      1       ; update the readings when non-zero
cnt2p5: ds      1               ; 2.5 second counter
lasttemp:       ds      2
* ***
        org     PRSTART
;
start:
        lds     #DATAEND        ; initialize the stack pointer

* I/O Device initialization
        movw    #rtiisr UserRTI ; initialize the interrupt vector
        ldaa    #$ff            ; Initialize GPIO ports for 7 segment LED
        staa    DDRB            ; portb = output
        staa    DDRP            ; portp = output
        movb    #$0f PTP        ; turn off 7-segment display
        bset    DDRJ #2         ; Set Port J pin 1 for output

        movb    #$17 RTICTL     ; RTI divider is 8192, about 1 mSec
        bset    CRGINT #$80     ; enable RTI interrupts

        movb    #$80 ATD0CTL2   ; Turn on ATD, initilize and start running
        ldaa    #240/3          ; 10 microsecond delay
        dbne    a *
        clr     ATD0CTL3        ; 8 conversions
        movb    #$b0 ATD0CTL5   ; mult mode, scan mode, right justify

* Variable initialization
        ldx     #disptn         ; Address of display field
        movb    #$11+$80 1,X+ ; binary code for the letter 'H' 
                                ; (set decimal point as well)
        movb    #$0E 1,X+       ; binary code for the letter 'E'
        movb    #$14 1,X+       ; binary code for the letter 'L'
        movb    #$18 0,X        ; binary code for the letter 'P'
        movb    #$5a displ      ; Pattern for LED row
        movw    #80 setpoint    ; Initialize the setpoint to 80 degrees


* *** Any code you need to initialize should go here
        bset    DDRE #RELAY     ; set relay pin as output
        bset    DDRP #RED+GREEN+BLUE ; set RGB LED pins for output
        bclr    PTP  #RED+GREEN+BLUE ; Turn RGB LED off
        bset    DDRM #4         ; enable RGB LED
        bclr    PTM #4
        clr     cnt2p5          ; make sure this counter starts at zero
* ***  
        cli                     ; Start interrupts
idle:   wai                     ; idle process
* *** Code you need to execute repeatedly should go here
        tst     flag            ; Only update when flag has been set
        beq     nodisplay
        clr     flag
        movb    lumavg displ

        inc     cnt2p5
        ldaa    cnt2p5
        cmpa    #10             ; 2.5 seconds is 10 * 1/4 second
        bne     no_action
        clr     cnt2p5          ; reset count
        ldd     tempavg
        cpd     lasttemp        ; see if temperature changed in last 2.5 seconds
        bhi     went_up
        blo     went_down
        bclr    PTP #RED+GREEN+BLUE  ; no change = no lights
        bra     led_done
went_down:
        bset PTP #GREEN      ; down - green on and red off
        bclr    PTP #RED
        bra     led_done
went_up:
        bset   PTP #RED        ; up - red on and green off
        bclr    PTP #GREEN
led_done:
        std     lasttemp       ; current temperature becomes last for next time
no_action:

        ldab    tempavg         ; get temperature
        clra
        cpd     setpoint        ; compare temperature with setpoint
        bhi     ac_on
        beq     ac_same
        bclr    PORTE #RELAY    ; turn AC OFF
        bra     ac_same
ac_on:  bset    PORTE #RELAY    ; turn AC ON
ac_same:
        ldx     #10             ; divide by 10
        idiv
        stab    disptn+2        ; remainder is units
        tfr     X D
        ldx     #10
        idiv
        stab    disptn+1        ; remainder is tens place
        tfr     X D
        stab    disptn          ; quotient is 100's place
        movb    #15 disptn+3    ; The "F" character
        
nodisplay:
* ***
        jmp     idle

rtiisr: ; RTI Interrupt service routine
        bset    CRGFLG #$80     ; clear RTI flag
        ldab    char            ; character selection
        cli                     ; allow other interrupts to occur 
        incb                    ; char+1 modulo 5
        cmpb    #5
        bne     TA1
        clrb
TA1:    stab    char
        cmpb    #4              ; is it LED row?
        beq     TA2
        bset    PTJ #2          ; turn off LED row
        tfr     b x             ; character selection in X
        ldaa    disptn,x        ; get desired display value
        tfr     a b
        anda    #$7f            ; mask of the decimal point
        ldy     #segm_ptrn      
        ldaa    a,y             ; look up segments to light in table
        andb    #$80            ; mask off all but the decimal point
        aba                     ; merge decimal point into segment value
        staa    PORTB           ; light the segments
        ldaa    PTP             ; only alter port p bits we are using
        anda    #$f0
        oraa    dspmap,x        ; light up correct char
        staa    PTP
        bra     TA3
TA2:    bset    PTP #$0f        ; turn off seven segment LEDs
        movb    displ PORTB     ; set value of LED row
        bclr    PTJ #2          ; turn on LED row        
TA3:
* *** Any code you place here will execute every 1.024 milliseconds. Don't put anything here
* *** that may take an arbitrarily long time to execute.
        ldd     ADR04H          ; Illumination
        lsrd
        lsrd                    ; divide LED value by 4
        addd    lumavg          ; calculate VAL+ lumavg - lumavg/256
        subb    lumavg
        sbca    #0              ; handle borrow
        std     lumavg

        ldd     ADR05H          ; Temperature
        ldy     #900            ; multiply by 900, divide by 1023 and add 32 to get
        emul                    ; temperature in degrees F
        ldx     #1023
        ediv
        leay    32,Y
        tfr     Y D             ; move temperature to D
        addd    tempavg         ; calculate VAL+ tempavg - tempavg/256
        subb    tempavg
        sbca    #0
        std     tempavg
        
        inc     counter         ; Set flag when counter=0
        bne     noflag
        movb    #1 flag
noflag:
* ***
        rti

* Tables (constant data arrays)
dspmap: db      $0e,$0d,$0b,$07 ; Selects the correct character for lighting

segm_ptrn:                                              ; segment pattern
        db     $3f,$06,$5b,$4f,$66,$6d,$7d,$07          ; 0-7
;                0,  1,  2,  3,  4,  5,  6,  7
        db     $7f,$6f,$77,$7c,$39,$5e,$79,$71          ; 8-15
;                8,  9,  A,  b,  C,  d,  E,  F
        db     $3d,$76,$74,$1e,$38,$54,$63,$5c          ; 16-23
;                G,  H,  h,  J   L   n   o   o
        db     $73,$50,$78,$3e,$1c,$6e,$08,$40          ; 24-31
;                P,  r,  t,  U,  u   Y   _   -
        db     $00                                      ; 32
;               blk
;
* *** Add any tables or other constant values here

* ***
        end