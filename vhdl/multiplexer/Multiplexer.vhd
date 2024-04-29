library IEEE;
use IEEE.std_logic_1164.all;

entity Multiplexer is
    port (
        z: out std_logic;
        i: in std_logic_vector (3 downto 0);
        s: in std_logic_vector (1 downto 0)
    );
end entity Multiplexer;

architecture Gates of Multiplexer is
begin
    z <= (s(1) and s(0) and i(3))
        or (s(1) and not s(0) and i(2))
        or (not s(1) and s(0) and i(1))
        or (not s(1) and not s(0) and i(0));
end Gates;
        
