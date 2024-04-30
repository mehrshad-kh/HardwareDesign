library IEEE;
use IEEE.std_logic_1164.all;
use std.env.stop;

entity HalfAdderTestBench is
end entity HalfAdderTestBench;

architecture TestBench of HalfAdderTestBench is
    signal sum: std_logic := '0';
    signal cout: std_logic := '0';
    signal a: std_logic := '0';
    signal b: std_logic := '0';

    component HalfAdder is
        port (
            sum: out std_logic;
            cout: out std_logic;
            a: in std_logic;
            b: in std_logic);
    end component HalfAdder;
begin
    uut: HalfAdder port map (
        sum => sum,
        cout => cout,
        a => a,
        b => b);

    test_bench: process
    begin
        for i in std_logic range '0' to '1' loop
            for j in std_logic range '0' to '1' loop
                a <= i;
                b <= j;
                wait for 10 ns;
            end loop;
        end loop;

        stop;
    end process test_bench;
end TestBench;
