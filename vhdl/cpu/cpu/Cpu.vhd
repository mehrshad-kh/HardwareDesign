library IEEE;
use IEEE.std_logic_1164.all;

entity Cpu is
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
    -- Used by RAM.
    rst: in std_logic;
    -- Used by RAM.
    clk: in std_logic);
end;

architecture Behavioral of Cpu is
  signal alu_output: std_logic_vector (n - 1 downto 0);
  signal alu_flags: std_logic_vector (4 downto 0);
  signal alu_operand1: std_logic_vector (n - 1 downto 0);
  signal alu_operand2: std_logic_vector (n - 1 downto 0);
  signal alu_sel: std_logic_vector (3 downto 0);

  signal ram_data_out: std_logic_vector (n - 1 downto 0);
  signal valid: std_logic;
  signal ram_data_in: std_logic_vector (n - 1 downto 0);
  signal cs: std_logic;
  signal oe: std_logic;
  signal we: std_logic;

  signal rom_output: std_logic_vector (n - 1 downto 0);

  component Alu is
    generic (
      n: integer := 8);
    port (
      output: out std_logic_vector (n - 1 downto 0);
      flags: out std_logic_vector (4 downto 0);
      operand1: in std_logic_vector (n - 1 downto 0);
      operand2: in std_logic_vector (n - 1 downto 0);
      sel: in std_logic_vector (3 downto 0));
  end component;

  component Ram is
    generic (
      n: integer := 2;
      k: integer := 8);
    port (
     data_out: out std_logic_vector (k - 1 downto 0);
     valid: out std_logic;
     data_in: in std_logic_vector (k - 1 downto 0);
     addr: in std_logic_vector (n - 1 downto 0);
     cs: in std_logic;
     oe: in std_logic;
     we: in std_logic;
     rst: in std_logic;
     clk: in std_logic);
  end component;

  component Rom is
    generic (
      word_len: integer := 8;
      addr_len: integer := 3);
    port (
      output: out std_logic_vector (word_len - 1 downto 0);
      addr: in std_logic_vector (addr_len - 1 downto 0));
  end component;
begin
  cs <= '0';
  oe <= '1';
  we <= '0';
  output <= alu_output;
  flags <= alu_flags;
  ram_data_in <= alu_output;

  alu_operand1 <= rom_output;
  alu_operand2 <= operand2;
  alu_sel <= sel;

  my_alu: Alu 
    generic map (
      n => n)
    port map (
      output => alu_output,
      flags => alu_flags,
      operand1 => alu_operand1,
      operand2 => alu_operand2,
      sel => alu_sel);

  my_ram: Ram
    generic map (
      n => ram_addr_len,
      k => n)
    port map (
      data_out => ram_data_out,
      valid => valid,
      data_in => ram_data_in,
      addr => ram_addr,
      cs => cs,
      oe => oe,
      we => we,
      rst => rst,
      clk => clk);

  my_rom: Rom
    generic map (
      word_len => n,
      addr_len => rom_addr_len)
    port map (
      output => rom_output,
      addr => rom_addr);
end;
