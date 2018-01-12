library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;


entity segcode is
	port(
	Ylatch:in STD_LOGIC_vector(3 downto 0); 
	Ycode:out STD_LOGIC_vector(6 downto 0) :="0000000";
		CLR:in STD_LOGIC
		);	   
end segcode;




architecture segcode of segcode is	  
begin 
	
	with Ylatch select Ycode <=	  
	 "0111111" when "0000", -- 0
 	 "0000110" when "0001", -- 1
	 "1011011" when "0010", -- 2
	 "1001111" when "0011", -- 3
	 "1100110" when "0100", -- 4
 	 "1101101" when "0101", -- 5
  	 "1111101" when "0110", -- 6
     "0000111" when "0111", -- 7
 	 "1111111" when "1000", -- 8
 	 "1101111" when "1001", -- 9
	 "0000000" when others; -- wygaszenie
 

end segcode;
