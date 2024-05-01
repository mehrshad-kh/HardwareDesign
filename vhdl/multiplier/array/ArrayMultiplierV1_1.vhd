library IEEE;
use IEEE.std_logic_1164.all;

entity ArrayMultiplierV1_1 is
    port (
        output: out std_logic_vector (7 downto 0);
        a: in std_logic_vector (3 downto 0);
        b: in std_logic_vector (3 downto 0));
end entity ArrayMultiplierV1_1;

architecture Rtl of ArrayMultiplierV1_1 is
    type four_by_four_array is array (0 to 3) of std_logic_vector (0 to 3);
    type three_by_four_array is array (0 to 2) of std_logic_vector (0 to 3);
    
    signal products: four_by_four_array;
    signal sums: three_by_four_array;
    signal carries: three_by_four_array;
    
    component FullAdder is 
        port (
            sum: out std_logic;
            cout: out std_logic;
            a: in std_logic;
            b: in std_logic;
            cin: in std_logic);
    end component FullAdder;

    component HalfAdder is
    port (
        sum: out std_logic;
        cout: out std_logic;
        a: in std_logic;
        b: in std_logic);
end component HalfAdder;
begin
    outer_prdct_gen: for i in 0 to 3 generate
    begin
        inner_prdct_gen: for j in 0 to 3 generate
        begin
            products(i)(j) <= a(i) and b(j);
        end generate inner_prdct_gen;
    end generate outer_prdct_gen;

    outer_addr_gen: for i in 0 to 2 generate
    begin
        inner_addr_gen: for j in 0 to 3 generate
        begin
            rw_one_gen: if i = 0 generate
            begin
                frst_addr_gen: if j = 0 generate
                begin
                    ha00: HalfAdder port map (
                        sum => sums(i)(j),
                        cout => carries(i)(j),
                        a => products(j)(i + 1),
                        b => products(j + 1)(i));
                end generate frst_addr_gen;

                mid_addr_gen: if j > 0 and j < 3 generate
                begin
                    fa0X: FullAdder port map (
                        sum => sums(i)(j),
                        cout => carries(i)(j),
                        a => products(j)(i + 1),
                        b => products(j + 1)(i),
                        cin => carries(i)(j - 1));
                end generate mid_addr_gen;
                
                lst_addr_gen: if j = 3 generate
                begin
                    ha03: HalfAdder port map (
                        sum => sums(i)(j),
                        cout => carries(i)(j),
                        a => products(j)(i + 1),
                        b => carries(i)(j - 1));
                end generate lst_addr_gen;
            end generate rw_one_gen;

            othr_rw_gen: if i > 0 generate
                frst_addr_gen: if j = 0 generate
                    ha10: HalfAdder port map (
                        sum => sums(i)(j),
                        cout => carries(i)(j),
                        a => sums(i - 1)(j + 1),
                        b => products(j)(i + 1));
                end generate frst_addr_gen;

                mid_addr_gen: if j > 0 and j < 3 generate
                    fa1X: FullAdder port map (
                        sum => sums(i)(j),
                        cout => carries(i)(j),
                        a => sums(i - 1)(j + 1),
                        b => products(j)(i + 1),
                        cin => carries(i)(j - 1));
                end generate mid_addr_gen;

                lst_addr_gen: if j = 3 generate
                    fa13: FullAdder port map (
                        sum => sums(i)(j),
                        cout => carries(i)(j),
                        a => carries(i - 1)(j),
                        b => products(j)(i + 1),
                        cin => carries(i)(j - 1));
                end generate lst_addr_gen;
            end generate othr_rw_gen;
        end generate inner_addr_gen;
    end generate outer_addr_gen;

    output(0) <= products(0)(0);
    output(1) <= sums(0)(0);
    output(2) <= sums(1)(0);

    output_gen: for i in 0 to 3 generate
    begin
        output(2 + 1 + i) <= sums(2)(i);
    end generate output_gen;

    output(7) <= carries(2)(3);
end Rtl;
