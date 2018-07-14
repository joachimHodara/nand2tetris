// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

    @8192
    D=A
    @n
    M=D      // n = 32*256 = 8192

(KEYBOARD)

    @i
    M=0      // restart counter

(LOOP)

    @KBD
    D=M
    @WHITE
    D;JEQ    // goto WHITE if no key pressed

(BLACK)

    @i
    D=M
    @SCREEN
    A=A+D
    M=-1    // print black 
    
    @END
    0;JMP   // skip white section

(WHITE)

    @i
    D=M
    @SCREEN
    A=A+D
    M=0      // print white

(END)

    @i
    MD=M+1   // i = i + 1
    @n
    D=D-M
    @KEYBOARD
    D;JEQ    // goto KBD if i == n

    @LOOP
    0;JMP

