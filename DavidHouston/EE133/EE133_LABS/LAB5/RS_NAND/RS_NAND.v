// <Houston & Fawver, EE 133 Lab 5, 05-06-2014>

module RS_NAND(nS,nR,Q,nQ);
	input nS,nR;  // nS = ~S , nR = ~R;
	output Q,nQ;
	
	assign Q = ~(nS & nQ);
	assign nQ = ~(nR & Q);
endmodule
