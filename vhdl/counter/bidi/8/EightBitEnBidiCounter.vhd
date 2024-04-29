library IEEE;
use IEEE.std_logic_1164.all;

entity EightBitEnBidiCounter is
    port (
        q: out std_logic_vector (7 downto 0);
        up: in std_logic;
        en: in std_logic;
        clr_n: in std_logic;
        one: in std_logic;
        clk: in std_logic);
end entity EightBitEnBidiCounter;

architecture Rtl of EightBitEnBidiCounter is
    -- Declarative body.
    -- Declare signals.
    signal internal_q: std_logic_vector (7 downto 0);
    signal up_not: std_logic;
    signal q_not: std_logic_vector (7 downto 0);

    signal hi_and: std_logic_vector (6 downto 0);
    signal lo_and: std_logic_vector (6 downto 0);

    signal mid_or: std_logic_vector (7 downto 1);

    -- Declare components.
    component SyncJKFF is
        port (
            q: out std_logic;
            q_not: out std_logic;
            j: in std_logic;
            k: in std_logic;
            clk: in std_logic;
            clr_n: in std_logic;
            pre_n: in std_logic);
    end component SyncJKFF;
begin
    q <= internal_q;
    up_not <= not up;

    gate_generation: for i in 0 to 6 generate
    begin
        first: if i = 0 generate
        begin
            mid_or(i + 1) <= hi_and(i) or lo_and(i);
            hi_and(i) <= en and up and internal_q(i);
            lo_and(i) <= up_not and q_not(i);
        end generate first;

        other: if i > 0 generate
        begin
            mid_or(i + 1) <= hi_and(i) or lo_and(i);
            hi_and(i) <= hi_and(i - 1) and internal_q(i);
            lo_and(i) <= lo_and(i - 1) and q_not(1);
        end generate other;
    end generate gate_generation;

    flip_flop_generation: for i in 0 to 7 generate
    begin
        first: if i = 0 generate
        begin
            flip_flop0: SyncJKFF port map (
                q => internal_q(i),
                q_not => q_not(i),
                j => en,
                k => en,
                clk => clk,
                clr_n => clr_n,
                pre_n => one);
        end generate first;

        other: if i > 0 generate
        begin
            flip_flopX: SyncJKFF port map (
                q => internal_q(i),
                q_not => q_not(i),
                j => mid_or(i),
                k => mid_or(i),
                clk => clk,
                clr_n => clr_n,
                pre_n => one);
        end generate other;
    end generate flip_flop_generation;
end Rtl;
