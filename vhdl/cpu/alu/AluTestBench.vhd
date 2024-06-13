library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use std.env.stop;

entity AluTestBench is
end;

architecture TestBench of AluTestBench is
  constant n: integer := 8;
  constant op_count: integer := 4;

  signal output: std_logic_vector (n - 1 downto 0) := (others => '0');
  signal flags: std_logic_vector (4 downto 0) := (others => '0');
  signal operand1: std_logic_vector (n - 1 downto 0) := (others => '0');
  signal operand2: std_logic_vector (n - 1 downto 0) := (others => '0');
  signal sel: std_logic_vector (op_count downto 0) := (others => '0');

  component Alu is
    generic (
      n: integer := 8;
      op_count: integer := 4);
    port (
      output: out std_logic_vector (n - 1 downto 0);
      flags: out std_logic_vector (4 downto 0);
      operand1: in std_logic_vector (n - 1 downto 0);
      operand2: in std_logic_vector (n - 1 downto 0);
      sel: in std_logic_vector (3 downto 0));
  end component;
begin
  uut: Alu port map (
    output => output,
    flags => flags,
    operand1 => operand1,
    operand2 => operand2,
    sel => sel);

  process
  begin
    sel <= "1000";
    wait for 10 ns;

    sel <= "0000";
    operand1 <= "00001000";
    operand2 <= "00000011";
    wait for 10 ns;

    operand1 <= "10000000";
    operand2 <= "10000000";
    wait for 10 ns;

    sel <= "0001";
    operand1 <= "00010111";
    operand2 <= "00001000";
    wait for 10 ns;

    sel <= "0001";
    operand1 <= "00000001";
    operand2 <= "00000010";
    wait for 10 ns;

    sel <= "0010";
    operand1 <= "00100111";
    operand2 <= "01000111";
    wait for 10 ns;

    operand1 <= "01000000";
    operand2 <= "01000001";
    wait for 10 ns;

    -- Set to -69.
    operand1 <= "10111011";
    -- Set to 35.
    operand2 <= "00100011";
    -- Result must be -34 = (11011110).
    wait for 10 ns;

    sel <= "0011";
    -- Set to -69.
    operand1 <= "10111011";
    -- Set to 35.
    operand2 <= "00100011";
    -- Result must be -104 = (10011000).
    wait for 10 ns;

    sel <= "0011";
    -- Set to -128.
    operand1 <= "10000000";
    -- Set to 127.
    operand2 <= "01111111";
    wait for 10 ns;

    std.env.stop;
  end process;
end;
