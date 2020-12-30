module example (A,B,C,D,E,F,Y);

	input A,B,C,D,E,F;
	output Y;
	wire t1, t2, t3, Y;
	
	nand #1 G1 (t1, A, B);
	and #2 G2 (t2, C, ~B, D);
	nor #1 G3 (t3, E, F); 
	nand #1 G4 (Y, t1,t2,t3);
	
endmodule
