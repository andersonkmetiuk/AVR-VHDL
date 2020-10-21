--Anderson Kmetiuk
--João dos Reis

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity register_file is
	port( 	clk: in std_logic;
			rst: in std_logic;
			we3: in std_logic;
			--selecao dos regs leitura
			a1: in unsigned(4 downto 0);
			a2: in unsigned(4 downto 0);
			--selecao dos regs escrita
			a3: in unsigned(4 downto 0);
			--dado a ser escrito
			wd3: in unsigned(7 downto 0);	
			--saida
			rd1: out unsigned(7 downto 0);
			rd2: out unsigned(7 downto 0)
		);
end entity;

architecture a_register_file of register_file is
	
	component reg8bits is
		port( 	clk: in std_logic;
				rst: in std_logic;
				wr_en: in std_logic;
				data_in: in unsigned(7 downto 0);
				data_out: out unsigned(7 downto 0)
			);
	end component;
	
	signal wr_en0: std_logic;
	signal wr_en1: std_logic;
	signal wr_en2: std_logic;
	signal wr_en3: std_logic;
	signal wr_en4: std_logic;
	signal wr_en5: std_logic;
	signal wr_en6: std_logic;
	signal wr_en7: std_logic;
	signal wr_en8: std_logic;
	signal wr_en9: std_logic;
	signal wr_en10: std_logic;
	signal wr_en11: std_logic;
	signal wr_en12: std_logic;
	signal wr_en13: std_logic;
	signal wr_en14: std_logic;
	signal wr_en15: std_logic;
	signal wr_en16: std_logic;
	signal wr_en17: std_logic;
	signal wr_en18: std_logic;
	signal wr_en19: std_logic;
	signal wr_en20: std_logic;
	signal wr_en21: std_logic;
	signal wr_en22: std_logic;
	signal wr_en23: std_logic;
	signal wr_en24: std_logic;
	signal wr_en25: std_logic;
	signal wr_en26: std_logic;
	signal wr_en27: std_logic;
	signal wr_en28: std_logic;
	signal wr_en29: std_logic;
	signal wr_en30: std_logic;
	signal wr_en31: std_logic;
	
	signal data_out0: unsigned(7 downto 0);
	signal data_out1: unsigned(7 downto 0);
	signal data_out2: unsigned(7 downto 0);
	signal data_out3: unsigned(7 downto 0);
	signal data_out4: unsigned(7 downto 0);
	signal data_out5: unsigned(7 downto 0);
	signal data_out6: unsigned(7 downto 0);
	signal data_out7: unsigned(7 downto 0);
	signal data_out8: unsigned(7 downto 0);
	signal data_out9: unsigned(7 downto 0);
	signal data_out10: unsigned(7 downto 0);
	signal data_out11: unsigned(7 downto 0);
	signal data_out12: unsigned(7 downto 0);
	signal data_out13: unsigned(7 downto 0);
	signal data_out14: unsigned(7 downto 0);
	signal data_out15: unsigned(7 downto 0);
	signal data_out16: unsigned(7 downto 0);
	signal data_out17: unsigned(7 downto 0);
	signal data_out18: unsigned(7 downto 0);
	signal data_out19: unsigned(7 downto 0);
	signal data_out20: unsigned(7 downto 0);
	signal data_out21: unsigned(7 downto 0);
	signal data_out22: unsigned(7 downto 0);
	signal data_out23: unsigned(7 downto 0);
	signal data_out24: unsigned(7 downto 0);
	signal data_out25: unsigned(7 downto 0);
	signal data_out26: unsigned(7 downto 0);
	signal data_out27: unsigned(7 downto 0);
	signal data_out28: unsigned(7 downto 0);
	signal data_out29: unsigned(7 downto 0);
	signal data_out30: unsigned(7 downto 0);
	signal data_out31: unsigned(7 downto 0);
	
	
