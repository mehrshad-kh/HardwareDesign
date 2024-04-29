library IEEE;
use IEEE.std_logic_1164.all;

-- clr_n has a higher precedence than pre_n.
entity AsyncJKFF is
    port (
        q: out std_logic;
        q_not: out std_logic;
        j: in std_logic;
        k: in std_logic;
        clk: in std_logic;
        clr_n: in std_logic;
        pre_n: in std_logic);
end AsyncJKFF;

architecture Gates of AsyncJKFF is
    signal internal_q: std_logic;
begin
    q <= internal_q;
    q_not <= not internal_q;

    process (clk, clr_n, pre_n)
    begin
        if clr_n = '0' then
            internal_q <= '0';
        elsif pre_n = '0' then
            internal_q <= '1';
        elsif clk'event and clk = '1' then
            internal_q <= (j and not internal_q) or (not k and internal_q);
        end if;
    end process;
end Gates;

