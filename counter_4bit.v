// 4-bit_counter.v
// A simple 4-bit counter with synchronous reset

module counter_4bit (
    input wire clk,        // Clock input
    input wire reset,      // Active high reset
    output reg [3:0] count // 4-bit counter output
);

    // Counter logic
    always @(posedge clk) begin
        if (reset) begin
            count <= 4'b0000; // Reset counter to 0
        end else begin
            count <= count + 1'b1; // Increment counter
        end
    end

endmodule

// Testbench for 4-bit counter
module counter_4bit_tb;
    // Testbench signals
    reg clk;
    reg reset;
    wire [3:0] count;
    
    // Instantiate counter
    counter_4bit dut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );
    
    // Clock generation
    always #5 clk = ~clk;
    
    // Test sequence
    initial begin
        $monitor("Time = %0t, Reset = %b, Count = %b", $time, reset, count);
        
        // Initialize signals
        clk = 0;
        reset = 1;
        
        // Apply reset
        #10 reset = 0;
        
        // Let counter run for some cycles
        #100;
        
        // Apply reset again
        reset = 1;
        #10 reset = 0;
        
        // Run a few more cycles
        #50;
        
        // End simulation
        $finish;
    end
endmodule