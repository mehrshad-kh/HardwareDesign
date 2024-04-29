library IEEE;
use IEEE.std_logic_1164.all;

-- This module has not been tested.
entity FullAdder is 
    port (
        sum: out std_logic;
        cout: out std_logic;
        a: in std_logic;
        b: in std_logic;
        cin: in std_logic);
end entity FullAdder;

architecture Gates of FullAdder is
begin
     sum <= a xor b xor cin;
     cout <= (a and b) or (a and cin) or (b and cin);
end Gates;
