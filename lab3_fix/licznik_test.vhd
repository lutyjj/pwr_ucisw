-- Vhdl test bench created from schematic E:\Programming\XilinxPrj\lab3_fix\licznik_1235467.sch - Wed Nov 11 20:44:12 2020
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
ENTITY licznik_1235467_licznik_1235467_sch_tb IS
END licznik_1235467_licznik_1235467_sch_tb;
ARCHITECTURE behavioral OF licznik_1235467_licznik_1235467_sch_tb IS 

   COMPONENT licznik_1235467
   PORT( CE	:	IN	STD_LOGIC; 
          CLK	:	IN	STD_LOGIC; 
          CLR	:	IN	STD_LOGIC; 
          Q	:	OUT	STD_LOGIC_VECTOR (2 DOWNTO 0));
   END COMPONENT;

   SIGNAL CE	:	STD_LOGIC := '1';
   SIGNAL CLK	:	STD_LOGIC := '0';
   SIGNAL CLR	:	STD_LOGIC := '0';
   SIGNAL Q	:	STD_LOGIC_VECTOR (2 DOWNTO 0);

BEGIN

   UUT: licznik_1235467 PORT MAP(
		CE => CE, 
		CLK => CLK, 
		CLR => CLR, 
		Q => Q
   );

	CLK<= not CLK after 50 ns;
END;