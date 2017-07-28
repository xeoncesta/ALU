--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:09:33 11/05/2016
-- Design Name:   
-- Module Name:   D:/labexam/tb_exam.vhd
-- Project Name:  labexam
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: alu
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
 
ENTITY tb_exam IS
END tb_exam;
 
ARCHITECTURE behavior OF tb_exam IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT alu
    PORT(
         cin : IN  std_logic;
         sel0 : IN  std_logic;
         sel1 : IN  std_logic;
         a0 : IN  std_logic;
         a1 : IN  std_logic;
         a2 : IN  std_logic;
         a3 : IN  std_logic;
         b0 : IN  std_logic;
         b1 : IN  std_logic;
         b2 : IN  std_logic;
         b3 : IN  std_logic;
         o0 : OUT  std_logic;
         o1 : OUT  std_logic;
         o2 : OUT  std_logic;
         o3 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal cin : std_logic := '0';
   signal sel0 : std_logic := '0';
   signal sel1 : std_logic := '0';
   signal a0 : std_logic := '0';
   signal a1 : std_logic := '0';
   signal a2 : std_logic := '0';
   signal a3 : std_logic := '0';
   signal b0 : std_logic := '0';
   signal b1 : std_logic := '0';
   signal b2 : std_logic := '0';
   signal b3 : std_logic := '0';

 	--Outputs
   signal o0 : std_logic;
   signal o1 : std_logic;
   signal o2 : std_logic;
   signal o3 : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: alu PORT MAP (
          cin => cin,
          sel0 => sel0,
          sel1 => sel1,
          a0 => a0,
          a1 => a1,
          a2 => a2,
          a3 => a3,
          b0 => b0,
          b1 => b1,
          b2 => b2,
          b3 => b3,
          o0 => o0,
          o1 => o1,
          o2 => o2,
          o3 => o3
        );

   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
-- 

   -- Stimulus process
   stim_proc: process
   begin		
     wait for 50 ns;
	  a0<='1';
	  a1<='0';
	  a2<='1';
	  a3<='0';
	  cin<='1';
	  b0<='0';
	  b1<='0';
	  b2<='1';
	  b3<='0';
	  --wait for 50 ns;
	  --A-B:
	  sel0<='0';
	  sel1<='0';
	  --A-1:
	  wait for 50 ns;
	  b0<='1';
	  b1<='0';
	  b2<='0';
	  b3<='0';
	  sel0<='0';
	  sel1<='0';
	  wait for 50 ns;
	  
	  -- -A=not a +1;
	  a0<='1';
	  a1<='0';
	  a2<='0';
	  a3<='0';
	  cin<='0';
	  sel0<='1';
	  sel1<='1';
	  wait for 50 ns;
	  -- not a;
	  a0<='0';
	  a1<='0';
	  a2<='0';
	  a3<='0';
	  cin<='0';
	  sel0<='1';
	  sel1<='1';
	  
	  end process;

END;
