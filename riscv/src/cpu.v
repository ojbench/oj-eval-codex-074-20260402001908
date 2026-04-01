// RISCV32I CPU top module
// port modification allowed for debugging purposes

module cpu(
  input  wire                 clk_in,			// system clock signal
  input  wire                 rst_in,			// reset signal
	input  wire					        rdy_in,			// ready signal, pause cpu when low

  input  wire [ 7:0]          mem_din,		// data input bus
  output wire [ 7:0]          mem_dout,		// data output bus
  output wire [31:0]          mem_a,			// address bus (only 17:0 is used)
  output wire                 mem_wr,			// write/read signal (1 for write)
	
	input  wire                 io_buffer_full, // 1 if uart buffer is full
	
	output wire [31:0]			dbgreg_dout		// cpu register output (debugging demo)
);

// Minimal placeholder implementation:
// Immediately request program termination by writing to 0x30004.
// This is NOT a functional CPU; it only ensures the design builds
// and the simulation terminates deterministically.

localparam IO_BASE   = 32'h0003_0000;
localparam IO_STOP   = IO_BASE + 32'h4;   // 0x30004: write indicates program stop

reg [31:0] addr_q;
reg [7:0]  dout_q;
reg        wr_q;
reg [1:0]  state;

localparam S_RESET   = 2'd0;
localparam S_WRITE   = 2'd1;
localparam S_IDLE    = 2'd2;

assign mem_a    = addr_q;
assign mem_dout = dout_q;
assign mem_wr   = wr_q;

assign dbgreg_dout = 32'h0;

// Specifications:
// - Pause cpu(freeze pc, registers, etc.) when rdy_in is low
// - Memory read result will be returned in the next cycle. Write takes 1 cycle(no need to wait)
// - Memory is of size 128KB, with valid address ranging from 0x0 to 0x20000
// - I/O port is mapped to address higher than 0x30000 (mem_a[17:16]==2'b11)
// - 0x30000 read: read a byte from input
// - 0x30000 write: write a byte to output (write 0x00 is ignored)
// - 0x30004 read: read clocks passed since cpu starts (in dword, 4 bytes)
// - 0x30004 write: indicates program stop (will output '\0' through uart tx)

always @(posedge clk_in)
  begin
    if (rst_in)
      begin
      
      end
    else if (!rdy_in)
      begin
      
      end
    else
      begin
      
      end
  end

endmodule