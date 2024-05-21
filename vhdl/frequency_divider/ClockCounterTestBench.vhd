library IEEE;
use IEEE.std_logic_1164.all;

entity ClockCounterTestBench is
end entity ClockCounterTestBench;

architecture TestBench of ClockCounterTestBench is
  constant freq: integer := 4 * 10 ** 7;
  signal clk_in: std_logic := '0';
  signal clk_out: std_logic := '0';

  component ClockCounter is
    generic (
      freq: integer := freq);
    port (
      clk_out: out std_logic;
      clk_in: in std_logic);
  end component ClockCounter;
begin
  uut: ClockCounter port map (
    clk_out => clk_out,
    clk_in => clk_in);

  process
  begin
    for i in 0 to freq loop
      clk_in <= not clk_in;
    end loop;

    std.env.stop;
  end process;
end TestBench;
