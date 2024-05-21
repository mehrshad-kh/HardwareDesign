library IEEE;
use IEEE.std_logic_1164.all;
-- use IEEE.numeric_std.all;

-- CAUTION: This module has not been tested.
entity ClockCounter is
  generic (
    freq: integer := 4 * 10 ** 7);
  port (
    clk_out: out std_logic;
    clk_in: in std_logic);
end entity ClockCounter;

architecture Behavioral of ClockCounter is
  signal inter_clk: std_logic := '0';
  signal count: integer := 0;
begin
  clk_out <= inter_clk;

  process (clk_in)
  begin
    if rising_edge(clk_in) then
      if count /= freq - 1 then
        count <= count + 1;
      else
        count <= 0;
        inter_clk <= not inter_clk;
      end if;
    end if;
  end process;
end Behavioral;
