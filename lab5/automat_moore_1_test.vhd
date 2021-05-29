--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:04:35 11/25/2020
-- Design Name:   
-- Module Name:   E:/Programming/XilinxPrj/lab5/automat_moore_1_test.vhd
-- Project Name:  lab5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: automat_moore_1
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
 
ENTITY automat_moore_1_test IS
END automat_moore_1_test;
 
ARCHITECTURE behavior OF automat_moore_1_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT automat_moore_1
    PORT(
         X : IN  std_logic;
         Y : OUT  std_logic;
         Clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal X : std_logic := '0';
   signal Clk : std_logic := '0';
	signal Xin : std_logic_vector(20 downto 0) := "001100111010100110011";

 	--Outputs
   signal Y : std_logic;

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: automat_moore_1 PORT MAP (
          X => X,
          Y => Y,
          Clk => Clk
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin
		for i in Xin'high downto 0 loop
			X <= Xin(i);
			wait for CLK_period;
		end loop;

      wait;
   end process;

END;
