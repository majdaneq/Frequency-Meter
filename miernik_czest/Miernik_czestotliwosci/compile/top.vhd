-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : Miernik_czestotliwosci
-- Author      : szymonbortel8@gmail.com
-- Company     : agh
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\szymo\Desktop\PSC_Projekt\miernik_czest\Miernik_czestotliwosci\compile\top.vhd
-- Generated   : Tue Jan 16 22:35:57 2018
-- From        : C:\Users\szymo\Desktop\PSC_Projekt\miernik_czest\Miernik_czestotliwosci\src\tb\top.bde
-- By          : Bde2Vhdl ver. 2.6
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------
-- Design unit header --
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_signed.all;
use IEEE.std_logic_unsigned.all;


entity top is
  port(
       CLK : in STD_LOGIC;
       CLR : in STD_LOGIC;
       fx : in STD_LOGIC;
       Y : out STD_LOGIC_VECTOR(6 downto 0);
       GATE : inout STD_LOGIC;
       GATEOUT : inout STD_LOGIC;
       LE : inout STD_LOGIC;
       Y1 : inout STD_LOGIC_VECTOR(3 downto 0);
       Y2 : inout STD_LOGIC_VECTOR(3 downto 0);
       Y3 : inout STD_LOGIC_VECTOR(3 downto 0)
  );
end top;

architecture top of top is

---- Component declarations -----

component automat
  port (
       CLK : in STD_LOGIC;
       GATE : inout STD_LOGIC := '0';
       LE : inout STD_LOGIC := '0'
  );
end component;
component Dec_Counter2
  port (
       CLR : in STD_LOGIC;
       GATEIN : in STD_LOGIC := '0';
       GATEIN2 : in STD_LOGIC := '0';
       fx : in STD_LOGIC;
       GATEOUT : inout STD_LOGIC := '0';
       Y : inout STD_LOGIC_VECTOR(3 downto 0) := "0000"
  );
end component;
component Dec_Counter3
  port (
       CLR : in STD_LOGIC;
       GATEIN : in STD_LOGIC := '0';
       GATEIN2 : in STD_LOGIC := '0';
       fx : in STD_LOGIC;
       Y : inout STD_LOGIC_VECTOR(3 downto 0) := "0000"
  );
end component;
component Dec_Counters
  port (
       CLR : in STD_LOGIC;
       GATEIN : in STD_LOGIC := '0';
       fx : in STD_LOGIC;
       GATEOUT : out STD_LOGIC := '0';
       Y : inout STD_LOGIC_VECTOR(3 downto 0) := "0000"
  );
end component;
component latch
  port (
       CLR : in STD_LOGIC := '0';
       LE : in STD_LOGIC := '0';
       Ylicznik : in STD_LOGIC_VECTOR(3 downto 0) := "0000";
       Ylatch : out STD_LOGIC_VECTOR(3 downto 0) := "0000"
  );
end component;
component segcode
  port (
       CLR : in STD_LOGIC;
       Ylatch : in STD_LOGIC_VECTOR(3 downto 0) := "0000";
       Ycode : out STD_LOGIC_VECTOR(6 downto 0) := "0000000"
  );
end component;
component Mux
  port (
       CLK : in STD_LOGIC;
       X1 : in STD_LOGIC_VECTOR(3 downto 0) := "0000";
       X2 : in STD_LOGIC_VECTOR(3 downto 0) := "0000";
       X3 : in STD_LOGIC_VECTOR(3 downto 0) := "0000";
       Y : out STD_LOGIC_VECTOR(3 downto 0) := "0000"
  );
end component;
component Prescaler
  port (
       CLK : in STD_LOGIC;
       CLR : in STD_LOGIC;
       CEO : out STD_LOGIC
  );
end component;

---- Signal declarations used on the diagram ----

signal GATE1252 : STD_LOGIC;
signal GATE84 : STD_LOGIC;
signal BUS3244 : STD_LOGIC_VECTOR(3 downto 0);
signal BusOutput1 : STD_LOGIC_VECTOR(7 downto 0);
signal BusOutput2 : STD_LOGIC_VECTOR(7 downto 0);
signal BusOutput3 : STD_LOGIC_VECTOR(7 downto 0);

begin

----  Component instantiations  ----

U1 : automat
  port map(
       CLK => GATE1252,
       GATE => GATE,
       LE => LE
  );

U10 : segcode
  port map(
       CLR => CLR,
       Ycode => Y,
       Ylatch => BUS3244
  );

U11 : Mux
  port map(
       CLK => CLK,
       X1(0) => BusOutput3(4),
       X1(1) => BusOutput3(5),
       X1(2) => BusOutput3(6),
       X1(3) => BusOutput3(7),
       X2(0) => BusOutput1(4),
       X2(1) => BusOutput1(5),
       X2(2) => BusOutput1(6),
       X2(3) => BusOutput1(7),
       X3(0) => BusOutput2(4),
       X3(1) => BusOutput2(5),
       X3(2) => BusOutput2(6),
       X3(3) => BusOutput2(7),
       Y => BUS3244
  );

U12 : Prescaler
  port map(
       CLK => GATE1252,
       CLR => CLR
  );

U2 : Dec_Counters
  port map(
       CLR => CLR,
       GATEIN => GATE,
       GATEOUT => GATE84,
       Y => Y1,
       fx => fx
  );

U3 : Dec_Counter2
  port map(
       CLR => CLR,
       GATEIN => GATE,
       GATEIN2 => GATE84,
       GATEOUT => GATEOUT,
       Y => Y2,
       fx => fx
  );

U5 : latch
  port map(
       CLR => CLR,
       LE => LE,
       Ylatch(0) => BusOutput1(4),
       Ylatch(1) => BusOutput1(5),
       Ylatch(2) => BusOutput1(6),
       Ylatch(3) => BusOutput1(7),
       Ylicznik => Y1
  );

U6 : latch
  port map(
       CLR => CLR,
       LE => LE,
       Ylatch(0) => BusOutput2(4),
       Ylatch(1) => BusOutput2(5),
       Ylatch(2) => BusOutput2(6),
       Ylatch(3) => BusOutput2(7),
       Ylicznik => Y2
  );

U7 : latch
  port map(
       CLR => CLR,
       LE => LE,
       Ylatch(0) => BusOutput3(4),
       Ylatch(1) => BusOutput3(5),
       Ylatch(2) => BusOutput3(6),
       Ylatch(3) => BusOutput3(7),
       Ylicznik => Y3
  );

U8 : Dec_Counter3
  port map(
       CLR => CLR,
       GATEIN => GATE,
       GATEIN2 => GATEOUT,
       Y => Y3,
       fx => fx
  );


---- Terminal assignment ----

    -- Inputs terminals
	GATE1252 <= CLK;


end top;
