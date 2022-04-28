----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.04.2022 07:19:39
-- Design Name: 
-- Module Name: tb_shift_array - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_shift_array is

end tb_shift_array;

architecture Behavioral of tb_shift_array is

    -- Local constants
      constant c_CLK_100MHZ_PERIOD : time := 10 ns;  

       signal s_clk_100MHz : std_logic;
       signal s_reset : STD_LOGIC;
       signal s_x : STD_LOGIC_VECTOR (31 downto 0);

begin

    uut_shift_array : entity work.shift_array
         port map(
        clk => s_clk_100MHz,
        reset => s_reset,
        x => s_x
        );
        
    p_clk_gen : process
    begin
        while now < 750 ns loop -- 75 periods of 100MHz clock
            s_clk_100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk_100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;
    end process p_clk_gen;
    
        p_clr_gen : process
    begin
        s_reset <= '0';
        wait for 10 ns;
        s_reset <= '1';
        wait for 100 ns;
        s_reset <= '0';
        wait;
    
    end process p_clr_gen;
    
        p_stimulus : process
    begin

        report "Stimulus process started" severity note;

        
        report "Stimulus process finished" severity note;
        wait;
        
    end process p_stimulus;


end Behavioral;
