library IEEE;
use IEEE.std_logic_1164.all;

entity ThreeBitEnBidiCounter is
    port (
        q: out std_logic_vector (2 downto 0);
        up: in std_logic;
        en: in std_logic;
        clr_n: in std_logic;
        one: in std_logic;
        clk: in std_logic);
end entity ThreeBitEnBidiCounter;

architecture Rtl of ThreeBitEnBidiCounter is
    -- Declarative body.
    -- Declare signals.
    signal internal_q: std_logic_vector (2 downto 0);
    signal up_not: std_logic;
    signal q_not: std_logic_vector (2 downto 0);

    signal hi_and: std_logic_vector (1 downto 0);
    signal lo_and: std_logic_vector (1 downto 0);

    signal mid_or: std_logic_vector (2 downto 1);

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

    mid_or(1) <= hi_and(0) or lo_and(0);
    hi_and(0) <= en and up and internal_q(0);
    lo_and(0) <= up_not and q_not(0);

    mid_or(2) <= hi_and(1) or lo_and(1);
    hi_and(1) <= hi_and(0) and internal_q(1);
    lo_and(1) <= lo_and(0) and q_not(1);

    -- Instantiate components.
    flip_flop0: SyncJKFF port map (
        q => internal_q(0),
        q_not => q_not(0),
        j => en,
        k => en,
        clk => clk,
        clr_n => clr_n,
        pre_n => one);

    flip_flop1: SyncJKFF port map (
        q => internal_q(1),
        q_not => q_not(1),
        j => mid_or(1),
        k => mid_or(1),
        clk => clk,
        clr_n => clr_n,
        pre_n => one);

    flip_flop2: SyncJKFF port map (
        q => internal_q(2),
        q_not => q_not(2),
        j => mid_or(2),
        k => mid_or(2),
        clk => clk,
        clr_n => clr_n,
        pre_n => one);




end Rtl;
