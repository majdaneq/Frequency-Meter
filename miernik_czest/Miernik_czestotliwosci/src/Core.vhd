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
		Y:inout STD_LOGIC_vector(2 downto 0) := "000";	 --wyjscie licznikow dekadowych
		CLK:in STD_logic
		);	   
end Core;



architecture Core of Core is
	signal DIVIDER: std_logic_vector(8 downto 0);  
begin 				
	
	process (CLK, CLR)											  --liczniki dekadowe
	begin
		if CLR='1' then   						--asynch res
			Y<=(others => '0');
		elsif CLK'event and CLK = '1' then	    --narastajace zbocze clk
			if CE = '1' then
				if Y="000" then Y<="001"; end if;  
				if Y="001" then Y<="010"; end if; 
				if Y="010" then Y<="011"; end if;
				if Y="011" then Y<="100"; end if;
				if Y="100" then Y<="101"; end if;
				if Y="101" then Y<="110"; end if;
				if Y="110" then Y<="111"; end if;
				if Y="111" then Y<="000"; end if;
					
				
			end if;
		end if ;		
	end process;
	
	process (fautomat)
	begin
		if(Yautomat='0') then	 
			
		end if;
		
	end process;
	
	
end Core;





