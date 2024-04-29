library IEEE;
use IEEE.std_logic_1164.all;

entity AsyncJKFFTest is
end AsyncJKFFTest;

architecture Test of AsyncJKFFTest is
    constant period: time := 20 ns;

    signal q: std_logic;
    signal q_not: std_logic;
    signal j: std_logic;
    signal k: std_logic;
    signal clk: std_logic;
    signal clr_n: std_logic;
    signal pre_n: std_logic;

    -- Do names have to be the same?
    component AsyncJKFF
        port (
            q: out std_logic;
            q_not: out std_logic;
            j: in std_logic;
            k: in std_logic;
            clk: in std_logic;
            clr_n: in std_logic;
            pre_n: in std_logic);
    end component;
begin
    uut: AsyncJKFF port map (
        q => q,
        q_not => q_not,
        j => j,
        k => k,
        clk => clk,
        clr_n => clr_n,
        pre_n => pre_n);

    process
    begin
        clk <= '0';
        wait for period / 2;
        clk <= '1';
        wait for period / 2;
    end process;

    process
    begin
        j <= '0';
        k <= '0';
        clr_n <= '0';
        pre_n <= '0';
        wait for 6 ns;

        clr_n <= '1';
        pre_n <= '1';
        wait for 6 ns;

        clr_n <= '0';
        wait for 6 ns;

        clr_n <= '1';
        pre_n <= '1';
        wait for 6 ns;

        j <= '1';
        k <= '0';
        wait for 12 ns;

        j <= '0';
        k <= '1';
        wait for 12 ns;

        j <= '1';
        k <= '1';
        wait for 12 ns;

        j <= '0';
        k <= '0';
        wait for 12 ns;

        pre_n <= '0';
        wait for 12 ns;

        wait;
    end process;
end Test;

