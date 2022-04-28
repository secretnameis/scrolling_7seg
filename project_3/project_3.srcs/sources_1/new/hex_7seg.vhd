----------------------------------------------------------------------------------
 
-- Create Date: 03/09/2022 09:18:05 AM
-- Design Name: 
-- Module Name: hex_7seg - Behavioral

----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity hex_7seg is
    Port ( hex_i : in STD_LOGIC_VECTOR (3 downto 0);
           seg_o : out STD_LOGIC_VECTOR (6 downto 0));
end hex_7seg;

architecture Behavioral of hex_7seg is
begin
    --------------------------------------------------------
    -- p_7seg_decoder:
    -- A combinational process for 7-segment display (Common
    -- Anode) decoder. Any time "hex_i" is changed, the process
    -- is "executed". Output pin seg_o(6) controls segment A,
    -- seg_o(5) segment B, etc.
    --       segment A
    --        | segment B
    --        |  | segment C
    --        +-+|  |   ...   segment G
    --          ||+-+          |
    --          |||            |
    -- seg_o = "0000001"-------+
    --------------------------------------------------------
    p_7seg_decoder : process(hex_i)
    begin
        case hex_i is        
            when x"0" =>
                seg_o <= "0000001"; -- 0
            when x"1" => 
                seg_o <= "1001000"; -- H
            when x"2" => 
                seg_o <= "0110000"; -- E
            when x"3" => 
                seg_o <= "1110001"; -- L
            when x"4" => 
                seg_o <= "1111111"; -- "blank"
            when x"5" =>
                seg_o <= "0100100"; -- 5
            when x"6" =>
                seg_o <= "0100000"; -- 6
            when x"7" =>
                seg_o <= "0001111"; -- 7
            when x"8" =>
                seg_o <= "0000000"; -- 8
            when x"9" =>
                seg_o <= "0000100"; -- 9
            when x"A" =>
                seg_o <= "0001000"; -- A
            when x"B" =>
                seg_o <= "1100000"; -- b
            when x"C" =>
                seg_o <= "0110001"; -- C
            when x"D" =>
                seg_o <= "1000010"; -- d
            when x"E" =>
                seg_o <= "0110000"; -- E
            when others =>
                seg_o <= "0111000"; -- F
        end case;
    end process p_7seg_decoder;

end architecture Behavioral;
