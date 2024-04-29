library IEEE;
use IEEE.std_logic_1164.all;

entity TFF is
    port (
        q: out std_logic;
        q_not: out std_logic;
        t: in std_logic;
        clk: in std_logic;
        clr_n: in std_logic;
        pre_n: in std_logic);
end TFF;

architecture Behavioral of TFF is
    signal internal_q: std_logic;
begin
    q <= internal_q;
    q_not <= not internal_q;

    process (clk)
    begin
        if clk'event and clk = '1' then
            if clr_n = '0' then internal_q <= '0';
            elsif pre_n = '0' then internal_q <= '1';
            else internal_q <= t xor internal_q;
            end if;
        end if;
    end process;
end Behavioral;
        
