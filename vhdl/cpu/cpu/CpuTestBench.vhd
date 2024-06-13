library IEEE;
use IEEE.std_logic_1164.all;
use std.env.stop;

entity CpuTestBench is
end;

architecture TestBench of CpuTestBench is
  constant period: time := 20 ns;

  constant n: integer := 8;
  constant ram_addr_len: integer := 2;
  constant rom_addr_len: integer := 3;

  signal output: std_logic_vector (n - 1 downto 0);
  signal flags: std_logic_vector (4 downto 0);
  signal ram_addr: std_logic_vector (ram_addr_len - 1 downto 0);
  signal rom_addr: std_logic_vector (rom_addr_len - 1 downto 0);
  signal sel: std_logic_vector (3 downto 0);
  signal operand2: std_logic_vector (n - 1 downto 0);
  signal rst: std_logic;
  signal clk: std_logic;

  component Cpu is
    generic (
      n: integer := 8;
      ram_addr_len: integer := 2;
      rom_addr_len: integer := 3);
    port (
      output: out std_logic_vector (n - 1 downto 0);
      flags: out std_logic_vector (4 downto 0);
      ram_addr: in std_logic_vector (ram_addr_len - 1 downto 0);
      rom_addr: in std_logic_vector (rom_addr_len - 1 downto 0);
      sel: in std_logic_vector (3 downto 0);
      operand2: in std_logic_vector (n - 1 downto 0);
      rst: in std_logic;
      clk: in std_logic);
  end component;
begin
  uut: Cpu
    port map (
      output => output,
      flags => flags,
      ram_addr => ram_addr,
      rom_addr => rom_addr,
      sel => sel,
      operand2 => operand2,
      rst => rst,
      clk => clk);

  clock_generation: process
  begin
    clk <= '0';
    wait for period / 2;
    clk <= '1';
    wait for period / 2;
  end process;

  test: process
  begin
    rst <= '0';
    wait for 2 * period;

    rst <= '1';
    wait for 2 * period;

    sel <= "0000";
    operand2 <= "00100100";
    ram_addr <= "10";
    rom_addr <= "010";
    wait for 2 * period;

    sel <= "0001";
    operand2 <= "00001100";
    rom_addr <= "100";
    wait for 2 * period;

    std.env.stop;
  end process;
end;
