----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:18:04 11/13/2020 
-- Design Name: 
-- Module Name:    licznik - Behavioral 
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

library UNISIM;  
use UNISIM.Vcomponents.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity licznik is
    Port ( DIR : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (2 downto 0);
           Clk : in  STD_LOGIC);
end licznik;

architecture Behavioral of licznik is
	signal D : STD_LOGIC_VECTOR (2 downto 0);
	signal Qout : STD_LOGIC_VECTOR (3 downto 0);
	
begin
	FDCE_inst_0 : FDCE
	generic map ( INIT => '0' )
	port map ( Q => Qout(0), C => Clk, CE => '1', CLR => '0', D => D(0) );
	
	FDCE_inst_1 : FDCE
	generic map ( INIT => '0' )
	port map ( Q => Qout(1), C => Clk, CE => '1', CLR => '0', D => D(1) );
	
	FDCE_inst_2 : FDCE
	generic map ( INIT => '0' )
	port map ( Q => Qout(2), C => Clk, CE => '1', CLR => '0', D => D(2) );
	
	Qout(3) <= DIR;
	with Qout select D <=
			"001" when "0000",
			"010" when "0001",
			"011" when "0010",
			"100" when "0011",
			"101" when "0100",
			"111" when "0101",
			"000" when "0110",
			"110" when "0111",
			
			"110" when "1000",
			"000" when "1001",
			"001" when "1010",
			"010" when "1011",
			"011" when "1100",
			"100" when "1101",
			"111" when "1110",
			"101" when "1111",
			
			"XXX" when others;
	
	Q(0) <= Qout(0);
	Q(1) <= Qout(1);
	Q(2) <= Qout(2);
end Behavioral;