					   library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;


entity Dec_Counter3 is
	port(
		GATEIN:in STD_LOGIC:='0'; 								--GATE 1 licznika
		GATEIN2: in STD_LOGIC:='0';	
		Y:inout STD_LOGIC_vector(3 downto 0) := "0000";	 		--wyjscie 1. licznika dekad. 
		fx:in STD_logic;  		 		
		CLR:in STD_LOGIC
		);	   
end Dec_Counter3;




architecture Dec_Counter3 of Dec_Counter3 is
signal Ylicznik: std_logic_vector(3 downto 0) := "0000"; 	
signal Count : boolean := true;
begin 				
	 --LICZNIK DEKADOWY
	process (GATEIN2, CLR)											--liczniki dekadowe
	begin
		if CLR='1' then   										--asynch res
			Ylicznik<=(others => '0');		
			elsif GATEIN='1' then 										--automat dziala
					if GATEIN2='1' then							--2gi licznik przepelniony
						Ylicznik<=Ylicznik+1;
							if Ylicznik="1001" then
								Ylicznik<="0000";
							end if ;
					else Ylicznik<="0000";
					end if;	
			elsif GATEIN='0' then  Ylicznik<="0000";		
		
		end if;
		
			
	end process;
	Y<=Ylicznik;	


end Dec_Counter3;





