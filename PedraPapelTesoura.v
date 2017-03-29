/*
UFFS
Milton Junior Viot
Sistemas Digitais

	00	Tesoura 	00	Empate
	01 	Pedra 		01	Jogador A Vence
	10	Papel 		10	Jogador B Vence
	11	Inválido    11	Inválido
*/
module PedraPapelTesoura (
		input [3:0] Jogador1_A,
		input [3:0] Jogador1_B,
		output S1,S2
);
reg S1R;
reg S2R;

assign S1=S1R;
assign S2=S2R;


	always @(Jogador1_A, Jogador1_B) begin


		if (Jogador1_A == 4'b1011 || Jogador1_B == 4'b1011)	begin	/* caso invalido*/
				S1R<= 0;
				S2R<= 0;
			end

		else if (Jogador1_A == 4'b0000 && Jogador1_B == 4'b0000)	begin/* Tesoura caso de empate*/
				S1R<= 1;
				S2R<= 1;
			end
		else if (Jogador1_A == 4'b0001 && Jogador1_B == 4'b0001)	begin/*Pedra  caso de empate*/
				S1R<= 1;
				S2R<= 1;
			end
		else if (Jogador1_A == 4'b1010 && Jogador1_B == 4'b1010) begin /* Papel caso de empate*/
				S1R<= 1;
				S2R<= 1;
			end
		else if (Jogador1_A == 4'b0001 && Jogador1_B == 4'b0000) begin /* Pedra caso de vitoria do Jogador A pedra sobre tesoura*/
				S1R<= 1;
				S2R<= 0;
			end
		else if (Jogador1_A == 4'b0000 && Jogador1_B == 4'b1010) begin /* Tesoura caso de vitoria do Jogador A tesoura sobre Papel*/
				S1R<= 1;
				S2R<= 0;
			end
		else if (Jogador1_A == 4'b1010 && Jogador1_B == 4'b0001) begin /* caso de vitoria do Jogador A Papel sobre Pedra*/
				S1R<= 1;
				S2R<= 0;
			end

		else if (Jogador1_A == 4'b0000  && Jogador1_B ==4'b0001) begin /* caso de vitoria do Jogador B pedra sobre tesoura*/
				S1R<= 0;
				S2R<= 1;
			end
		else if (Jogador1_A == 4'b1010 && Jogador1_B == 4'b0000) begin /* caso de vitoria do Jogador B tesoura sobre Papel*/
				S1R<= 0;
				S2R<= 1;
			end
		else if (Jogador1_A == 4'b0001 && Jogador1_B == 4'b1010) begin /* caso de vitoria do Jogador B Papel sobre Pedra*/
				S1R<= 0;
				S2R<= 1;
			end
	end

endmodule



module test;

reg [3:0]Jogador1_A;
reg [3:0]Jogador1_B;
wire S1;
wire S2;



PedraPapelTesoura P1 (Jogador1_A,Jogador1_B,S1,S2);

	initial begin
		$dumpvars (0,P1);
		#0;
		Jogador1_A <=4'b1011;
		Jogador1_B <= 4'b1011;

		#20;
		Jogador1_A <=4'b0000;
		Jogador1_B <= 4'b000;
		#50;
	end
endmodule
/*
UFFS
Milton Junior Viot
Sistemas Digitais

	00	Tesoura 	00	Empate
	01 	Pedra 		01	Jogador A Vence
	10	Papel 		10	Jogador B Vence
	11	Inválido    11	Inválido
	*/
