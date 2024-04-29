library IEEE;
use IEEE.std_logic_1164.all;

entity ComparatorTest is
end ComparatorTest;

architecture Behavioral of ComparatorTest is
    signal lt_out_sgnl: std_logic;
    signal eq_out_sgnl: std_logic;
    signal gt_out_sgnl: std_logic;
    signal a_sgnl: std_logic_vector (3 downto 0);
    signal b_sgnl: std_logic_vector (3 downto 0);
    signal lt_in_sgnl: std_logic;
    signal eq_in_sgnl: std_logic;
    signal gt_in_sgnl: std_logic;

    component Comparator
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
    end component;
begin
    -- Instantiate the Unit Under Test (UUT).
    uut: Comparator port map (
        lt_out => lt_out_sgnl,
        eq_out => eq_out_sgnl,
        gt_out => gt_out_sgnl,
        a => a_sgnl,
        b => b_sgnl,
        lt_in => lt_in_sgnl,
        eq_in => eq_in_sgnl,
        gt_in => gt_in_sgnl
    );

    process
    begin
        lt_in_sgnl <= '0';
        eq_in_sgnl <= '0';
        gt_in_sgnl <= '0';

        a_sgnl <= "1001";
        b_sgnl <= "1100";

        wait for 100 ns;

        a_sgnl <= "0001";
        b_sgnl <= "0001";
        lt_in_sgnl <= '0';
        eq_in_sgnl <= '1';
        gt_in_sgnl <= '0';

        wait for 100 ns;

        a_sgnl <= "0110";
        b_sgnl <= "0101";

        wait;
    end process;
end;
