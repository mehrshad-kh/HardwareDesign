library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- CAUTION: This module does not work as expected.
--          valid output works correctly.
--          However, data output is always "UU".
--
-- BidiRam:
--  A synchronous RAM module with an inout data port.
--
-- Generics:
-- n: number of address bits. 
--  : 2**n is the number of memory cells.
-- k: size of each cell in bits.
--
-- Ports:
-- All enable signals are active-low and synchronous.
-- valid: valid bit for the output data.
-- cs: control switch.
-- oe: read enable.
-- we: write enable.
-- rst: active-low, synchronous reset for setting valid bits to 0.
entity BidiRam is
  generic (
    n: integer := 2;
    k: integer := 8);
  port (
   data: inout std_logic_vector (k - 1 downto 0);
   valid: out std_logic;
   addr: in std_logic_vector (n - 1 downto 0);
   cs: in std_logic;
   oe: in std_logic;
   we: in std_logic;
   rst: in std_logic;
   clk: in std_logic);
end entity BidiRam;

architecture Behavioral of BidiRam is
  subtype memory_cell is std_logic_vector (k - 1 downto 0);

  type memory is array (0 to 2**n - 1) of memory_cell;

  signal data_out: std_logic_vector (k - 1 downto 0);
  signal valid_bits: std_logic_vector (0 to 2**n - 1);

  signal my_memory: memory;
begin
  -- Learned from:
  -- https://stackoverflow.com/a/11322531/12660318
  data <= data_out when (rst = '1' and cs = '0' and oe = '0' and we = '1') else (others => 'Z');

  process (clk)
  begin
    if rising_edge(clk) then
      if rst = '0' then
        valid_bits <= (others => '0');
      else
        if cs = '1' then
          -- Disabled.
          data <= (others => 'Z');
        elsif oe = '1' and we = '1' then
          -- Ambiguous (read & write).
          data <= (others => 'Z');
        elsif oe = '0' and we = '1' then
          -- Read.
          data_out <= my_memory(to_integer(unsigned(addr)));
          valid <= valid_bits(to_integer(unsigned(addr)));
        elsif we = '0' then
          -- Write.
          -- TODO: Possible error:
          -- Uncomment the following line.
          -- data_out <= (others => '0');
          my_memory(to_integer(unsigned(addr))) <= data;
          valid_bits(to_integer(unsigned(addr))) <= '1';
        else
          -- TODO: Possible error:
          -- Changed from data to data_out.
          data_out <= (others => '0');
        end if;
      end if;
    end if;
  end process;
end Behavioral;
