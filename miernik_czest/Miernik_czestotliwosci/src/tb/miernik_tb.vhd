																				library ieee;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity miernik_tb is
end miernik_tb;

architecture TB_ARCHITECTURE of miernik_tb is
	-- Component declaration of the tested unit
	component top
	port(	
		GATE:inout STD_LOGIC:='0';
		GATEOUT:inout STD_LOGIC:='0'; 
		--GATEOUT2:out STD_LOGIC:='0'; 
		--CEO:out STD_LOGIC;
		Y1:inout STD_LOGIC_vector(3 downto 0) := "0000";	 		--wyjscie licznikow dekadowych	
		Y2:inout STD_LOGIC_vector(3 downto 0) := "0000";
		Y3:inout STD_LOGIC_vector(3 downto 0) := "0000";
		--Ylatch1:out STD_LOGIC_vector(3 downto 0);	 		--wyjscie licznikow dekadowych	
		--Ylatch2:out STD_LOGIC_vector(3 downto 0);
		--Ylatch3:out STD_LOGIC_vector(3 downto 0); 
		Y:out STD_LOGIC_vector(6 downto 0):="0000000";	   
		--Ycode2:out STD_LOGIC_vector(6 downto 0):="0000000";
		--Ycode3:out STD_LOGIC_vector(6 downto 0):="0000000";
		fx:in STD_logic:='0';
		LE:inout STD_LOGIC:='0';
		CLK:in STD_LOGIC;
		CLR:in STD_LOGIC  
		
		); 									
	end component; 

	
	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	--signal SEL: STD_LOGIC;
	signal fx: STD_LOGIC;
	signal CLR: STD_LOGIC;
	signal GATE : STD_LOGIC;   		
	signal CLK : STD_LOGIC;	 
	--signal CEO: STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal Y1 : STD_LOGIC_VECTOR(3 downto 0);	  
	signal Y2 : STD_LOGIC_VECTOR(3 downto 0);
	signal Y3 : STD_LOGIC_VECTOR(3 downto 0);  
	signal Y : STD_LOGIC_VECTOR(6 downto 0);	  
	--signal Ycode2 : STD_LOGIC_VECTOR(6 downto 0);
	--signal Ycode3 : STD_LOGIC_VECTOR(6 downto 0); 
	--signal Ylatch1 : STD_LOGIC_VECTOR(3 downto 0);	  
	--signal Ylatch2 : STD_LOGIC_VECTOR(3 downto 0);
	--signal Ylatch3 : STD_LOGIC_VECTOR(3 downto 0);	
	signal LE : STD_LOGIC;
	signal GATEOUT : STD_LOGIC; 
	--signal GATEOUT2 : STD_LOGIC; 
	--Signal is used to stop clock signal generators
	signal END_SIM: BOOLEAN:=FALSE;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : top
	port map ( 
			CLK=>CLK,
			fx=>fx,	
			--CEO=>CEO,
			CLR=>CLR,
			GATE=>GATE,	 
			LE=>LE,
			GATEOUT=>GATEOUT,	
			--Ylatch1 => Ylatch1,
			--Ylatch2 => Ylatch2,
			--Ylatch3 => Ylatch3,	
			Y => Y,
		--	Ycode2 => Ycode2,
		--	Ycode3 => Ycode3,
			Y1 => Y1,
			Y2 => Y2,
			Y3 => Y3	 			
		); 
		
		
	--Below VHDL code is an inserted .\compile\Initial.vhs
	--User can modify it ....

STIMULUS: process
begin  -- of stimulus process
--wait for <time to next event>; -- <current time> 
--CE<='1';	
--	-GATE<='0';	  
wait for 20 ns;
CLR<='0'; 	  

	wait for 100 ns;
--	GATE<='1';
	wait for 100 ns;
	--CLR<='1';
	wait for 100 ns;
	CLR<='0';		   
	wait for 530 ns; --830 ns - dzialanie res
	--CLR<='1';
	wait for 30 ns;
	CLR<='0';
	--GATE<='1';
	
	wait for 2000 ns;
   	END_SIM <= TRUE;
	
	
--	end of stimulus events
	wait;
end process; -- end of stimulus process
	
fx_CLK : process
begin
	--this process was generated based on formula: 0 0 ns, 1 50 ns -r 100 ns
	--wait for <time to next event>; -- <current time>
	if END_SIM = FALSE then
		fx <= '0';
		wait for 1 ns; --0 fs
	else
		wait;
	end if;
	if END_SIM = FALSE then
		fx<= '1';
		wait for 1 ns; --50 ns
	else
		wait;
	end if;
end process;  

CLOCK_CLK : process
begin
	--this process was generated based on formula: 0 0 ns, 1 50 ns -r 100 ns
	--wait for <time to next event>; -- <current time>
	if END_SIM = FALSE then
		CLK <= '0';
		wait for 32 ns; --0 fs
	else
		wait;
	end if;
	if END_SIM = FALSE then
		CLK<= '1';
		wait for 32 ns; --50 ns
	else
		wait;
	end if;
end process;




	-- Add your stimulus here ...

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_top of miernik_tb is
	for TB_ARCHITECTURE
		for UUT : top
			use entity work.top(top);
		end for;
	end for;
end TESTBENCH_FOR_top;

