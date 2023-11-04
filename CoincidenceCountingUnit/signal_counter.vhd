library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity signal_counter is
  port (
    i_clock      : in  std_logic;
    i_enable     : in  std_logic;
    i_signal1	 : in  std_logic;
    i_signal2    : in  std_logic;
    o_counter1   : out  std_logic_vector(15 downto 0); -- 16-bit signal output
    o_counter2   : out  std_logic_vector(15 downto 0); -- 16-bit signal output
    o_counter12  : out  std_logic_vector(15 downto 0) -- 16-bit signal output
    );
end signal_counter;

architecture arch of signal_counter is

  constant max_count : natural := 65535; -- 16-bit max unsigned int
  signal signal12: std_logic := '0';
  signal counter1 : natural range 0 to max_count;
  signal counter2 : natural range 0 to max_count;
  signal counter12 : natural range 0 to max_count;

begin

  counting : process (i_clock) is
  begin

    if rising_edge(i_signal1) then
      if counter1 = max_count then
        counter1 <= 0;
      else
        counter1 <= counter1 + 1;
      end if;
    end if;

    if rising_edge(i_signal2) then
      if counter2 = max_count then
        counter2 <= 0;
      else
        counter2 <= counter2 + 1;
      end if;
    end if;

    if rising_edge(i_signal1) and rising_edge(i_signal2) then
      if counter12 = max_count then
        counter12 <= 0;
      else
        counter12 <= counter12 + 1;
      end if;
    end if;

  end process counting;

  o_counter1 <= std_logic_vector(to_unsigned(counter1, o_counter1'length));
  o_counter2 <= std_logic_vector(to_unsigned(counter2, o_counter2'length));
  o_counter12 <= std_logic_vector(to_unsigned(counter12, o_counter12'length));

end arch;
