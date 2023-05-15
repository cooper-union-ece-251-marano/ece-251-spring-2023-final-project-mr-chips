`ifndef instr_mem
`define instr_mem
module instr_mem          // a synthesisable rom implementation  
 (  
      input     [15:0]     pc,  
      output wire     [15:0]          instruction  
 );  
      wire [3 : 0] rom_addr = pc[4 : 1];  
     /*    lw     $3, 0($0) --   
           Loop:     
           slti $1, $3, 3  
           beq $1, $0, Skip  
           add $4, $4, $3   
           addi $3, $3, 1   
           beq $0, $0, Loop--  
           Skip  
 */  
      reg [15:0] rom[15:0];  
      initial  
      begin  
                rom[0] = 16'b1000000010000000;  
                rom[1] = 16'b1110000100000001;  
                rom[2] = 16'b0010101000100010;  
                rom[3] = 16'b1101000001100111;  
                rom[4] = 16'b0000010100110000;  
                rom[5] = 16'b0000010000100000; 
                rom[6] = 16'b0000110000010000;
                rom[7] = 16'b1010101010000000;  
                rom[8] = 16'b1100000001111010;  
                rom[9] = 16'b0000000000000000;  
                rom[10] = 16'b0000000000000000;  
                rom[11] = 16'b0000000000000000;  
                rom[12] = 16'b0000000000000000;  
                rom[13] = 16'b0000000000000000;  
                rom[14] = 16'b0000000000000000;  
                rom[15] = 16'b0000000000000000;  
      end  
      assign instruction = (pc[15:0] < 32 )? rom[rom_addr[3:0]]: 16'd0;  
 endmodule   

 `endif