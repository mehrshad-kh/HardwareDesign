library IEEE;
use IEEE.std_logic_1164.all;

entity DFFTest is
end DFFTest;

architecture Test of DFFTest is
    constant clk_period: time := 20 ns;

    signal q_sgnl: std_logic;
    signal q_not_sgnl: std_logic;
    signal d_sgnl: std_logic;
    signal clk_sgnl: std_logic;
    signal clr_n_sgnl: std_logic;
    signal pre_n_sgnl: std_logic;

    -- Specify the required components.
    -- Component declaration.
    component DFF 
        port (
            q: out std_logic;
            q_not: out std_logic;
            d: in std_logic;
            clk: in std_logic;
            clr_n: in std_logic;
            pre_n: in std_logic
        );
    end component;
begin
    -- Instantiate one copy of the component.
    uut: DFF port map (
        q => q_sgnl,
        q_not => q_not_sgnl,
        d => d_sgnl,
        clk => clk_sgnl,
        clr_n => clr_n_sgnl,
        pre_n => pre_n_sgnl
    );

    process
    begin
        clk_sgnl <= '0';
        wait for clk_period / 2;
        clk_sgnl <= '1';
        wait for clk_period / 2;
    end process;

    process
    begin
        clr_n_sgnl <= '1';
        pre_n_sgnl <= '1';

        d_sgnl <= '0';
        wait for 12 ns;

        d_sgnl <= '1';
        wait for 30 ns;
        
        clr_n_sgnl <= '0';
        wait for 12 ns;

        d_sgnl <= '1';
        wait for 12 ns;

        clr_n_sgnl <= '1';
        pre_n_sgnl <= '0';
        wait for 12 ns;

        pre_n_sgnl <= '1';
        d_sgnl <= '0';
        wait for 12 ns;

        wait;
    end process;
end Test;


