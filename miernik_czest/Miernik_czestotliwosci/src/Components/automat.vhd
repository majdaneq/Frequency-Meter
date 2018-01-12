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
	
	signal clka: std_logic_vector(2 downto 0) := "000";		   --zlicza clk
	signal Gate_t:std_LOGIC; 
	signal laciek:std_logic;
begin 				
	--AUTOMAT GENERUJACY GATE	
	process (CLK)
	begin  	
		if(clka="100") then
			GATE_t<='1'; 					 --otwarcie gate dla licznika
			
		end if;	  
		
		if(clka="000") then
			GATE_t<='0';							 --zamyka gate
			LE<='0';								 --zamyka le
		end if;	
		
		if (clka="111") then
			clka<="000"	 ; 								--zerowanie clk
			LE<='1';						 			--otwiera 	le
			
		end if;	
												 --gdy GATE wylaczony, zlicza 13 zboczy CLK
		clka<=clka+1; 							 --inkrementacja z kazdym clk
		
		
	end process; 
	--LE<=laciek;
	
	GATE<=Gate_t;
	
	
end automat;





