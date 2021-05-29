----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:47:38 11/25/2020 
-- Design Name: 
-- Module Name:    automat_moore_1 - Behavioral 
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

entity automat_moore_1 is
    Port ( X : in  STD_LOGIC;
           Y : out  STD_LOGIC;
           Clk : in  STD_LOGIC);
end automat_moore_1;

architecture dataflow of automat_moore_1 is
	signal D: 	std_logic_vector(2 downto 0) := "000";
	signal Q:	std_logic_vector(2 downto 0) := "000";
	
begin
	process (Clk)
	begin
		if rising_edge(Clk) then  
			Q <= D;
		end if;
	end process;
	
	with Q & X select D <=	"000" when "0000",
									"001" when "0001",
									"010" when "0010",
									"001" when "0011",
									"011" when "0100",
									"001" when "0101",
									"000" when "0110",
									"100" when "0111",
									"010" when "1000",
									"101" when "1001",
									"010" when "1010",
									"110" when "1011",
									"000" when "1100",
									"001" when "1101",
									"XXX" when others;
										
	with Q select Y <=		'1' when "110",
									'0' when others;
end dataflow;