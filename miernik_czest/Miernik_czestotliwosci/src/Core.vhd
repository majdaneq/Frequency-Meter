library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;


entity Core is
	port(
	fx:in STD_logic;   					 --mierzony sygnal		 
	fautomat: in STD_LOGIC;	
	CLR:in STD_LOGIC;
	CE:in STD_LOGIC;   
	Yautomat: inout STD_LOGIC;  		 --GATE/CE dla liczników
	Y:out STD_LOGIC_vector(2 downto 0);	 --wyjscie licznikow dekadowych
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
			
			end if;
		end if ;		
	end process;
	
	process (fautomat)
	begin
	
	end process;
	
	
end Core;





