library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top is
    port(
        CLK100MHZ   : in  std_logic;
        SW          : in  std_logic_vector(15 downto 0);
        CA          : out std_logic;
        CB          : out std_logic;
        CC          : out std_logic;
        CD          : out std_logic;
        CE          : out std_logic;
        CF          : out std_logic;
        CG          : out std_logic;
        DP          : out std_logic;
        AN          : out  std_logic_vector(7 downto 0);
        BTNC        : in std_logic
    );
end top;

architecture Behavioral of top is
  
begin

  --------------------------------------------------------
  -- Instance (copy) of driver_7seg_4digits entity
  driver_seg_4 : entity work.driver_7seg_4digits
      port map(
          clk        => CLK100MHZ,        
          reset      => BTNC,
          dp_i       => "11111111", --turn off all decimal points

          -- MAP DECIMAL POINT AND DISPLAY SEGMENTS
          seg_o(6)   => CA,
          seg_o(5)   => CB,
          seg_o(4)   => CC,
          seg_o(3)   => CD,
          seg_o(2)   => CE,
          seg_o(1)   => CF,
          seg_o(0)   => CG,
          dp_o       => DP,
          dig_o(7 downto 0) => AN(7 downto 0)
      );

end architecture Behavioral;