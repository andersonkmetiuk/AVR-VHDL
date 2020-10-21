--Anderson Kmetiuk
--João dos Reis

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Calculadora_tb is

end entity;


architecture a_Calculadora_tb of Calculadora_tb  is

component Calculadora  is
	port (	clk : in std_logic;
			rst : in std_logic
		);
end component;


	
	signal clk, rst: std_logic :='0';
	
begin
	uut: Calculadora port map
		(
			clk => clk, 
			rst => rst
			
		);

	
	process 
	begin
		clk <= '0';
		wait for 50 ns;
		clk <= '1';
		wait for 50 ns;
	end process;

	process 
	begin
		rst <= '1';
		wait for 60 ns;
		rst <= '0';
		wait for 50 ns;
		wait;
	end process;




end architecture;
