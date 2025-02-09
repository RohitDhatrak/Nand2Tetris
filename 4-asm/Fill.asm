// set n = 0
@n
M=0

// set darkenFlag to 0
@darkenFlag
M=0

// store SCREEN address in a pointer variable
@SCREEN
D=A
@screenPtr
M=D

// store max SCREEN range in a varable
@8192
D=A
@maxScreenN
M=D

(START)

// reset n if it crossed the keyboard register range
@maxScreenN
D=M
@n
D=D-M

@CONTINUEINC
D;JGE

@n
M=0

(CONTINUEINC)

// check if any key is being pressed
@KBD
D=M
@DARKEN

// jump to DARKEN if key is being pressed
D;JNE

@darkenFlag
D=M

// go to CONTINUEWHITE if flag is 0
@CONTINUEWHITE
D;JEQ

// reset n to 0 & darkenFlag to 0 if darkenFlag is 1
@darkenFlag
M=0
@n
M=0

(CONTINUEWHITE)
// keep whitening the SCREEN
@screenPtr
D=M
@n
A=D+M
M=0

// increment n 
@n
D=M
M=D+1

// jump to START
@START
0;JMP

// keep darkening the SCREEN
(DARKEN)

@darkenFlag
D=M

// go to CONTINUEDARK if flag is not 0
@CONTINUEDARK
D;JNE

// reset n to 0 & set darkenFlag if darkenFlag is 0 
@darkenFlag
M=1
@n
M=0

(CONTINUEDARK)

@screenPtr
D=M
@n
A=D+M
M=-1

// increment n 
@n
D=M
M=D+1

// jump to START
@START
0;JMP
