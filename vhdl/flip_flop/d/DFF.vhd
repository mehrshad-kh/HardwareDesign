library IEEE;
use IEEE.std_logic_1164.all;

-- clr_n has a higher precedence than pre_n.
entity DFF is 
    port (
        q: out std_logic;
        q_not: out std_logic;
        d: in std_logic;
        clk: in std_logic;
        clr_n: in std_logic;
        pre_n: in std_logic
    );
end DFF;

architecture Behavioral of DFF is
    signal internal_q: std_logic;
begin
    q <= internal_q;
    q_not <= not internal_q;

    process (clr_n, pre_n, clk)
    begin
        if clr_n = '0' then
            internal_q <= '0';
        elsif pre_n = '0' then
            internal_q <= '1';
        elsif clk'event and clk = '1' then
            internal_q <= d;
        end if;
    end process;
end Behavioral;
