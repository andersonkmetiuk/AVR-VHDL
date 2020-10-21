--Anderson Kmetiuk
--João dos Reis

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Calculadora is
	port (	clk : in std_logic;
			rst : in std_logic
		);
end entity;

architecture a_Calculadora of Calculadora is

	component Rom is
		port( 	clk: in std_logic;
				endereco: in unsigned(7 downto 0);
				dado: out unsigned(15 downto 0)
		);
	end component;


	component Control_Unit is
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
	end component;

	component pc is
		port( 	clk: in std_logic;
				rst: in std_logic;
				wr_en: in std_logic;
				data_in: in unsigned(7 downto 0);
				data_out: out unsigned(7 downto 0)
	);
	end component;

	component ULA is
		port(   in_A,in_B:  in unsigned (7 downto 0); 
				op    : in unsigned (2 downto 0);
				flag  : out  unsigned (7 downto 0);  
				out_ula : out  unsigned (7 downto 0)		
				
		);
	end component;
	
	component register_file is
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
	end component;
	
	component sr is
		port( 	clk: in std_logic;
				rst: in std_logic;
				wr_en: in std_logic;
				data_in: in unsigned(7 downto 0);
				data_out: out unsigned(7 downto 0)
		);
	end component;
	
	component ram is
		port(
				clk : in std_logic;
				endereco : in unsigned(7 downto 0);
				wr_en : in std_logic;
				dado_in : in unsigned(7 downto 0);
				dado_out : out unsigned(7 downto 0)
		);
	end component;
	
	signal instrucao: unsigned(15 downto 0);
	signal operacao: unsigned(2 downto 0);
	
	signal jump_en_s: std_logic;
	signal wr_en_pc_s: std_logic;
	signal wr_en_regfile_s: std_logic;
	signal wr_en_sr_s: std_logic;
	signal B_en_s: std_logic;
	
	signal pc_in: unsigned(7 downto 0);
	signal pc_saida: unsigned(7 downto 0);
	signal sr_out: unsigned(7 downto 0);
	signal regfile_rd1: unsigned(7 downto 0);
	signal regfile_rd2: unsigned(7 downto 0);

	signal	inB: unsigned(7 downto 0);
	signal regfile_wd3: unsigned(7 downto 0);
	signal flag_s: unsigned(7 downto 0);
	
	
	signal sel_OP2_s: std_logic;
	signal b_mux_in: unsigned(7 downto 0);
	signal b_mux_out: unsigned(7 downto 0);
	signal b_concat: unsigned(7 downto 0);
	
	signal out_ram_s: unsigned(7 downto 0);
	signal out_ula_s: unsigned(7 downto 0);
	signal sel_ram_s: std_logic;
	signal wr_en_ram_s: std_logic;
	signal regfile_a3: unsigned(4 downto 0);

begin

	rom_final: Rom port map 
		(
			clk => clk, 
			endereco=> pc_saida, 
			dado => instrucao
		);
	
	uc_final: Control_Unit port map
		(	clk => clk,
			rst => rst,
			opcode_in => instrucao(15 downto 10),
			jump_en => jump_en_s,
			wr_en_pc => wr_en_pc_s,
			wr_en_regfile => wr_en_regfile_s,
			wr_en_sr => wr_en_sr_s,
			controle_operacao_ula=> operacao,
			sel_OP2 => sel_OP2_s,
			B_en => B_en_s,
			wr_en_ram => wr_en_ram_s,
			sel_ram => sel_ram_s
		);

	pc_final: pc port map 
		(
			clk => clk,
			rst => rst,
			wr_en => wr_en_pc_s,
			data_in => b_mux_out,
			data_out => pc_saida
		);
	
	ula_final: ULA port map
		( 		
			in_A => regfile_rd1,
			in_B => inB, 
			op => operacao, 
			flag => flag_s,
			out_ula => out_ula_s 
		);
		
	regfile_final: register_file port map
		(
			clk => clk,
			rst => rst,
			we3 => wr_en_regfile_s,
				
			a1 => instrucao(9 downto 5),
			a2 => instrucao(4 downto 0),

			a3 => regfile_a3, 
				
			wd3 => regfile_wd3,
				
			rd1 => regfile_rd1,
			rd2 => regfile_rd2
		);
	
	sr_final: sr port map
	(
		clk => clk,
		rst => rst,
		wr_en => wr_en_sr_s,
		data_in => flag_s,
		data_out => sr_out
	);
	ram_final: ram port map
	(
			clk => clk,			
			wr_en => wr_en_ram_s,
			endereco => regfile_rd1,		
			dado_in => inB, 
			dado_out => out_ram_s
	);
	
	b_concat <= '0' & instrucao(9 downto 3);
	
	
	b_mux_in <= pc_saida + 1 when jump_en_s = '0' else
				instrucao(7 downto 0);

	
	b_mux_out <= b_mux_in when B_en_s = '0' else --PC+1
				 b_mux_in when instrucao(2)/= sr_out(2) or instrucao(1)/=sr_out(1)  else --PC+1
				--salto negativo instrucao(0)='1'  PC+1-K 
				--maior/diferente N=0 Z=0
				 b_mux_in - b_concat when instrucao(0)='1' and instrucao(2)='0' and instrucao(1)='0' and sr_out(2)= '0' and sr_out(1)= '0' else
				--menor N=1 Z=0
				 b_mux_in - b_concat when instrucao(0)='1' and instrucao(2)='1' and instrucao(1)='0' and sr_out(2)= '1' and sr_out(1)= '0' else
				--igual N=0 Z=1
				 b_mux_in - b_concat when instrucao(0)='1' and instrucao(2)='0' and instrucao(1)='1' and sr_out(2)= '0' and sr_out(1)= '1' else
				--menor igual N=1 Z=1
				 b_mux_in - b_concat when instrucao(0)='1' and instrucao(2)='1' and instrucao(1)='1' and sr_out(2)= '1' and sr_out(1)= '1' else
				--salto positivo instrucao(0)='0' PC+1+K
				--maior/diferente N=0 Z=0
				 b_mux_in + b_concat when instrucao(0)='0' and instrucao(2)='0' and instrucao(1)='0' and sr_out(2)= '0' and sr_out(1)= '0' else
				--menor N=1 Z=0
				 b_mux_in + b_concat when instrucao(0)='0' and instrucao(2)='1' and instrucao(1)='0' and sr_out(2)= '1' and sr_out(1)= '0' else
				--igual N=0 Z=1
				 b_mux_in + b_concat when instrucao(0)='0' and instrucao(2)='0' and instrucao(1)='1' and sr_out(2)= '0' and sr_out(1)= '1' else
				--menor igual N=1 Z=1
				 b_mux_in + b_concat when instrucao(0)='0' and instrucao(2)='1' and instrucao(1)='1' and sr_out(2)= '1' and sr_out(1)= '1' else				  				
				 "00000000"; 

	inB <= regfile_rd2 when sel_OP2_s = '0'	else  
			"000"& instrucao(4 downto 0); 
	
	regfile_wd3 <=  out_ula_s when sel_ram_s='0' else
					out_ram_s;
	regfile_a3 <= instrucao(4 downto 0) when instrucao(15 downto 10) = "100100" else --ld
				  instrucao(9 downto 5);
		  
	
end architecture;
