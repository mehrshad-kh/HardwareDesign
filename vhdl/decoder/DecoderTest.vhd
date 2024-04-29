library IEEE;
use IEEE.std_logic_1164.all;
-- use IEEE.std_logic_arith.all;
-- use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity DecoderTest is
end entity DecoderTest;

architecture Test of DecoderTest is
    signal z: std_logic_vector (15 downto 0);
    signal i: std_logic_vector (3 downto 0);
    signal g: std_logic;

    component Decoder port (
        z: out std_logic_vector (15 downto 0);
        i: in std_logic_vector (3 downto 0);
        g: in std_logic);
    end component;
begin
    uut: Decoder port map (
        z => z,
        i => i,
        g => g);

    process
    begin
        g <= '0';
        i <= "0000";
        wait for 10 ns;

        i <= "0001";
        wait for 10 ns;

        i <= "0010";
        wait for 10 ns;
        
        i <= "0011";
        wait for 10 ns;

        i <= "0100";
        wait for 10 ns;

        i <= "0101";
        wait for 10 ns;

        i <= "0110";
        wait for 10 ns;

        i <= "0111";
        wait for 10 ns;

        i <= "1000";
        wait for 10 ns;

        i <= "1001";
        wait for 10 ns;

        i <= "1010";
        wait for 10 ns;

        i <= "1011";
        wait for 10 ns;

        i <= "1100";
        wait for 10 ns;

        i <= "1101";
        wait for 10 ns;

        i <= "1110";
        wait for 10 ns;

        i <= "1111";
        wait for 10 ns;

        g <= '1';
        wait for 10 ns;

        i <= "0000";

        for index in 0 to 15 loop
            wait for 10 ns;
            -- i <= std_logic_vector(to_unsigned(to_integer(unsigned(i)) + 1, 4));
            i <= std_logic_vector(unsigned(i) + 1);
        end loop;

        wait;
    end process;
end Test;

