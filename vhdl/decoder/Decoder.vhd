library IEEE;
use IEEE.std_logic_1164.all;

-- g: active-low enable.
entity Decoder is
    port (
        z: out std_logic_vector (15 downto 0);
        i: in std_logic_vector (3 downto 0);
        g: in std_logic);
end entity Decoder;

architecture Gates of Decoder is
    signal g_not: std_logic;
begin
    g_not <= not g;

    z(15) <= g_not and i(3) and i(2) and i(1) and i(0);
    z(14) <= g_not and i(3) and i(2) and i(1) and not i(0);
    z(13) <= g_not and i(3) and i(2) and not i(1) and i(0);
    z(12) <= g_not and i(3) and i(2) and not i(1) and not i(0);
    z(11) <= g_not and i(3) and not i(2) and i(1) and i(0);
    z(10) <= g_not and i(3) and not i(2) and i(1) and not i(0);
    z(9) <= g_not and i(3) and not i(2) and not i(1) and i(0);
    z(8) <= g_not and i(3) and not i(2) and not i(1) and not i(0);
    z(7) <= g_not and not i(3) and i(2) and i(1) and i(0);
    z(6) <= g_not and not i(3) and i(2) and i(1) and not i(0);
    z(5) <= g_not and not i(3) and i(2) and not i(1) and i(0);
    z(4) <= g_not and not i(3) and i(2) and not i(1) and not i(0);
    z(3) <= g_not and not i(3) and not i(2) and i(1) and i(0);
    z(2) <= g_not and not i(3) and not i(2) and i(1) and not i(0);
    z(1) <= g_not and not i(3) and not i(2) and not i(1) and i(0);
    z(0) <= g_not and not i(3) and not i(2) and not i(1) and not i(0);
end Gates;
