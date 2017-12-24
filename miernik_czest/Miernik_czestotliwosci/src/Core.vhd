library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;


entity Core is
	port(
		fx:in STD_logic;   					 --mierzony sygnal		 
		fautomat: in STD_LOGIC;	
		CLR:in STD_LOGIC;
		CE:in STD_LOGIC;  		
		Yautomat: inout STD_LOGIC;  		 	--GATE/CE dla liczników
		Y:inout STD_LOGIC_vector(3 downto 0) := "0000";	 --wyjscie licznikow dekadowych
		CLK:in STD_logic
		);	   
end Core;




architecture Core of Core is
	signal Ylicznik: std_logic_vector(3 downto 0) := "0000";  
begin 				

	process (CLK, CLR)											  --liczniki dekadowe
	begin
		if CLR='1' then   						--asynch res
			Ylicznik<=(others => '0');
		elsif CLK'event and CLK = '1' then	    --narastajace zbocze clk
			if CE = '1' then
				Ylicznik<=Ylicznik +1;		
					if Ylicznik="1010" then
						Ylicznik<="0000"; 
					end if ;
			end if;
		end if ;		
	end process;
		 Y<=Ylicznik;
	process (fautomat)
	begin
		if(Yautomat='0') then	 
			
		end if;
		
	end process;
	
	
end Core;





