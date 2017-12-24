library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;


entity Core is
	port(
		fx:in STD_logic;   								 		--mierzony sygnal		 
		fautomat: in STD_LOGIC;	
		CLR:in STD_LOGIC;
		CE:inout STD_LOGIC:='0'; 
		LE:in STD_LOGIC;
		Yx:inout STD_LOGIC_vector(2 downto 0) := "000";
		Yautomat: inout STD_LOGIC;  		 			 		--GATE/CE dla liczników
		Y:inout STD_LOGIC_vector(3 downto 0) := "0000";	 		--wyjscie licznikow dekadowych	
		Ylatch:inout STD_LOGIC_VECTOR(3 downto 0) := "0000"; 		--wyjscie z zatrzasku
		CLK:in STD_logic
		);	   
end Core;




architecture Core of Core is
signal Ylicznik: std_logic_vector(3 downto 0) := "0000";
signal clka: std_logic_vector(2 downto 0) := "000";
signal laciek: std_logic_vector(3 downto 0) := "0000";
begin 				
	 --LICZNIK DEKADOWY
	process (CLK, CLR)											--liczniki dekadowe
	begin
		if CLR='1' then   										--asynch res
			Ylicznik<=(others => '0');
		elsif CLK'event and CLK = '1' then	    				--narastajace zbocze clk
			if CE = '1' then
				Ylicznik<=Ylicznik +1;		
					if Ylicznik="1010" then
						Ylicznik<="0000"; 
					end if ;
			end if;
		end if ;		
	end process;
	Y<=Ylicznik;
	
	--AUTOMAT GENERUJACY GATE	
	process (CLK)
	begin  	
		if(clka="100") then
			CE<='1';			
		end if;	  
		
		if(clka="000") then
			CE<='0';
		end if;	
		
		if (clka="111") then
			clka<="000"	 ;
		end if;	
				  				--gdy CE wylaczony, zlicza 8 zboczy CLK
   	clka<=clka+1; 
	end process; 	
	Yx<=clka;
	
	--ZATRZASK	  
	--ZATRZASKUJE WARTOSC LICZNIKA, GDY GATE SIE KONCZY
	process(LE,Ylicznik)
	begin
		if CLR='1' then
			laciek<="0000";
		elsif LE='1' then	
	 		laciek<=Ylicznik;
		end if;
	end process;	
	Ylatch<=laciek;	  
	
	
	
end Core;





