--Anderson Kmetiuk
--João dos Reis

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Control_Unit is
	port (	clk : in std_logic;
			rst : in std_logic;
			opcode_in: in unsigned(5 downto 0);
			jump_en: out std_logic;
			wr_en_pc: out std_logic;
			wr_en_regfile: out std_logic;
			wr_en_sr: out std_logic;
			controle_operacao_ula: out unsigned(2 downto 0);
			sel_OP2: out std_logic;
			B_en: out std_logic;
			wr_en_ram: out std_logic;
			sel_ram: out std_logic
		);
end entity;

architecture a_Control_Unit of Control_Unit is


	component Maquina_Estados is
		port (	clk : in std_logic;
				rst : in std_logic;
				estado : out unsigned(1 downto 0)
		);
	end component;

	signal estado_s: unsigned(1 downto 0);	

begin

	
	Maq_estados: Maquina_Estados port map
		(
			clk => clk,
			rst => rst, 
			estado => estado_s
		);
	

	jump_en <= 	'1' when opcode_in = "100101" else '0';						  

	
	------------------------------
	wr_en_regfile  <= '0' when estado_s = "01" and opcode_in ="000101" else --cp
					  '0' when estado_s = "01" and opcode_in ="100110" else	--st
					  '0' when estado_s = "01" and opcode_in = "000000" else --nop
					  '0' when estado_s = "01" and opcode_in = "100101" else --jmp
					  '0' when estado_s = "01" and opcode_in = "111100" else --brbs
					  '1' when estado_s = "01" else
					  '0';
	---------------------------------
	controle_operacao_ula <= "000" when opcode_in = "000111" else --adc
							 "001" when opcode_in = "101111" else --adiw
							 "010" when opcode_in = "100111" else --dec
							 "011" when opcode_in = "001011" else --mov
							 "100" when opcode_in = "000101" else --cp
							 "101" when opcode_in = "000110" else --sub
							 "000"; 
							 
	sel_OP2 <= '1' when opcode_in = "101111" else '0'; --addiw
	
	
	wr_en_pc <= '1' when estado_s = "10" else 
				'0'; 
	
	wr_en_sr <= '1' when opcode_in = "000101" and estado_s = "01" else --cp
				'1' when opcode_in = "000111" and estado_s = "01" else --adc
				'1' when opcode_in = "000110" and estado_s = "01" else --sub
				'0'; 		

	B_en <= '1' when opcode_in = "111100" else '0';	--brbs				
						
	sel_ram <= '1' when opcode_in = "100100" else '0'; --ld
	
	wr_en_ram <= '1' when opcode_in = "100110" else '0'; --st 

end architecture;
