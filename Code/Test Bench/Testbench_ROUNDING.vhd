-- Federico Cobianchi - 332753
-- Onice Mazzi - 359754
-- Antonio Telmon - 353781

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_rounding is
end tb_rounding;

architecture behavioral of tb_rounding is

	component rounding is
	port (	Clock:	IN	STD_LOGIC; -- Clock
		rounding_in : IN std_logic_vector(48 downto 0); -- 49 bit da arrotondare
		rounding_out: OUT std_logic_vector(23 downto 0); -- 24 bit arrotondati
		shift_signal: IN STD_LOGIC); -- segnale per shiftare
	end component;

    -- Segnali per collegare il DUT
    signal TB_Clock        : std_logic := '0';
    signal TB_rounding_in  : std_logic_vector(48 downto 0);
    signal TB_rounding_out : std_logic_vector(23 downto 0);
	signal TB_shift_signal: std_logic := '0';
	 
    constant Tclk : time := 10 ns;

begin

	TB_Clock <= not TB_Clock after Tclk/2;

    process
    begin
		  -- Caso 1
        TB_rounding_in <= "1100101110101110110110000010001110010110011100111";
		TB_shift_signal <= '1';
        wait for Tclk;
		-- Caso 2
        TB_rounding_in <= "1000111110100101110100001100101100111111001111000";
		TB_shift_signal <= '1';
        wait for Tclk;
		-- Caso 3
		TB_rounding_in <= "0001011101011011101000101111101110011101001000000";
		TB_shift_signal <= '0';
        wait for Tclk;
		-- Caso 4
        TB_rounding_in <= "1000010011010101101000100011100111010111000101101";
		TB_shift_signal <= '1';
        wait for Tclk;
		-- Caso 5
		TB_rounding_in <= "1100001011110000100110011110010100000111110110100";
		TB_shift_signal <= '1';
        wait for Tclk;
		-- Caso 6
		TB_rounding_in <= "0101010010100110000110101011100101011001111111011";
		TB_shift_signal <= '0';
        wait for Tclk;
		-- Caso 7
		TB_rounding_in <= "1101101010011110100111101101101101110111100011011";
		TB_shift_signal <= '1';
        wait for Tclk;
		-- Caso 8
		TB_rounding_in <= "0000110001110011000110100111001000011001111101011";
		TB_shift_signal <= '0';
        wait for Tclk;
		-- Caso 9
		TB_rounding_in <= "1101010100101011010101000000111001110110111010011";
		TB_shift_signal <= '1';
        wait for Tclk;
		-- Caso 10
		TB_rounding_in <= "1011001001010000110100111010111110011011101111100";
		TB_shift_signal <= '1';
        wait for Tclk;
		-- Caso 11
		TB_rounding_in <= "0001001001100001011111100111101001000011001100100";
		TB_shift_signal <= '0';
        wait for Tclk;
		-- Caso 12
        TB_rounding_in <= "1111111111111111111111111111111111111111111111111";
		TB_shift_signal <= '1';
        wait for Tclk;

        wait;
    end process;
	
	pm_rom_rounding : rounding port map (
		TB_Clock,
		TB_rounding_in,
		TB_rounding_out,
		TB_shift_signal
	);

end behavioral;