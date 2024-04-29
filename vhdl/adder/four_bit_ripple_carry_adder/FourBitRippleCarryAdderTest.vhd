library IEEE;
use IEEE.std_logic_1164.all;

entity FourBitRippleCarryAdderTest is
end entity FourBitRippleCarryAdderTest;

architecture Test of FourBitRippleCarryAdderTest is
    -- Declarative body.
    -- Declare signals.
    signal sum: std_logic_vector (3 downto 0);
    signal cout: std_logic;
    signal a: std_logic_vector (3 downto 0);
    signal b: std_logic_vector (3 downto 0);
    signal cin: std_logic;

    -- Declare components.
    component FourBitRippleCarryAdder is
        port (
            sum: out std_logic_vector (3 downto 0);
            cout: out std_logic;
            a: in std_logic_vector (3 downto 0);
            b: in std_logic_vector (3 downto 0);
            cin: in std_logic);
    end component FourBitRippleCarryAdder;
begin
    -- Instantiate components.
    ripple_carry_adder: FourBitRippleCarryAdder port map (
        sum => sum,
        cout => cout,
        a => a,
        b => b,
        cin => cin);

    process
    begin
        cin <= '0';
        a <= "0110";
        b <= "1010";

        wait;
    end process;
end Test;

