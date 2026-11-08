-- Federico Cobianchi - 332753
-- Onice Mazzi - 359754
-- Antonio Telmon - 353781

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_ROM is
end tb_ROM;

architecture behavioral of tb_ROM is

	component ROM is
	port (	
		address : IN std_logic_vector(4 downto 0);
		memory_out: OUT std_logic_vector(2 downto 0)
		);
	end component;	

    signal TB_address  : std_logic_vector(4 downto 0);
    signal TB_memory_out : std_logic_vector(2 downto 0);

begin

    process
    begin
        for i in 0 to 31 loop
            TB_address <= std_logic_vector(to_unsigned(i, 5));
            wait for 10 ns;
        end loop;

        -- Fine simulazione
        wait;
    end process;
	
	pm_rom : ROM port map (
		TB_address,
		TB_memory_out
	);

end behavioral;
