library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- n-bit ALU
--
-- CAUTION: I believe the overflow flag is not set properly.
-- flags: C, O, P, S, Z.
--      P: odd parity.
-- sel: 4 bits, allowing for 16 different operations.
--      0000: unsigned addition.
--      0001: unsigned subtraction.
--      0010: signed addition.
--      0011: signed subtraction.
entity Alu is
  generic (
    n: integer := 8);
  port (
    output: out std_logic_vector (n - 1 downto 0);
    flags: out std_logic_vector (4 downto 0);
    operand1: in std_logic_vector (n - 1 downto 0);
    operand2: in std_logic_vector (n - 1 downto 0);
    sel: in std_logic_vector (3 downto 0));
end;

architecture Behavioral of Alu is
  constant all_zeros: std_logic_vector (n - 1 downto 0) := (others => '0');

  signal c: std_logic;
  signal o: std_logic;
  signal p: std_logic;
  signal s: std_logic;
  signal z: std_logic;

  -- Used for determining overflow.
  signal tmp: std_logic_vector (2 downto 0);

  -- Intermediate output.
  signal inter_output: std_logic_vector (n downto 0);
begin
  flags(0) <= c;
  flags(1) <= o;
  flags(2) <= p;
  flags(3) <= s;
  flags(4) <= z;

  c <= inter_output (n);
  p <= xor inter_output (n - 1 downto 0);
  s <= inter_output (n - 1);
  z <= '1' when inter_output (n - 1 downto 0) = all_zeros else '0';

  tmp <= operand1 (n - 1) & operand2 (n - 1) & inter_output (n - 1);

  output <= inter_output (n - 1 downto 0);

  process (operand1, operand2, sel, tmp)
  begin
    case sel is
      when "0000" =>
        inter_output <= std_logic_vector(resize(unsigned(operand1), n + 1) + resize(unsigned(operand2), n + 1));
        o <= '0';
      when "0001" =>
        inter_output <= std_logic_vector(resize(unsigned(operand1), n + 1) - resize(unsigned(operand2), n + 1));
        o <= '0';
      when "0010" =>
        inter_output <= std_logic_vector(resize(signed(operand1), n + 1) + resize(signed(operand2), n + 1));
        -- Negative result when adding positive numbers, or
        -- a positive result when adding negative numbers.
        o <= '1' when tmp = "001" or tmp = "110" else '0';
      when "0011" =>
        inter_output <= std_logic_vector(resize(signed(operand1), n + 1) - resize(signed(operand2), n + 1));
        -- Negative result when subtracting a negative from a positive, or
        -- a positive result when subtracting a positive from a negative.
        o <= '1' when tmp = "011" or tmp = "100" else '0';
      when others =>
        inter_output <= (others => '0');
    end case;
  end process;
end;

