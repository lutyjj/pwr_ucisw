--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:18:12 12/22/2020
-- Design Name:   
-- Module Name:   E:/Programming/XilinxPrj/lab7/ps2_lock_test.vhd
-- Project Name:  lab7
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ps2_lock
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
 
ENTITY ps2_lock_test IS
END ps2_lock_test;
 
ARCHITECTURE behavior OF ps2_lock_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ps2_lock
    PORT(
         DO : IN  std_logic_vector(7 downto 0);
         F0 : IN  std_logic;
         DO_Rdy : IN  std_logic;
         Clk : IN  std_logic;
         Reset : IN  std_logic;
         y : INOUT  std_logic;
			TxStart : INOUT std_logic;
			TxDI : OUT std_logic_vector(7 downto 0);
			COUNTER : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal DO : std_logic_vector(7 downto 0) := (others => '0');
   signal F0 : std_logic := '1';
   signal DO_Rdy : std_logic := '0';
   signal Clk : std_logic := '0';
   signal Reset : std_logic := '0';

 	--Outputs
   signal y : std_logic;
	signal TxStart : std_logic;
	signal TxDI : std_logic_vector(7 downto 0) := (others => '0');
	signal COUNTER : std_logic_vector(3 downto 0) := "0000";

   -- Clock period definitions
   constant Clk_period : time := 100 ns;
	
	type VECTOR is array (19 downto 0) of STD_LOGIC_VECTOR (7 downto 0);
	signal input: VECTOR := (X"15", X"1D", X"24", X"23", X"1C", X"2D", X"35",
	X"15", X"1D", X"24", X"23", X"1C", X"2D",  X"23", X"1C", X"2D", X"35", X"15", X"1D", X"24");
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ps2_lock PORT MAP (
          DO => DO,
          F0 => F0,
          DO_Rdy => DO_Rdy,
          Clk => Clk,
          Reset => Reset,
          y => y,
			 TxStart => TxStart,
			 TxDI => TxDI,
			 COUNTER => COUNTER
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
      for i in input'high downto 0 loop
			DO <= input(i);
			F0 <= '0';
			
			DO_Rdy <= '1';
			wait for Clk_period;
			
			DO_Rdy <= '0';
			wait for Clk_period * 2;
			
			F0 <= '1';
			DO_Rdy <= '1';
			wait for Clk_period;
			
			DO_Rdy <= '0';
			wait for Clk_period * 4;
		end loop;

      wait;
   end process;

END;
