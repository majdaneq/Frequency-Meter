library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;


entity Dec_Counter2 is
	port(
		GATEIN:in STD_LOGIC:='0'; 								--GATE 1 licznika
		GATEIN2: in STD_LOGIC:='0';
		GATEOUT: inout STD_LOGIC:='0';
		Y:inout STD_LOGIC_vector(3 downto 0) := "0000";	 		--wyjscie 1. licznika dekad. 
		fx:in STD_logic;  		 		
		CLR:in STD_LOGIC
		);	   
end Dec_Counter2;




architecture Dec_Counter2 of Dec_Counter2 is
signal Ylicznik: std_logic_vector(3 downto 0) := "0000";
signal Gate_out: std_logic:='0';	
signal Count : boolean := true;
begin 				
	 --LICZNIK DEKADOWY
	process (fx, CLR)											--liczniki dekadowe
	begin
		if CLR='1' then   										--asynch res
			GATEOUT<='0';
			Ylicznik<=(others => '0'); 
			
		elsif fx'event and fx = '1' then	    				--narastajace zbocze fx
			if GATEIN = '1' then 								-- automat dziala 
				if GATEIN2='1' then								-- 1. licznik przepelniony
					Ylicznik<=Ylicznik +1; 
					GATEOUT<='0';
					if Ylicznik="1001" then
						Ylicznik<="0000";						--zerowanie	
						GATEOUT<='1';
					end if;						
				end if;	
			else Ylicznik<="0000";
			end if;	
		
		end if ;
		
	end process;   	
	Y<=Ylicznik;	
	
	--with Y select GATEOUT<=
	--'1' when "0000"	,
--	'0' when others;
end Dec_Counter2;





