--Anderson Kmetiuk
--João dos Reis

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rom is
	port( 	clk: in std_logic;
			endereco: in unsigned(7 downto 0);
			dado: out unsigned(15 downto 0)
		);
end entity;

architecture a_rom of rom is
	type mem is array (0 to 255) of unsigned(15 downto 0);
	constant conteudo_rom : mem := (
		-----PREENCHE A RAM DE 0 A 32 COM 1,2,3,...,33-----
		0 => b"101111_00000_11111", --addiw R0,#31
		1 => b"001011_01000_00000", --mov R8,R0 (R8-> comparacao de end)
		2 => b"101111_01000_00001", --addiw R8,#1 (R8=32)
		3 => b"101111_00000_00010", --addiw R0,#2 -> R0=33 (comparacao)
		4 => b"101111_00001_00001", --addiw R1,#1 (valor) 
		5 => b"000101_00010_00000", --cp R2,R0
		6 => b"111100_0000001_10_0",--brbs ->PC+1+1 se nao for igual (quando for igual z=1 _01_) 
		7 => b"100101_00_00001100", --se for igual jmp #12
		8 => b"100110_00010_00001", --st R2,(R1)
		9 => b"101111_00001_00001", --addiw R1,#1
		10 => b"101111_00010_00001", --addiw R2,#1
		11 => b"100101_00_00000101", --jmp #5
		12 => b"001011_00000_11111", --mov R0,R31 -zera R0
		13 => b"001011_00001_11111", --mov R1,R31 -zera R1
		14 => b"001011_00010_11111", --mov R2,R31 -zera R2
		
		-----TESTE DOS PRIMOS R0 (END MEMORIA), R1 (NUMERO DA MEMORIA A SER ACESSADO)
		-- R2 (NUMERO QUE VAI SER USADO NAS DIVISOES SUCESSIVAS)
		-- R3 AUX DA SUBTRACAO 
		15 => b"101111_00000_00010", --addiw R0,#2 (começa o teste pelo end 2 onde tem o numero 3)
		16 => b"101111_00010_00010", --addiw R2,#2
		17 => b"100100_00000_00001", --ld R1,(R0)
		18 => b"001011_00011_00001", --mov R3,R1
		19 => b"000101_00011_11111", --cp R3,R31
		20 => b"111100_0000010_01_0",--brbs ->PC+1+2 se for 0 nao é primo (pula pro 23)
		21 => b"111100_0000101_10_0",--brbs ->PC+1+5 se for negativo (pode ser primo) (pula pro 27)
		22 => b"100101_00_00011001", --jmp #25 continua loop
		
		-----não é primo vai pro próximo número (sub sucessivas = 0) ----
		23 => b"100110_00000_11111", --st R0,(R31) se nao for primo coloca 0 no endereço
		24 => b"100101_00_00011111", --jmp #31  prox end de teste 
		
		-----continuação do loop de teste (sub sucessivas)------
		25 => b"000110_00011_00010", --sub R3,R2
		26 => b"100101_00_00010011", --jmp #19  volta pra cp
		
		-----pode ser primo (sub sucessivas = negativo) -----
		27 => b"101111_00010_00001", --addiw R2,#1 --prox numero pra testar na sub 
		28 => b"000101_00001_00010", --cp R1,R2 (R1 n testado, R2 sub a ser testada)
		29 => b"111100_0000001_01_0",--brbs ->PC+1+1 se for 0 o teste terminou e é primo (pula pro 31)
		30  => b"100101_00_00010010", --jmp #18 recarrega o R3 com o val inicial
		
		----- proximo endereço de teste
		31  => b"101111_00000_00001", --addiw R0,#1 proximo end 
		32  => b"001011_00010_11111", --mov R2,R31 -zera R2
		33 => b"000101_01000_00000", --cp R8,R0
		34 => b"111100_0000001_10_0",--brbs ->PC+1+1 se for negativo (passou 1) para (pula pro fim)
		35  => b"100101_00_00010000", --jmp #16 recomeça colocando 2 no R2
		36 => "0000000000000000", --nop 
		---- carrega no display (Vfinal do R0=33, R1=33, R2=0, R3=0, R8=32,R31=0)
		37 => b"101111_00000_11111", --addiw R0,#31 -> R0=64
		38 => b"000111_00000_00000", --adc R0,R0 -> R0 = 128
		39 => b"100111_00000_00000", --dec R0 -> R0=127	
		40 => b"000101_00001_00010", --cp R1,R2 (R2 endereços) loop endereços
		41 => b"111100_0000110_01_0",--brbs ->PC+1+6 se for 0 o teste terminou
		42 => b"100100_00010_00011", --ld R3,(R2) (R3 aux)
		43 => b"000101_11111_00011", --cp R31,R3 --se o valor for 0 não é primo 
		44 => b"111100_0000001_01_0",--brbs ->PC+1+1 se for 0 nao é primo, nao imprime
		45 => b"100110_00000_00011", --st R0,(R3) se for primo imprime na tela end127 <- valor de R3
		----- incrementa pro prox end
		46 => b"101111_00010_00001", --addiw R2,#1 --incrementa end
		47 => b"100101_00_00101000", --jmp #40 (cp para saber se já varreu todos end)
		48 => b"001011_00010_11111", --mov R2,R31 -zera R2
		49 => b"100101_00_00101000", --jmp #40 
		
		others => (others=>'0')
	);
begin
	process(clk)
	begin
		if (rising_edge(clk)) then
			dado <= conteudo_rom(to_integer(endereco));
		end if;
	end process;	
end architecture;