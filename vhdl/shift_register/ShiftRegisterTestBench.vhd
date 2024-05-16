library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ShiftRegisterTestBench is
end entity ShiftRegisterTestBench;

architecture TestBench of ShiftRegisterTestBench is
    constant n: integer := 4;
    constant period: time := 20 ns;

    signal output: std_logic_vector (n-1 downto 0) := (others => '0');
    signal input: std_logic_vector (n-1 downto 0) := (others => '0');
    signal mode: std_logic_vector (1 downto 0) := (others => '0');
    signal load: std_logic := '0';
    signal rst: std_logic := '0';
    signal clk: std_logic := '0';

    component ShiftRegister is
        generic (
            n: integer := 4);
        port (
            output: out std_logic_vector (n-1 downto 0);
            input: in std_logic_vector (n-1 downto 0);
            mode: in std_logic_vector (1 downto 0);
            load: in std_logic;
            rst: in std_logic;
            clk: in std_logic);
    end component ShiftRegister;
begin
    uut: ShiftRegister port map (
        output => output,
        input => input,
        mode => mode,
        load => load,
        rst => rst,
        clk => clk);

    clk_process: process
    begin
        clk <= '0';
        wait for period / 2;
        clk <= '1';
        wait for period / 2;
    end process;

    test_process: process
    begin
        wait for 7 ns;

        load <= '1';
        rst <= '0';
        input <= "0110";
        wait for 2 * period;

        load <= '0';
        mode <= "00";
        input <= "0010";
        wait for 2 * period;

        mode <= "01";
        wait for 2 * period;
        
        mode <= "10";
        wait for 2 * period;

        mode <= "11";
        wait for 2 * period;

        rst <= '1';
        wait for 2 * period;

        load <= '1';
        rst <= '0';
        input <= "1100";
        wait for 2 * period;

        load <= '0';
        mode <= "00";
        input <= "0001";
        wait for 2 * period;

        mode <= "10";
        wait for 2 * period;

        mode <= "11";
        wait for 2 * period;

        rst <= '1';
        wait for 2 * period;

        std.env.stop;
    end process;
end TestBench;
