library IEEE;
use IEEE.std_logic_1164.all;

entity EightBitEnBidiCounterTest is
end entity EightBitEnBidiCounterTest;

architecture Test of EightBitEnBidiCounterTest is
    -- Declarative body.
    -- Declare constants.
    constant period: time := 20 ns;

    -- Declare signals.
    signal q: std_logic_vector (7 downto 0) := "00000000";
    signal up: std_logic := '0';
    signal en: std_logic := '0';
    signal clr_n: std_logic := '0';
    signal one: std_logic := '1';
    signal clk: std_logic := '0';

    -- Declare components.
    component EightBitEnBidiCounter is
        port (
            q: out std_logic_vector (7 downto 0);
            up: in std_logic;
            en: in std_logic;
            clr_n: in std_logic;
            one: in std_logic;
            clk: in std_logic);
    end component EightBitEnBidiCounter;
begin
    -- Instantiate components.
    uut: EightBitEnBidiCounter port map (
        q => q,
        up => up,
        en => en,
        clr_n => clr_n,
        one => one,
        clk => clk);

    clock_process: process
    begin
        clk <= '0';
        wait for period / 2;
        clk <= '1';
        wait for period / 2;
    end process;

    main_process: process
    begin
        en <= '1';
        wait for 5 ns;

        up <= '1';
        wait for 5 ns;

        clr_n <= '0';
        wait for 2 * period;

        clr_n <= '1';
        wait for 2 * period;

        wait for 10 * period;

        en <= '0';
        wait for 5 * period;

        en <= '1';
        wait for 5 * period;

        wait;
    end process;
end Test;
