library IEEE;
use IEEE.std_logic_1164.all;

entity RamTestBench is
end entity RamTestBench;

architecture TestBench of RamTestBench is
    constant n: integer := 2;
    constant k: integer := 8;
    constant period: time := 20 ns;

    signal data: std_logic_vector (k - 1 downto 0) := (others => 'Z');
    signal valid: std_logic := '0';
    signal addr: std_logic_vector (n - 1 downto 0) := (others => '0');
    signal cs: std_logic := '0';
    signal oe: std_logic := '0';
    signal we: std_logic := '0';
    signal rst: std_logic := '0';
    signal clk: std_logic := '0';

    component Ram is
        generic (
            n: integer := 2;
            k: integer := 8);
        port (
            data: inout std_logic_vector (k - 1 downto 0);
            valid: out std_logic;
            addr: in std_logic_vector (n - 1 downto 0);
            cs: in std_logic;
            oe: in std_logic;
            we: in std_logic;
            rst: in std_logic;
            clk: in std_logic);
    end component Ram;
begin
    dut: Ram 
        port map (
            data => data,
            valid => valid,
            addr => addr,
            cs => cs,
            oe => oe,
            we => we,
            rst => rst,
            clk => clk);

    process
    begin
        clk <= '0';
        wait for period / 2;
        clk <= '1';
        wait for period / 2;
    end process;

    process
    begin
        cs <= '0';
        wait for 3 ns;

        rst <= '0';
        wait for 2 * period;

        rst <= '1';
        oe <= '0';
        we <= '1';
        addr <= "00";
        wait for 2 * period;

        oe <= '1';
        we <= '0';
        addr <= "00";
        data <= "00101101";
        wait for 2 * period;

        oe <= '0';
        we <= '1';
        addr <= "11";
        wait for 2 * period;

        oe <= '0';
        we <= '1';
        addr <= "00";
        wait for 2 * period;

        wait;
    end process;
end TestBench;
