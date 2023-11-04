library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.uniform;

entity signal_counter_tb is
end signal_counter_tb;

architecture sim of signal_counter_tb is

  constant c_clock_period : time := 1 ns;
  
  signal r_clock     :  std_logic := '0';
  signal r_enable    :  std_logic := '0';
  signal r_signal1   :  std_logic := '0';
  signal r_signal2   :  std_logic := '0';
  signal w_counter1  :  std_logic_vector(15 downto 0);
  signal w_counter2  :  std_logic_vector(15 downto 0);
  signal w_counter12 :  std_logic_vector(15 downto 0);

  component signal_counter is 
    port (
      i_clock     :  in std_logic;
      i_enable    :  in std_logic;
      i_signal1   :  in std_logic;
      i_signal2   :  in std_logic;
      o_counter1  :  out std_logic_vector(15 downto 0);
      o_counter2  :  out std_logic_vector(15 downto 0);
      o_counter12 :  out std_logic_vector(15 downto 0)
      );
  end component signal_counter;

begin

  UUT : signal_counter
    port map (
      i_clock => r_clock,
      i_enable => r_enable,
      i_signal1 => r_signal1,
      i_signal2 => r_signal2,
      o_counter1 => w_counter1,
      o_counter2 => w_counter2,
      o_counter12 => w_counter12
      );

  p_clock_gen : process is
  begin
    wait for c_clock_period/2;
    r_clock <= not r_clock;
  end process p_clock_gen;

  process
    variable r : real;
    variable seed1 : positive := 1;
    variable seed2 : positive := 1;
  begin
    r_enable <= '1';

    wait for c_clock_period*2;
    uniform(seed1,seed2,r);
    if r < 0.5 then
      r_signal1 <= not r_signal1;
    end if;
    uniform(seed1,seed2,r);
    if r < 0.5 then
      r_signal2 <= not r_signal2;
    end if;
  end process;

end sim;