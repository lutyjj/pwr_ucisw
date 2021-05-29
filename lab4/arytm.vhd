----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:45:20 11/13/2020 
-- Design Name: 
-- Module Name:    arytm - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity arytm is
    Port ( X : in  STD_LOGIC_VECTOR (3 downto 0);
           Y1 : out  STD_LOGIC_VECTOR (3 downto 0);
           Y2 : out  STD_LOGIC_VECTOR (3 downto 0));
end arytm;

architecture Behavioral of arytm is

begin
	Y1(3) <= ((not X(3)) and X(0)) or ((not X(3)) and  X(1)) or ((not X(3)) and X(2)) or (X(3) and (not X(2)) and (not X(1)) and (not X(0)));
	Y1(2) <= (X(2) and X(0)) or (X(2) and X(1)) or ((not X(2)) and (not X(1)) and (not X(0)));
	Y1(1) <= (not X(1) and not X(0)) or (X(1) and X(0));
	Y1(0) <= not X(0);
	
	with X select Y2 <=
		"0111" when "0000",
		"1000" when "0001",
		"1001" when "0010",
		"1010" when "0011",
		"1011" when "0100",
		"1100" when "0101",
		"1101" when "0110",
		"1110" when "0111",
		"1111" when "1000",
		"0000" when "1001",
		"0001" when "1010",
		"0010" when "1011",
		"0011" when "1100",
		"0100" when "1101",
		"0101" when "1110",
		"0110" when "1111",
		"XXXX" when others;
end Behavioral;