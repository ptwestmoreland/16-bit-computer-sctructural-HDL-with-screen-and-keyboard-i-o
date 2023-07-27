# NAND2TETRIS-
This is a program where a user  builds a simple but modern computer from the ground up. For the hardware portion, I wanted to use verilog but I decided to just go with how the program is designed because they provide accurate test scripts and a simulator. I am looking forward to doing this program and I haven't been this excited in a long time. Detailed project descriptions are in the readme.


Project 1: 

This chapter and project introduces basic logic gates and combinational logic blocks. In this project, I was tasked with constructing the   elementary logic gates AND,OR,NOT from an inbuilt primtiive NAND gate. I used the structural hardware description language provided with the textbook that requries you to think out the gate structure and then connect the gates with the HDL. I prefer behavorial modeling though. I first constructed the Not gate module with just one NAND gate and then developed the other elementary gate modules from there. I then developed a 2x1 Multiplexor using these gates. Then i developed a 1x2 demultiplexor. From here, I created multiway/multibit versions of the above modules utilizing busses and the modules above. The coolest part of this to me is that all of the hardware is constructed from the universal NAND gate, although in real life it would be more efficient to use custom gates. Code is well commented and explained.



Project 2: 

Contains the addition logic and a structurally described ALU 

Project 3: 

Contains the d flip flop, registers, RAM units and program counter. 

Project 4: 

Contains assembly language programs to fill screen with black when any key is pressed and to multiply two numbers in a register. This multiplication implementation is not effcient but my ALU can't shift. 

Project 5: 

Contains the CPU, final data memory(includes screen and keyboard memory map) , instruction memory, and a computer module.
