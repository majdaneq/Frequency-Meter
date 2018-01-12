library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;


entity Dec_Counters is
	port(
		GATEIN:in STD_LOGIC:='0'; 								--GATE 1 licznika
		GATEOUT: out STD_LOGIC:='0';
		Y:inout STD_LOGIC_vector(3 downto 0) := "0000";	 		--wyjscie 1. licznika dekad. 
		fx:in STD_logic;
		CLR:in STD_LOGIC
		);	   
end Dec_Counters;




architecture Dec_Counters of Dec_Counters is
	signal Ylicznik: std_logic_vector(3 downto 0) := "0000";
	signal Gate_out: std_logic:='0';
begin 				
	--LICZNIK DEKADOWY
	process (fx, CLR)											--liczniki dekadowe
	begin
		if CLR='1' then   										--asynch res
			Ylicznik<=(others => '0'); 
			GATE_OUT<='0';
		elsif fx'event and fx = '1' then	    				--narastajace zbocze fx
			if GATEIN = '1' then
				Ylicznik<=Ylicznik +1;							--zliczanie
				gate_out<='0';									--wylaczenie nast licznika 
				if Ylicznik="1000" then	
					Gate_out<='1';							  	--uruchomienie nast licznika 1
					Ylicznik<="1001"; 						  	
				end if ; 
				if Ylicznik="1001" then
					Ylicznik<="0000";							--zerowanie licznika gdy 9
					gate_out<='0';								--wylaczenie nast licznika 
				end if;
			else Ylicznik<="0000";
			end if;
		end if ;		
	end process;
	Y<=Ylicznik;	
	GATEOUT<=Gate_out;
	
end Dec_Counters;





