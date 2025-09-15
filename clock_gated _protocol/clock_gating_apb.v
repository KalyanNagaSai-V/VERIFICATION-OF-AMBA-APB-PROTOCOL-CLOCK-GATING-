module clock_gating(input wire clk,input wire enable,input wire reset,output reg gated_clk);
reg latch_enable;
always @(*) begin
if(!clk)
latch_enable=enable;
end
always @(posedge clk or posedge reset) begin
if(reset)
gated_clk<=0;
else
gated_clk<=clk&latch_enable;
end
endmodule

module apb_top(input wire clk,input wire reset,input wire [7:0] data_in,input wire [7:0] addr,input wire write_enable);
wire PSEL,PENABLE,PWRITE,PREADY;
wire [7:0] PADDR,PWDATA,PRDATA;
wire gated_clk;
clock_gating clk_gating(.clk(clk),.enable(write_enable|PSEL),.reset(reset),.gated_clk(gated_clk));
apb_master master(.clk(gated_clk),.reset(reset),.data_in(data_in),.addr(addr),.write_enable(write_enable),.PSEL(PSEL),.PENABLE(PENABLE),.PWRITE(PWRITE),.PADDR(PADDR),.PWDATA(PWDATA),.PRDATA(PRDATA),.PREADY(PREADY));
apb_slave sl(.clk(gated_clk),.PSEL(PSEL),.PENABLE(PENABLE),.PWRITE(PWRITE),.PADDR(PADDR),.PWDATA(PWDATA),.PRDATA(PRDATA),.PREADY(PREADY));
endmodule

module apb_master(input wire clk,input wire reset,input wire [7:0] data_in,input wire [7:0] addr,input wire write_enable,output reg PSEL,output reg PENABLE,output reg PWRITE,output reg [7:0] PADDR,output reg [7:0] PWDATA,input wire [7:0] PRDATA,input wire PREADY);
reg [1:0] state;
localparam IDLE=2'b00,SETUP=2'b01,ACCESS=2'b10;
always @(posedge clk or posedge reset) begin
if(reset) begin
state<=IDLE;
PSEL<=0;
PENABLE<=0;
PWRITE<=0;
PADDR<=0;
PWDATA<=0;
end else begin
case(state)
IDLE:begin
PENABLE<=0;
if(write_enable)begin
PSEL<=1;
PWRITE<=1;
PADDR<=addr;
PWDATA<=data_in;
state<=SETUP;
end else begin
PSEL<=0;
end
end
SETUP:begin
PENABLE<=1;
state<=ACCESS;
end
ACCESS:begin
if(PREADY)begin
PSEL<=0;
PENABLE<=0;
state<=IDLE;
end
end
endcase
end
end
endmodule

module apb_slave(input wire clk,input wire PSEL,input wire PENABLE,input wire PWRITE,input wire [7:0] PADDR,input wire [7:0] PWDATA,output reg [7:0] PRDATA,output reg PREADY);
reg [7:0] memory[0:255];
always @(posedge clk) begin
if(PSEL&&PENABLE)begin
PREADY<=1;
if(PWRITE)begin
if(memory[PADDR]!==PWDATA)
memory[PADDR]<=PWDATA;
end else begin
PRDATA<=memory[PADDR];
end
end else begin
PREADY<=0;
PRDATA<=8'bz;
end
end
endmodule
