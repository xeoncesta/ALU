----------------------------------------------------------------------------------
--Amitesh 24/EC/14
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity fh is
port (
       x:in std_logic;
       y:in std_logic;
       z:in std_logic;
       s:out std_logic;
       c:out std_logic		 
		);
end ;
architecture structural of fh is
begin
s<= (x xor y xor z);
c<= (x xor y) or (x and y);
end structural;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity mux4x1 is
port(
     i0:in std_logic;
     i1:in std_logic;
     i2:in std_logic;
     i3:in std_logic;
s0:in std_logic;
s1:in std_logic;
     o0:out std_logic
     );
	 end;
architecture structural of mux4x1 is
signal temp1,temp2,temp3,temp4:std_logic;
begin
temp1<=(s0 nand s1)and i0;
temp2<=(s0 and (not(s1)))and i1;
temp3<=((not(s0))and s1 and i2);
temp4<=(s0 and s1 and i3);
o0<=temp1 or temp2 or temp3 or temp4;
end structural;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity alu is
    Port ( 
	        cin:in std_logic;
			  sel0 : in  STD_LOGIC;
           sel1 : in  STD_LOGIC;
           a0 : in  STD_LOGIC;
           a1 : in  STD_LOGIC;
           a2 : in  STD_LOGIC;
           a3 : in  STD_LOGIC;
           b0 : in  STD_LOGIC;
           b1 : in  STD_LOGIC;
           b2 : in  STD_LOGIC;
           b3 : in  STD_LOGIC;
           o0 : out  STD_LOGIC;
           o1 : out  STD_LOGIC;
           o2 : out  STD_LOGIC;
           o3 : out STD_LOGIC
			  );
end alu;

architecture structural of alu is
component mux4x1 is
port(
     i0:in std_logic;
     i1:in std_logic;
     i2:in std_logic;
     i3:in std_logic;
s0:in std_logic;
s1:in std_logic;
     o0:out std_logic
     );
	 end component;
component fh is
port (
       x:in std_logic;
       y:in std_logic;
       z:in std_logic;
       s:out std_logic;
       c:out std_logic		 
		);
end component;
signal t1,t2,t3,t4,ct0,ct1,ct2,ct3:std_logic;
begin

st1: mux4x1 port map(not(b0),'1','0',not(a0),sel0,sel1,t1);
st2: mux4x1 port map(not(b1),'1','0',not(a1),sel0,sel1,t2);
st3: mux4x1 port map(not(b2),'1','0',not(a2),sel0,sel1,t3);
st4: mux4x1 port map(not(b3),'1','0',not(a3),sel0,sel1,t4);
ft1:fh port map(a0,t1,cin,o0,ct0);
ft2:fh port map(a1,t2,ct0,o1,ct1);
ft3:fh port map(a2,t3,ct1,o2,ct2);
ft4:fh port map(a3,t4,ct2,o3,ct3);


end structural;

