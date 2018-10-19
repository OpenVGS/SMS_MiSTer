library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity psg_4bit_output_tb is
	-- testbenches have no entity content
end entity;

architecture tb of psg_4bit_output_tb is

	-- clock period, 279ns would be 3.579545 MHz but 200ns is easier on the eyes
	-- for alignment in simulation window
	constant	clk_period	:	time := 200 ns;

	-- sim signals, must match in size and type the entity being tested
	-- also, initialize inputs
	signal	clk_tb		:	STD_LOGIC := '0';
	signal	WR_n_tb		:	STD_LOGIC := '1';
	signal	D_in_tb		:	STD_LOGIC_VECTOR (7 downto 0) := x"FF";
	signal	output_tb	:	STD_LOGIC_VECTOR (5 downto 0);
	signal	reset_n_tb	:	STD_LOGIC := '0';
	
	-- procedure for writing to PSG
	procedure psg_write(
		constant psg_value	: in	INTEGER;
		signal 	psg_data		: out	STD_LOGIC_VECTOR (7 downto 0);
		signal	wr				: out	STD_LOGIC
		) is
	begin 
		psg_data <= std_logic_vector(to_unsigned(psg_value, psg_data'length));
		wait for clk_period/2;
		wr <= '0';
		wait for clk_period;
		wr <= '1';
		wait for clk_period/2;
	end psg_write;
	
	
begin

	-- instantiate the psg for simulation
	psg_u0	: entity work.psg
		port map(
			clk => clk_tb,
			WR_n => WR_n_tb,
			D_in => D_in_tb,
			output => output_tb,
			reset_n => reset_n_tb
		);

	-- clock process
	psg_clk : process is
	begin
		clk_tb <= '0';
		wait for clk_period/2;
		clk_tb <= '1';
		wait for clk_period/2;
	end process;
	
	-- simulation process
	psg_sim : process is
	begin
		
		-- setup initial states
		WR_n_tb <= '1';
		D_in_tb <= x"FF";
		reset_n_tb <= '0';
		
		-- hold reset for a while
		wait for clk_period*5;
		reset_n_tb <= '1';
	
		-- write 0 to all four volume registers using procedure
		-- hex in constant type is base#value# i.e. 16#FE#
		-- binary in constant type is same: i.e. 2#10101010#
		psg_write(2#10010000#, D_in_tb, WR_n_tb);
		psg_write(2#10110000#, D_in_tb, WR_n_tb);
		psg_write(2#11010000#, D_in_tb, WR_n_tb);
		psg_write(2#11110000#, D_in_tb, WR_n_tb);
	
	
		-- wait a bit
		D_in_tb <= "11111111";
		wait for clk_period*4;
		
		
		-- write all volume levels to channel 0, not using procedure
		for volume_val in 0 to 15 loop
			D_in_tb <= "1001" & std_logic_vector(to_unsigned(volume_val, 4));
			wait for clk_period/2;
			WR_n_tb <= '0';
			wait for clk_period;
			WR_n_tb <= '1';
			wait for clk_period/2;
		end loop;
		
		-- simulation loops around until max time is reached, pause a bit here
		wait for clk_period*10;
	
	end process;
		
end tb;

