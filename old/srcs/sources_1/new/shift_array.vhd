library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity shift_array is
    port(
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        x : out STD_LOGIC_VECTOR (31 downto 0)
    );
end shift_array;


architecture shift_array of shift_array is
signal msg_array : STD_LOGIC_VECTOR(0 to 63); --64 bit array
constant MESSAGE : STD_LOGIC_VECTOR (63 downto 0) :=X"0123456789ABCDEF"; --message, which will be running on 7seg display
begin
    process (reset, clk)
    
    begin
        if reset = '1' then
            msg_array <= MESSAGE; --put message to array
        --elsif(clk'event and clk = '1') then
        elsif(falling_edge(clk)) then
        --elsif(rising_edge(clk)) then
            
            msg_array (0 to 59) <= msg_array (4 to 63); --shift the array by 4 bits 
            msg_array (60 to 63) <= msg_array (0 to 3); --move last 4 bits to start
        end if;
    end process;
    x <= msg_array (0 to 31); --return first 32 bits from msg_array (will be displayed on display)
    
end shift_array;