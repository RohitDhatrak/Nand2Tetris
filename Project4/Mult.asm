// set addNTimes = 0 and sum = 0
@addNTimes
M=0
@sum
M=0
(LOOP)
// if (addNTimes == R1) goto END
@addNTimes
D=M
@R1
D=D-M
@END
D;JEQ
// while addNTimes != R1 do sum += R0
@R0
D=M
@sum
M=D+M
@addNTimes
M=M+1
// go to LOOP
@LOOP
0;JMP
(END)
// store result of sum in R2
@sum
D=M
@R2
M=D
@END
0;JMP
