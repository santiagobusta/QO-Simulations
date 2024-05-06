library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.uniform;

entity timeline_gen_tb is
end timeline_gen_tb;

architecture sim of timeline_gen_tb is

  constant c_clock_period : time := 10 ns;
  
  signal r_clock     :  std_logic := '0';
  signal r_signal1   :  std_logic := '0';
  signal r_signal2   :  std_logic := '0';
  signal w_clock     :  std_logic_vector(15 downto 0);
  signal w_event1    :  std_logic := '0';
  signal w_event2    :  std_logic := '0';

  component timeline_gen is 
    port (
      i_clock     :  in std_logic;
      i_signal1   :  in std_logic;
      i_signal2   :  in std_logic;
      o_clock     :  out std_logic_vector(15 downto 0);
      o_event1    :  out std_logic;
      o_event2    :  out std_logic
      );
  end component timeline_gen;

begin

  UUT : timeline_gen
    port map (
      i_clock => r_clock,
      i_signal1 => r_signal1,
      i_signal2 => r_signal2,
      o_clock => w_clock,
      o_event1 => w_event1,
      o_event2 => w_event2
      );

  p_clock_gen : process is
  begin
    wait for c_clock_period/2;
    r_clock <= not r_clock;
  end process p_clock_gen;

  p_signal1_gen : process is
    variable r : real;
    variable toggle : std_logic := '1';
    variable seed1 : positive := 2;
    variable seed2 : positive := 1;
  begin

    if toggle = '1' then
      uniform(seed1,seed2,r);
      wait for c_clock_period*r;
      uniform(seed1,seed2,r);
      if r < 0.5 then
        r_signal1 <= not r_signal1;
        toggle := '0';
      end if;
    elsif toggle = '0' then
      toggle := '1';
      wait for 10 ns;
      r_signal1 <= not r_signal1;
    end if;

  end process p_signal1_gen;

  p_signal2_gen : process is
    variable r : real;
    variable toggle : std_logic := '1';
    variable seed1 : positive := 2;
    variable seed2 : positive := 2;
  begin

    if toggle = '1' then
      uniform(seed1,seed2,r);
      wait for c_clock_period*r;
      uniform(seed1,seed2,r);
      if r < 0.5 then 
        r_signal2 <= not r_signal2;
        toggle := '0';
      end if;
    elsif toggle = '0' then
      toggle := '1';
      wait for 10 ns;
      r_signal2 <= not r_signal2;
    end if;

  end process p_signal2_gen;

end sim;