--Anderson Kmetiuk
--João dos Reis

library ieee;  
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity ULA is

		port(   in_A,in_B:  in unsigned (7 downto 0); 
				op    : in unsigned (2 downto 0);
				flag  : out  unsigned (7 downto 0); 
				out_ula : out  unsigned (7 downto 0) 
			
				
		);
				
	end entity;
	
	
architecture a_ULA of ULA is		
	
	signal in_a_9: unsigned(8 downto 0);
	signal in_b_9: unsigned(8 downto 0);
	signal soma_9: unsigned(8 downto 0);
	signal carry_soma: std_logic;
	signal carry_sub: std_logic;
	signal flag_zero: std_logic;
	signal subtracao: unsigned(7 downto 0);
	
	begin 
		
			 
		
		out_ula <= in_A + in_B when op="000" else --adc
					in_A + in_B when op="001" else --addiw 
					in_A - 1 when op="010" else --dec
					in_B when op="011" else --mov
					in_A - in_B when op= "100" else --cp
					in_A - in_B when op="101" else --sub
					"00000000"; 
		
		in_a_9 <= '0' & in_A;
		in_b_9 <= '0' & in_B;
		soma_9 <= in_a_9 + in_b_9;
		carry_soma <= soma_9(8);
		subtracao <= in_A - in_B;
		carry_sub <= '1' when subtracao(7)='1' else '0' ;
		flag_zero <= '1' when in_A = in_B else '0';
					
		flag <=  "0000000" & carry_soma when op="000" else --carry
				"00000" & carry_sub & flag_zero & carry_soma when op="100" else --cp
				"00000" & carry_sub & flag_zero & carry_soma when op="101" else --sub
				"00000000"; 
			
			 
	end architecture;

	
	

		