// <Houston & Fawver, EE 133 Lab 5, 05-06-2014>

module RS_NOR(R,S,Q,nQ);
	input R,S;
	output Q,nQ; //nQ is not Q
	
	nor n1 (Q,nQ,R);
	nor n2 (nQ,Q,S);
endmodule