begin
     
    reg0: reg8bits port map
		(
			clk=>clk,
			rst=>rst,
			wr_en=>wr_en0,
			data_in=>wd3,
			data_out=>data_out0
		);
	reg1: reg8bits port map
		(
			clk=>clk,
			rst=>rst,
			wr_en=>wr_en1,
			data_in=>wd3,
			data_out=>data_out1
		);
	reg2: reg8bits port map
		(
			clk=>clk,
			rst=>rst,
			wr_en=>wr_en2,
			data_in=>wd3,
			data_out=>data_out2
		);
	reg3: reg8bits port map
		(
			clk=>clk,
			rst=>rst,
			wr_en=>wr_en3,
			data_in=>wd3,
			data_out=>data_out3
		);
	reg4: reg8bits port map
		(
			clk=>clk,
			rst=>rst,
			wr_en=>wr_en4,
			data_in=>wd3,
			data_out=>data_out4
		);
	reg5: reg8bits port map
		(
			clk=>clk,
			rst=>rst,
			wr_en=>wr_en5,
			data_in=>wd3,
			data_out=>data_out5
		);
	reg6: reg8bits port map
		(
			clk=>clk,
			rst=>rst,
			wr_en=>wr_en6,
			data_in=>wd3,
			data_out=>data_out6
		);
	reg7: reg8bits port map
		(
			clk=>clk,
			rst=>rst,
			wr_en=>wr_en7,
			data_in=>wd3,
			data_out=>data_out7
		);
	reg8: reg8bits port map
		(
			clk=>clk,
			rst=>rst,
			wr_en=>wr_en8,
			data_in=>wd3,
			data_out=>data_out8
		);
	reg9: reg8bits port map
		(
			clk=>clk,
			rst=>rst,
			wr_en=>wr_en9,
			data_in=>wd3,
			data_out=>data_out9
		);
	reg10: reg8bits port map
		(
			clk=>clk,
			rst=>rst,
			wr_en=>wr_en10,
			data_in=>wd3,
			data_out=>data_out10
		);
	reg11: reg8bits port map
		(
			clk=>clk,
			rst=>rst,
			wr_en=>wr_en11,
			data_in=>wd3,
			data_out=>data_out11
		);
	reg12: reg8bits port map
		(
			clk=>clk,
			rst=>rst,
			wr_en=>wr_en12,
			data_in=>wd3,
			data_out=>data_out12
		);
	reg13: reg8bits port map
		(
			clk=>clk,
			rst=>rst,
			wr_en=>wr_en13,
			data_in=>wd3,
			data_out=>data_out13
		);
	reg14: reg8bits port map
		(
			clk=>clk,
			rst=>rst,
			wr_en=>wr_en14,
			data_in=>wd3,
			data_out=>data_out14
		);
	reg15: reg8bits port map
		(
			clk=>clk,
			rst=>rst,
			wr_en=>wr_en15,
			data_in=>wd3,
			data_out=>data_out15
		);
	reg16: reg8bits port map
		(
			clk=>clk,
			rst=>rst,
			wr_en=>wr_en16,
			data_in=>wd3,
			data_out=>data_out16
		);
	reg17: reg8bits port map
		(
			clk=>clk,
			rst=>rst,
			wr_en=>wr_en17,
			data_in=>wd3,
			data_out=>data_out17
		);
	reg18: reg8bits port map
		(
			clk=>clk,
			rst=>rst,
			wr_en=>wr_en18,
			data_in=>wd3,
			data_out=>data_out18
		);
	reg19: reg8bits port map
		(
			clk=>clk,
			rst=>rst,
			wr_en=>wr_en19,
			data_in=>wd3,
			data_out=>data_out19
		);
	reg20: reg8bits port map
		(
			clk=>clk,
			rst=>rst,
			wr_en=>wr_en20,
			data_in=>wd3,
			data_out=>data_out20
		);
	reg21: reg8bits port map
		(
			clk=>clk,
			rst=>rst,
			wr_en=>wr_en21,
			data_in=>wd3,
			data_out=>data_out21
		);
	reg22: reg8bits port map
		(
			clk=>clk,
			rst=>rst,
			wr_en=>wr_en22,
			data_in=>wd3,
			data_out=>data_out22
		);
	reg23: reg8bits port map
		(
			clk=>clk,
			rst=>rst,
			wr_en=>wr_en23,
			data_in=>wd3,
			data_out=>data_out23
		);
	reg24: reg8bits port map
		(
			clk=>clk,
			rst=>rst,
			wr_en=>wr_en24,
			data_in=>wd3,
			data_out=>data_out24
		);
	reg25: reg8bits port map
		(
			clk=>clk,
			rst=>rst,
			wr_en=>wr_en25,
			data_in=>wd3,
			data_out=>data_out25
		);
	reg26: reg8bits port map
		(
			clk=>clk,
			rst=>rst,
			wr_en=>wr_en26,
			data_in=>wd3,
			data_out=>data_out26
		);
	reg27: reg8bits port map
		(
			clk=>clk,
			rst=>rst,
			wr_en=>wr_en27,
			data_in=>wd3,
			data_out=>data_out27
		);
	reg28: reg8bits port map
		(
			clk=>clk,
			rst=>rst,
			wr_en=>wr_en28,
			data_in=>wd3,
			data_out=>data_out28
		);
	reg29: reg8bits port map
		(
			clk=>clk,
			rst=>rst,
			wr_en=>wr_en29,
			data_in=>wd3,
			data_out=>data_out29
		);
	reg30: reg8bits port map
		(
			clk=>clk,
			rst=>rst,
			wr_en=>wr_en30,
			data_in=>wd3,
			data_out=>data_out30
		);
	reg31: reg8bits port map
		(
			clk=>clk,
			rst=>rst,
			wr_en=>wr_en31,
			data_in=>wd3,
			data_out=>data_out31
		);
	
		
		
	wr_en0 <= we3 when a3 = "00000" else '0';
    wr_en1 <= we3 when a3 = "00001" else '0';
    wr_en2 <= we3 when a3 = "00010" else '0';
    wr_en3 <= we3 when a3 = "00011" else '0';
    wr_en4 <= we3 when a3 = "00100" else '0';
    wr_en5 <= we3 when a3 = "00101" else '0';
    wr_en6 <= we3 when a3 = "00110" else '0';
    wr_en7 <= we3 when a3 = "00111" else '0';
	wr_en8 <= we3 when a3 = "01000" else '0';
	wr_en9 <= we3 when a3 = "01001" else '0';
	wr_en10 <= we3 when a3 = "01010" else '0';
	wr_en11 <= we3 when a3 = "01011" else '0';
	wr_en12 <= we3 when a3 = "01100" else '0';
	wr_en13 <= we3 when a3 = "01101" else '0';
	wr_en14 <= we3 when a3 = "01110" else '0';
	wr_en15 <= we3 when a3 = "01111" else '0';
	wr_en16 <= we3 when a3 = "10000" else '0';
	wr_en17 <= we3 when a3 = "10001" else '0';
	wr_en18 <= we3 when a3 = "10010" else '0';
	wr_en19 <= we3 when a3 = "10011" else '0';
	wr_en20 <= we3 when a3 = "10100" else '0';
	wr_en21 <= we3 when a3 = "10101" else '0';
	wr_en22 <= we3 when a3 = "10110" else '0';
	wr_en23 <= we3 when a3 = "10111" else '0';
	wr_en24 <= we3 when a3 = "11000" else '0';
	wr_en25 <= we3 when a3 = "11001" else '0';
	wr_en26 <= we3 when a3 = "11010" else '0';
	wr_en27 <= we3 when a3 = "11011" else '0';
	wr_en28 <= we3 when a3 = "11100" else '0';
	wr_en29 <= we3 when a3 = "11101" else '0';
	wr_en30 <= we3 when a3 = "11110" else '0';
	wr_en31 <= we3 when a3 = "11111" else '0';
	
	rd1 <=  data_out0 when a1 = "00000" else
                data_out1 when a1 = "00001" else
                data_out2 when a1 = "00010" else
                data_out3 when a1 = "00011" else
                data_out4 when a1 = "00100" else
                data_out5 when a1 = "00101" else
                data_out6 when a1 = "00110" else
                data_out7 when a1 = "00111" else
				data_out8 when a1 = "01000" else
				data_out9 when a1 = "01001" else
				data_out10 when a1 = "01010" else
				data_out11 when a1 = "01011" else
				data_out12 when a1 = "01100" else
				data_out13 when a1 = "01101" else
				data_out14 when a1 = "01110" else
				data_out15 when a1 = "01111" else
				data_out16 when a1 = "10000" else
				data_out17 when a1 = "10001" else
				data_out18 when a1 = "10010" else
				data_out19 when a1 = "10011" else
				data_out20 when a1 = "10100" else
				data_out21 when a1 = "10101" else
				data_out22 when a1 = "10110" else
				data_out23 when a1 = "10111" else
				data_out24 when a1 = "11000" else
				data_out25 when a1 = "11001" else
				data_out26 when a1 = "11010" else
				data_out27 when a1 = "11011" else
				data_out28 when a1 = "11100" else
				data_out29 when a1 = "11101" else
				data_out30 when a1 = "11110" else
				data_out31 when a1 = "11111" else
                "00000000";
	
	rd2 <=  data_out0 when a2 = "00000" else
                data_out1 when a2 = "00001" else
                data_out2 when a2 = "00010" else
                data_out3 when a2 = "00011" else
                data_out4 when a2 = "00100" else
                data_out5 when a2 = "00101" else
                data_out6 when a2 = "00110" else
                data_out7 when a2 = "00111" else
				data_out8 when a2 = "01000" else
				data_out9 when a2 = "01001" else
				data_out10 when a2 = "01010" else
				data_out11 when a2 = "01011" else
				data_out12 when a2 = "01100" else
				data_out13 when a2 = "01101" else
				data_out14 when a2 = "01110" else
				data_out15 when a2 = "01111" else
				data_out16 when a2 = "10000" else
				data_out17 when a2 = "10001" else
				data_out18 when a2 = "10010" else
				data_out19 when a2 = "10011" else
				data_out20 when a2 = "10100" else
				data_out21 when a2 = "10101" else
				data_out22 when a2 = "10110" else
				data_out23 when a2 = "10111" else
				data_out24 when a2 = "11000" else
				data_out25 when a2 = "11001" else
				data_out26 when a2 = "11010" else
				data_out27 when a2 = "11011" else
				data_out28 when a2 = "11100" else
				data_out29 when a2 = "11101" else
				data_out30 when a2 = "11110" else
				data_out31 when a2 = "11111" else
                "00000000";
				
	
	
	
end architecture;