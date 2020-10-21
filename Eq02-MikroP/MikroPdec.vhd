LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
use ieee.numeric_std.all;


-- decodificação binary do BCD por contas ()
ENTITY MikroPdec IS
PORT 
	( 	
		switch :IN STD_LOGIC_VECTOR (7 downto 0);
		-- clock
		-- reset
		HEX0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		HEX1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0) -- limpar outros dígitos (max 255 ou 99?)
	);
END MikroPdec;


ARCHITECTURE LogicFunction OF MikroPdec IS
	

	COMPONENT char_7seg
	PORT ( 	C : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
				Display : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
			);
	END COMPONENT;
	
	SIGNAL D0: STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL D1: STD_LOGIC_VECTOR(3 DOWNTO 0); 
	SIGNAL BCD0: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL BCD1: STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL conteudo_reg: STD_LOGIC_VECTOR  (15 DOWNTO 0);
	
	
	
BEGIN

	H0: char_7seg PORT MAP (C=>D0, Display=>HEX0);
	H1: char_7seg PORT MAP (C=>D1, Display=>HEX1);
	
	conteudo_reg( 7 downto 0) <= switch;

	BCD0 <= 	conteudo_reg(7 downto 0) when conteudo_reg < "0000000000001010" else
				to_unsigned(conteudo_reg) - "0000000000001010" when conteudo_reg > "0000000000001010" and conteudo_reg  < "0000000000011010" else
	"00000000";
				 	
	D1 <= 	conteudo_reg(7 downto 4) when conteudo_reg < "0000000000001010" else
			"0001" when conteudo_reg >= "0000000000001010" and conteudo_reg  < "0000000000011010" else
	"0000";
	
	--D0 <= BCD0;
	--D1 <= BCD1;
	
END LogicFunction ;


