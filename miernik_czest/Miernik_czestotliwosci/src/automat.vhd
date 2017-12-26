library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;


entity automat is
	port(
		GATE:inout STD_LOGIC:='0'; 
		LE:inout STD_LOGIC:= '0';
		CLK:in STD_logic
		);	   
end automat;




architecture automat of automat is

signal clka: std_logic_vector(2 downto 0) := "000";
signal Gate_t:std_LOGIC; 
signal laciek:std_logic;
begin 				
	--AUTOMAT GENERUJACY GATE	
	process (CLK)
	begin  	
		if(clka="100") then
			GATE_t<='1'; 
			laciek<='1';
		end if;	  
		
		if(clka="000") then
			GATE_t<='0';
			laciek<='0';
		end if;	
		
		if (clka="111") then
			clka<="000"	 ; 
			
		end if;	
				 				--gdy GATE wylaczony, zlicza 13 zboczy CLK
   	clka<=clka+1; 
	   		   
	   
	end process; 
	LE<=laciek;
	
	GATE<=Gate_t;
	

end automat;





