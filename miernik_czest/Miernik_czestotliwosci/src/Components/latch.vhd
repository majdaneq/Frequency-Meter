library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;


entity latch is
	port(	  
		LE:in STD_LOGIC:='0'; 
		CLR:in STD_LOGIC:='0';	
		Ylatch:out STD_LOGIC_vector(3 downto 0):= "0000";  	
		Ylicznik:in STD_LOGIC_vector(3 downto 0) := "0000" 
		);	   
end latch;




architecture latch of latch is
	
	signal le_signal: std_logic_vector(3 downto 0) := "0000";
	signal Gate_t:std_LOGIC; 
	
begin
	--ZATRZASK	  
	--ZATRZASKUJE WARTOSC LICZNIKA, GDY GATE SIE KONCZY
	process(LE,Ylicznik)
	begin
		if CLR='1' then
			Ylatch<="0000";
		elsif LE='1' then	
			Ylatch<=Ylicznik;							   --zatrzaskuje, gdy LE=1
		end if;
	end process;	
	--	Ylatch<=laciek;	 
	
	
end latch;





