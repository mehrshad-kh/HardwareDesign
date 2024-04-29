library IEEE;
use IEEE.std_logic_1164.all;

entity TFFTest is
end TFFTest;

architecture Test of TFFTest is
    constant period: time := 20 ns;
    
    signal q: std_logic := '0';
    signal q_not: std_logic := '0';
    signal t: std_logic := '0';
    signal clk: std_logic := '0';
    signal clr_n: std_logic := '0';
    signal pre_n: std_logic := '0';

    component TFF is
        port (
            q: out std_logic;
            q_not: out std_logic;
            t: in std_logic;
            clk: in std_logic;
            clr_n: in std_logic;
            pre_n: in std_logic);
    end component;
begin
    uut: TFF port map (
        q => q,
        q_not => q_not,
        t => t,
        clk => clk,
        clr_n => clr_n,
        pre_n => pre_n);

    clk_process: process
    begin
        clk <= '0';
        wait for period / 2;
        clk <= '1';
        wait for period / 2;
    end process;

    main: process
    begin
        clr_n <= '0';
        pre_n <= '1';
        wait for 24 ns;

        clr_n <= '1';
        wait for 5 ns;

        t <= '0';
        wait for 24 ns;

        t <= '1';
        wait for 24 ns;

        wait for 24 ns;

        t <= '0';
        wait for 24 ns;

        clr_n <= '0';
        pre_n <= '1';
        wait for 24 ns;

        clr_n <= '1';
        pre_n <= '0';
        wait for 24 ns;

        wait;
    end process;
end Test;

