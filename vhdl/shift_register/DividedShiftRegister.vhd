library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- CAUTION: This module has not been tested.
-- A shift register whose clock frequency is divided.
-- mode:
--  00, retain data
--  01, logical right shift
--  10, arithmetic right shift
--  11, arithmetic/logical left shift
-- load: active-high
-- rst: active-low
--  rst has a higher priority than load.
entity DividedShiftRegister is
    generic (
        n: integer := 4);
    port (
        output: out std_logic_vector (n - 1 downto 0);
        input: in std_logic_vector (n - 1 downto 0);
        mode: in std_logic_vector (1 downto 0);
        load: in std_logic;
        rst: in std_logic;
        clk: in std_logic);
end entity DividedShiftRegister;

architecture Behavioral of DividedShiftRegister is
  signal inter_clk: std_logic;

  component ClockCounter is
    generic (
      freq: integer := 4 * 10 ** 7);
    port (
      clk_out: out std_logic;
      clk_in: in std_logic);
  end component ClockCounter;

  component ShiftRegister is
      generic (
          n: integer := 4);
      port (
          output: out std_logic_vector (n - 1 downto 0);
          input: in std_logic_vector (n - 1 downto 0);
          mode: in std_logic_vector (1 downto 0);
          load: in std_logic;
          rst: in std_logic;
          clk: in std_logic);
  end component ShiftRegister;
begin
  clock_counter: ClockCounter
    port map (
      clk_out => inter_clk,
      clk_in => clk);

  shift_register: ShiftRegister 
    generic map (n => 4)
    port map (
      output => output,
      input => input,
      mode => mode,
      load => load,
      rst => rst,
      clk => inter_clk);
end Behavioral;
