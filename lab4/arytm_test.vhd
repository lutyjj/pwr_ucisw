--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:57:34 11/13/2020
-- Design Name:   
-- Module Name:   E:/Programming/XilinxPrj/lab4/arytm_test.vhd
-- Project Name:  lab4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: arytm
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY arytm_test IS
END arytm_test;
 
ARCHITECTURE behavior OF arytm_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT arytm
    PORT(
         X : IN  std_logic_vector(3 downto 0);
         Y1 : OUT  std_logic_vector(3 downto 0);
         Y2 : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal X : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Y1 : std_logic_vector(3 downto 0);
   signal Y2 : std_logic_vector(3 downto 0);
	
BEGIN
 
   uut: arytm PORT MAP (
          X => X,
          Y1 => Y1,
          Y2 => Y2
        );
		  
	X <= "0000", "0001" after 100 ns, "0010" after 200 ns, "0011" after 300 ns,
		"0100" after 400 ns, "0101" after 500 ns, "0110" after 600 ns,
		"0111" after 700 ns, "1000" after 800 ns, "1001" after 900 ns,
		"1010" after 1000 ns, "1011" after 1100 ns, "1100" after 1200 ns,
		"1101" after 1300 ns, "1110" after 1400 ns, "1111" after 1500 ns;
END;
