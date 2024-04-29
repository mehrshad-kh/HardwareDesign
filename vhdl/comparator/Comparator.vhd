library IEEE;
use IEEE.std_logic_1164.all;

-- 4-bit comparator.
entity Comparator is
    port (
        lt_out: out std_logic;
        eq_out: out std_logic;
        gt_out: out std_logic;
        a: in std_logic_vector (3 downto 0);
        b: in std_logic_vector (3 downto 0);
        lt_in: in std_logic;
        eq_in: in std_logic;
        gt_in: in std_logic
    );
end Comparator;

architecture Gates of Comparator is
    signal c: std_logic_vector (3 downto 0);
    signal eq: std_logic;
begin
    c(3) <= a(3) xnor b(3);
    c(2) <= a(2) xnor b(2);
    c(1) <= a(1) xnor b(1);
    c(0) <= a(0) xnor b(0);

    eq <= c(3) and c(2) and c(1) and c(0);

    lt_out <= lt_in when eq = '1'
        else (not a(3) and b(3))
        or (c(3) and not a(2) and b(2))
        or (c(3) and c(2) and not a(1) and b(1))
        or (c(3) and c(2) and c(1) and not a(0) and b(0));

    eq_out <= eq_in when eq = '1' else '0';

    gt_out <= gt_in when eq = '1'
        else (a(3) and not b(3)) 
        or (c(3) and a(2) and not b(2))
        or (c(3) and c(2) and a(1) and not b(1))
        or (c(3) and c(2) and c(1) and a(0) and not b(0));
end Gates;

