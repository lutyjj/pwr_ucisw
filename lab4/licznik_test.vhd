LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY licznik_test IS
END licznik_test;
 
ARCHITECTURE behavior OF licznik_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT licznik
    PORT(
         DIR : IN  std_logic;
         Q : OUT  std_logic_vector(2 downto 0);
         Clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal DIR : std_logic := '0';
   signal Clk : std_logic := '0';

 	--Outputs
   signal Q : std_logic_vector(2 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 50 ns;
 
BEGIN
 
   uut: licznik PORT MAP (
          DIR => DIR,
          Q => Q,
          Clk => Clk
        );

   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 
   stim_proc: process
   begin
		DIR <= '0';
      wait for Clk_period*10;
		DIR <= '1';
      wait for Clk_period*10;
      wait;
   end process;

END;