// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.


(begin)
       // load constant value that represents each of the 256 rows on screen
			 // a screen has 256 pixel rows, each row is represented by 32 16 bit words 32*256 = 8192
      @k // declare and initialize loop variable
			 M = 0
			 @8192 // store constant val 8192 in register A

			 D = A
			 @k
			 M = D  // mem[a] = k = D = 8192 (loop variable)


(loop)
    // check for keyboard input, reset loop condition when it runs out to create infinite loop required
    // k is the loop variable, we loop through all of the pixel rows then start over. loop from 8192 to 0th
		// check for k < 0 and deincrement k
		@k
		D = M // stores k current value in data register
		@0
		D = D - A // D = (k - 0)
		@begin
		D;JLT // go to begin if (k - 0) < 0 and reset k then start looping again
		// deincrement k
		@k
		M = M - 1
		// check for keyboard input and jump to white or black depending on the lack or presence of a key being pressed
		// when a key is pressed its ascii code character appears at mem[24576], this location has 0 in it when no key is pressed
		// one option is to write jump to black code for any ascii code, but theres a simpler way that i will do below
		@KBD // put mem location 2476 in register A
		D = M // d is the condition register, if d == 0, jump to white b/c no key is pressed
    @white
		D;JEQ // jump to white when D = mem[2476] = 0 and no key is being pressed
		// for all other cases a key is being pressed so if the branch above isn't taken we jump to black
		@black
		0;JMP // only executes if we don't branch to white

(white)
      // we want to make each pixel on the screen white here when a key is not being pressed, then jump back to the loop to "paint" next row white where we also continously check for they keyboard input
			@SCREEN // gets address 16384 in A
			// we want to turn one row white by painting mem[16384 + x] white
			D = A // get above memory value in register D and add k to it
			@k
			D = D + M
			A = D // now has correct address in it
			M = 0 // mem[A] = 0 = white
			@loop // go back to loop to do the next row
			0;JMP


(black)
       @SCREEN  // using a different method than above
       D = A
			 @k
			 D = D + M
			 A = D
			 M = -1 // initially used M = 1, incorrect that sets the binary value to 000..1 when we actually want each one to be one, 2's comp -1 = 1111...111

			 @loop // go back to loop for next row 
			 0;JMP
