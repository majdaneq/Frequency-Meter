library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;


entity Mux is
	port(	
		
		Y:out STD_LOGIC_vector(3 downto 0) := "0000";			--wyjscie
		X1:in STD_LOGIC_vector(3 downto 0) := "0000";	 		--wejscie 1. mux
		X2:in STD_LOGIC_vector(3 downto 0) := "0000";	 		--wejscie 2. mux 
		X3:in STD_LOGIC_vector(3 downto 0) := "0000";	 		--wejscie 3. mux 
		CLK: in STD_LOGIC										--select
		);	   
end Mux;




architecture Mux of Mux is
signal Yx: std_logic_vector(3 downto 0) := "0000";
signal mux: integer range 0 to 4 := 0;
begin 				
	--MUX
	process (CLK)											
	begin	
		if mux =0 then 
			Yx<=X1;
		end if;
		
		if mux = 1 then 
			Yx<=X2;
		end if;
		
		if mux =2 then 
			yx<=X3;
			end if;
				
		mux<=mux+1;
		
		if mux=3  then
			mux<=0;
		end if;	 
				if mux=4 then
			mux<=0;
		end if;	
	end process; 	
	  Y<=yx;
end Mux;





