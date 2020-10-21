--Anderson Kmetiuk
--João dos Reis

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ram is
	port(
			clk : in std_logic;
			endereco : in unsigned(7 downto 0);
			wr_en : in std_logic;
			dado_in : in unsigned(7 downto 0);
			dado_out : out unsigned(7 downto 0);
			
			 HEX0 : out std_logic_vector (6 downto 0);
			 HEX1 : out std_logic_vector (6 downto 0);
			 HEX2 : out std_logic_vector (6 downto 0);
			 HEX3 : out std_logic_vector (6 downto 0);
			 halt : in std_logic;
			 turbo : in std_logic;
			 clk_h : in std_logic;
			 clk_div : out std_logic;
			 rst : in std_logic
	);
end entity;

architecture a_ram of ram is
	type mem is array (0 to 255) of unsigned(7 downto 0); 
	signal conteudo_ram : mem;
begin
	process(clk,wr_en)
	begin
		if rising_edge(clk) then
			if wr_en='1' then
				conteudo_ram(to_integer(endereco)) <= dado_in;
			end if;
		end if;
	end process;
	dado_out <= conteudo_ram(to_integer(endereco));
end architecture;