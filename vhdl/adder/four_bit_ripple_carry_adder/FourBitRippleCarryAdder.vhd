library IEEE;
use IEEE.std_logic_1164.all;

entity FourBitRippleCarryAdder is
    port (
        sum: out std_logic_vector (3 downto 0);
        cout: out std_logic;
        a: in std_logic_vector (3 downto 0);
        b: in std_logic_vector (3 downto 0);
        cin: in std_logic);
end entity FourBitRippleCarryAdder;

architecture Gates of FourBitRippleCarryAdder is
    signal inter_c: std_logic_vector (4 downto 0);

    component FullAdder is
        port (
            sum: out std_logic;
            cout: out std_logic;
            a: in std_logic;
            b: in std_logic;
            cin: in std_logic);
    end component FullAdder;
begin
    inter_c(0) <= cin;
    cout <= inter_c(4);

    generate_statement: for i in 3 downto 0 generate
    begin
        full_adder: FullAdder port map (
            sum => sum(i),
            cout => inter_c(i + 1),
            a => a(i),
            b => b(i),
            cin => inter_c(i));
    end generate generate_statement;
end Gates;
