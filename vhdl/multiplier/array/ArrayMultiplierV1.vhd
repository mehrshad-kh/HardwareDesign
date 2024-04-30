library IEEE;
use IEEE.std_logic_1164.all;

entity ArrayMultiplierV1 is
    port (
        output: out std_logic_vector (7 downto 0);
        a: in std_logic_vector (3 downto 0);
        b: in std_logic_vector (3 downto 0));
end entity ArrayMultiplierV1;

architecture Rtl of ArrayMultiplierV1 is
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
    products(0)(0) <= a(0) and b(0);
    products(0)(1) <= a(0) and b(1);
    products(0)(2) <= a(0) and b(2);
    products(0)(3) <= a(0) and b(3);
    
    products(1)(0) <= a(1) and b(0);
    products(1)(1) <= a(1) and b(1);
    products(1)(2) <= a(1) and b(2);
    products(1)(3) <= a(1) and b(3);
    
    products(2)(0) <= a(2) and b(0);
    products(2)(1) <= a(2) and b(1);
    products(2)(2) <= a(2) and b(2);
    products(2)(3) <= a(2) and b(3);
    
    products(3)(0) <= a(3) and b(0);
    products(3)(1) <= a(3) and b(1);
    products(3)(2) <= a(3) and b(2);
    products(3)(3) <= a(3) and b(3);

    ha00: HalfAdder port map (
        sum => sums(0)(0),
        cout => carries(0)(0),
        a => products(0)(1),
        b => products(1)(0));
        
    fa01: FullAdder port map (
        sum => sums(0)(1),
        cout => carries(0)(1),
        a => products(2)(0),
        b => products(1)(1),
        cin => carries(0)(0));
    
    fa02: FullAdder port map (
        sum => sums(0)(2),
        cout => carries(0)(2),
        a => products(3)(0),
        b => products(2)(1),
        cin => carries(0)(1));
        
    ha03: HalfAdder port map (
        sum => sums(0)(3),
        cout => carries(0)(3),
        a => products(3)(1),
        b => carries(0)(2));
            
    ha10: HalfAdder port map (
        sum => sums(1)(0),
        cout => carries(1)(0),
        a => sums(0)(1),
        b => products(0)(2));
     
    fa11: FullAdder port map (
        sum => sums(1)(1),
        cout => carries(1)(1),
        a => sums(0)(2),
        b => products(1)(2),
        cin => carries(1)(0));
                  
    fa12: FullAdder port map (
        sum => sums(1)(2),
        cout => carries(1)(2),
        a => sums(0)(3),
        b => products(2)(2),
        cin => carries(1)(1));
         
    fa13: FullAdder port map (
        sum => sums(1)(3),
        cout => carries(1)(3),
        a => carries(0)(3),
        b => products(3)(2),
        cin => carries(1)(2));   
      
    ha20: HalfAdder port map (
        sum => sums(2)(0),
        cout => carries(2)(0),
        a => sums(1)(1),
        b => products(0)(3));
          
    fa21: FullAdder port map (
        sum => sums(2)(1),
        cout => carries(2)(1),
        a => sums(1)(2),
        b => products(1)(3),
        cin => carries(2)(0));
              
    fa22: FullAdder port map (
        sum => sums(2)(2),
        cout => carries(2)(2),
        a => sums(1)(3),
        b => products(2)(3),
        cin => carries(2)(1));       
           
    fa23: FullAdder port map (
        sum => sums(2)(3),
        cout => carries(2)(3),
        a => carries(1)(3),
        b => products(3)(3),
        cin => carries(2)(2));         
    
    output(0) <= products(0)(0);
    output(1) <= sums(0)(0);
    output(2) <= sums(1)(0);
    output(3) <= sums(2)(0);
    output(4) <= sums(2)(1);
    output(5) <= sums(2)(2);
    output(6) <= sums(2)(3);
    output(7) <= carries(2)(3);

end Rtl;
