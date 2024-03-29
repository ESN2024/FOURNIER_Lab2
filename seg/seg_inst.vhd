	component seg is
		port (
			clk_clk                          : in  std_logic                    := 'X'; -- clk
			pio_0_external_connection_export : out std_logic_vector(3 downto 0);        -- export
			pio_1_external_connection_export : in  std_logic                    := 'X'; -- export
			pio_2_external_connection_export : out std_logic_vector(3 downto 0);        -- export
			pio_3_external_connection_export : out std_logic_vector(3 downto 0);        -- export
			reset_reset_n                    : in  std_logic                    := 'X'  -- reset_n
		);
	end component seg;

	u0 : component seg
		port map (
			clk_clk                          => CONNECTED_TO_clk_clk,                          --                       clk.clk
			pio_0_external_connection_export => CONNECTED_TO_pio_0_external_connection_export, -- pio_0_external_connection.export
			pio_1_external_connection_export => CONNECTED_TO_pio_1_external_connection_export, -- pio_1_external_connection.export
			pio_2_external_connection_export => CONNECTED_TO_pio_2_external_connection_export, -- pio_2_external_connection.export
			pio_3_external_connection_export => CONNECTED_TO_pio_3_external_connection_export, -- pio_3_external_connection.export
			reset_reset_n                    => CONNECTED_TO_reset_reset_n                     --                     reset.reset_n
		);

