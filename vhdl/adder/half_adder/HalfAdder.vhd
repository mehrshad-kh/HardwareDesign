library IEEE;
use IEEE.std_logic_1164.all;

entity HalfAdder is
    port (
        sum: out std_logic;
        cout: out std_logic;
        a: in std_logic;
        b: in std_logic);
end entity HalfAdder;

architecture Gates of HalfAdder is
begin
    sum <= a xor b;
    cout <= a and b;
end Gates;

