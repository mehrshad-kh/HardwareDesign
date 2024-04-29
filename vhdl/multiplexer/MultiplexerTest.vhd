library IEEE;
use IEEE.std_logic_1164.all;

entity MultiplexerTest is
end entity MultiplexerTest;

architecture Test of MultiplexerTest is
    signal z_sgnl: std_logic;
    signal i_sgnl: std_logic_vector (3 downto 0);
    signal s_sgnl: std_logic_vector (1 downto 0);

    component Multiplexer
        port (
            z: out std_logic;
            i: in std_logic_vector (3 downto 0);
            s: in std_logic_vector (1 downto 0));
    end component;
begin
    uut: Multiplexer port map (
        z => z_sgnl,
        i => i_sgnl,
        s => s_sgnl);

    process
    begin
        i_sgnl <= "0101";

        s_sgnl <= "01";
        wait for 50 ns;

        s_sgnl <= "10";
        wait for 50 ns;
        wait;
    end process;
end Test;


