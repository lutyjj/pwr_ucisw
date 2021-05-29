-- Vhdl test bench created from schematic E:\Programming\XilinxPrj\lab5\zad3.sch - Tue Dec 08 21:13:05 2020
--
-- Notes: 
-- 1) This testbench template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the unit under test.
-- Xilinx recommends that these types always be used for the top-level
-- I/O of a design in order to guarantee that the testbench will bind
-- correctly to the timing (post-route) simulation model.
-- 2) To use this template as your testbench, change the filename to any
-- name of your choice with the extension .vhd, and use the "Source->Add"
-- menu in Project Navigator to import the testbench. Then
-- edit the user defined section below, adding code to generate the 
-- stimulus for your design.
--
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;
ENTITY zad3_zad3_sch_tb IS
END zad3_zad3_sch_tb;
ARCHITECTURE behavioral OF zad3_zad3_sch_tb IS 

   COMPONENT zad3
   PORT( XIN	:	IN	STD_LOGIC; 
          Y1	:	OUT	STD_LOGIC; 
          Y2	:	OUT	STD_LOGIC; 
          CLK	:	IN	STD_LOGIC);
   END COMPONENT;

   SIGNAL XIN	:	STD_LOGIC := '0';
   SIGNAL Y1	:	STD_LOGIC;
   SIGNAL Y2	:	STD_LOGIC;
   SIGNAL CLK	:	STD_LOGIC;
	SIGNAL Xinput : std_logic_vector(20 downto 0) := "001100111010100110011";
	CONSTANT Clk_period : time := 10 ns;

BEGIN

   UUT: zad3 PORT MAP(
		XIN => XIN, 
		Y1 => Y1, 
		Y2 => Y2, 
		CLK => CLK
   );

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
      for i in Xinput'high downto 0 loop
			XIN <= Xinput(i);
			wait for CLK_period;
		end loop;

      wait;
   end process;

END;
