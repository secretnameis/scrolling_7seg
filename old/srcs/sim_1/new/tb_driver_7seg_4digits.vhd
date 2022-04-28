------------------------------------------------------------
--
-- Template for 4-digit 7-segment display driver testbench.
-- Nexys A7-50T, Vivado v2020.1.1, EDA Playground
--
-- Copyright (c) 2020-Present Tomas Fryza
-- Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------
entity tb_driver_7seg_4digits is
    -- Entity of testbench is always empty
end entity tb_driver_7seg_4digits;

------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------
architecture testbench of tb_driver_7seg_4digits is

    -- Local constants
    constant c_CLK_100MHZ_PERIOD : time := 10 ns;

    -- Local signals
    signal s_clk_100MHz     : std_logic;
    signal s_reset          : std_logic;
    signal S_data           : std_logic_vector(31 downto 0);
    signal s_dpin           : std_logic_vector(7 downto 0);
    signal s_dpout          : std_logic;
    signal s_seg            : std_logic_vector(6 downto 0);
    signal s_dig            : std_logic_vector(7 downto 0);


begin
    -- Connecting testbench signals with driver_7seg_4digits
    -- entity (Unit Under Test)
    -- MAP I/O PORTS FROM ENTITY TO LOCAL SIGNALS
    uut_driver_7seg_4digits : entity work.driver_7seg_4digits
         port map(
            clk          =>   s_clk_100MHz,
            reset        =>   s_reset,
            data_i       =>   s_data,
            dp_i         =>   s_dpin,
            dp_o         =>   s_dpout,
            seg_o        =>   s_seg,
            dig_o        =>   s_dig
        );

    --------------------------------------------------------
    -- Clock generation process
    --------------------------------------------------------
    p_clk_gen : process
    begin
        while now < 750000 ns loop -- 75 periods of 100MHz clock
            s_clk_100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk_100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;
    end process p_clk_gen;

    --------------------------------------------------------
    -- Reset generation process
    --------------------------------------------------------
    -- WRITE YOUR CODE HERE AND ACTIVATE RESET FOR A WHILE
    p_reset_gen : process
    begin
        s_reset <= '0';
        wait for 10 ns;
        s_reset <= '1';
        wait for 100 ns;
        s_reset <= '0';
        wait;
    
    
    end process p_reset_gen;

    --------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------
    p_stimulus : process
    begin
        report "Stimulus process started" severity note;
       
        report "Stimulus process finished" severity note;
        wait;
        
    end process p_stimulus;

end architecture testbench;
