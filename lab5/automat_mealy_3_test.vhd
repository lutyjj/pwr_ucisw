--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:30:41 11/25/2020
-- Design Name:   
-- Module Name:   E:/Programming/XilinxPrj/lab5/automat_mealy_3_test.vhd
-- Project Name:  lab5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: automat_mealy_3
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
 
ENTITY automat_mealy_3_test IS
END automat_mealy_3_test;
 
ARCHITECTURE behavior OF automat_mealy_3_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT automat_mealy_3
    PORT(
         Clk : IN  std_logic;
         Reset : IN  std_logic;
         x : IN  std_logic;
         y : INOUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal Reset : std_logic := '0';
   signal x : std_logic := '0';
	signal Xin : std_logic_vector(20 downto 0) := "001100111010100110011";

 	--Outputs
   signal y : std_logic;

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: automat_mealy_3 PORT MAP (
          Clk => Clk,
          Reset => Reset,
          x => x,
          y => y
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
