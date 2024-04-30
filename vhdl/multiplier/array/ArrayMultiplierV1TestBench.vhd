library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use std.env.stop;

entity ArrayMultiplierV1TestBench is
end ArrayMultiplierV1TestBench;

architecture TestBench of ArrayMultiplierV1TestBench is
    signal output: std_logic_vector (7 downto 0) := (others => '0');
    signal a: std_logic_vector (3 downto 0) := (others => '0');
    signal b: std_logic_vector (3 downto 0) := (others => '0');

    component ArrayMultiplierV1 is
	port (
		output: out std_logic_vector (7 downto 0);
		a: in std_logic_vector (3 downto 0);
		b: in std_logic_vector (3 downto 0));
    end component ArrayMultiplierV1;
begin
    uut: ArrayMultiplierV1 port map (
        output => output,
        a => a,
        b => b);

    test_bench: process
    begin
        for i in 0 to 15 loop
            for j in 0 to 15 loop
                a <= std_logic_vector(to_unsigned(i, 4));
                b <= std_logic_vector(to_unsigned(j, 4));
                wait for 1 ns;
            end loop;
        end loop;

        stop;
    end process test_bench;
end TestBench;
