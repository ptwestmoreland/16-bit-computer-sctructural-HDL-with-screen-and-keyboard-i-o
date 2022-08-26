// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.


// goal is to multiply two values in R0 and R1
// create a loop, loop r1/r2 times and add the other to itsself in each iteration

// high level description (CPU EMULATOR DOESNT ALLOW MULTILINE COMMENTS)

// declare i and sum, intiliaze to i = 1 and sum = 0
// let k be the value stored in R0 and m be the value stored in R1
// loop while(i <= R1){
// sum += R0
// i++ }
// exit loop and store sum in R2
// end program

// Testing was a success


// assembly program begins below:

// create i = 1 loop i <= value in R1

@i // declare variable identified by i, register A stores its mem location
M = 1 // mem[A] = i = 1
@sum // create variable to hold sum of repeated addition
M = 0 // set sum = 0 initially

(LOOP) // define loop location

// check condition i <= R1, if false exit loop
        @i // register A now stores i memory location
        D = M // register D = mem[A], so D = i

        @R1

        D = D - M // i = i - R1
        @BODY
        D; JGT // jump to end if (i - R1) > 0, equivalenty i > R1 so that we loop R1 times
        // if its not greater than 0 execute loop body below
        // add sum + R0 for each execution of the loop

        // now get sum and R0 in D and M and add them
        @R0
        D = M
        @sum
        M = M + D
        // increment i
        @i
        M = M + 1

        // below code is too inefficient, it stores sum in R2 each iteration

      //  @sum
      //  D = M  register D stores sum
    //    @R2
    //    M = D store sum in register 2 content

        @LOOP
        0; JMP // go back to loop and repeat body

(BODY) // new method to store R0 * R1 in R2 more efficiently with less operations, program terminates after this with jump to END
      @sum
      D = M
      @R2
      M = D
      @END // branch to program termination at this point
      0;JMP

(END) // end program

      @END
      0;JMP
