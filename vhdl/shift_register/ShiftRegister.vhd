library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- mode:
--  00, retain data
--  01, logical right shift
--  10, arithmetic right shift
--  11, arithmetic/logical left shift
-- load: active-high
-- rst: active-low
--  rst has a higher priority than load.
entity ShiftRegister is
    generic (
        n: integer := 4);
    port (
        output: out std_logic_vector (n - 1 downto 0);
        input: in std_logic_vector (n - 1 downto 0);
        mode: in std_logic_vector (1 downto 0);
        load: in std_logic;
        rst: in std_logic;
        clk: in std_logic);
end entity ShiftRegister;

architecture Behavioral of ShiftRegister is
    signal storage: std_logic_vector (n - 1 downto 0);
begin
    output <= storage;
    
    main_process: process (clk)
        begin
        if rising_edge(clk) then
            if rst = '1' then
                storage <= (others => '0');
            else
                if load = '0' then
                    case mode is
                        when "00" =>
                            storage <= storage;
                        when "01" =>
                            -- storage <= '0' & storage(n - 1 downto 1);
                            storage <= std_logic_vector(shift_right(unsigned(storage), 1));
                        when "10" =>
                            -- storage <= storage(n - 1) & storage(n - 1 downto 1);
                            storage <= std_logic_vector(shift_right(signed(storage), 1));
                        when "11" =>
                            -- storage <= storage(n - 1 downto 1) & '0';
                            storage <= std_logic_vector(shift_left(unsigned(storage), 1));
                        when others =>
                            storage <= storage;
                    end case;
                else
                    storage <= input;
                end if;
            end if;
        end if;
    end process;
end Behavioral;

