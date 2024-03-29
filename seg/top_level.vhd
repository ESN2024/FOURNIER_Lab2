-- seg_bcd.vhd

-- Generated using ACDS version 18.1 625

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity top_level is
	port (
		clk_clk                         : in  std_logic                    := '0'; --                       clk.clk
		seg_bcd_0 : out std_logic_vector(7 downto 0);        -- pio_0_external_connection.export
		seg_bcd_1 : out std_logic_vector(7 downto 0);
		seg_bcd_2 : out std_logic_vector(7 downto 0);
		reset_reset_n                    : in  std_logic                    := '0'  --                     reset.reset_n
	);
end entity top_level;

 
architecture rtl of top_level is

	component seg is
		port (
			clk_clk                          : in  std_logic                    := 'X'; -- clk
			pio_0_external_connection_export : out std_logic_vector(3 downto 0);        -- export
			--pio_1_external_connection_export : in  std_logic                    := 'X'; -- export
			pio_2_external_connection_export : out std_logic_vector(3 downto 0);        -- export
			pio_3_external_connection_export : out std_logic_vector(3 downto 0);        -- export
			reset_reset_n                    : in  std_logic                    := 'X'  -- reset_n
		);
	end component seg;
	
	
	component seg_bcd is
		port (
			cnt        : in  STD_LOGIC_VECTOR (3 downto 0);
			seg_bcd_output : out STD_LOGIC_VECTOR (7 downto 0));
	end component seg_bcd;


	
	
	signal s0 : std_logic_vector(3 downto 0);
	signal s1 : std_logic_vector(3 downto 0);
	signal s2 : std_logic_vector(3 downto 0);
	
	begin
	
	b0 : component seg_bcd
		port map (
			seg_bcd_output => seg_bcd_0,
			cnt => s0
			); 		
	
	
	b1 : component seg_bcd 
		port map (
			seg_bcd_output => seg_bcd_1,
			cnt => s1
			); 		
	
	
	b2 : component seg_bcd 
		port map (
			seg_bcd_output => seg_bcd_2,
			cnt => s2
			); 		
	

	
	u0 : component seg
		port map (
			clk_clk                          => clk_clk,                          --                       clk.clk
			pio_0_external_connection_export => s0, -- pio_0_external_connection.export
			--pio_1_external_connection_export => pio_1_external_connection_export, -- pio_1_external_connection.export
			pio_2_external_connection_export => s1, -- pio_2_external_connection.export
			pio_3_external_connection_export => s2, -- pio_3_external_connection.export
			reset_reset_n                    => reset_reset_n                     --                     reset.reset_n
		);
		
end architecture rtl; -- of seg_bcd

