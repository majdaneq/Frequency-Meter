-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : Miernik_czestotliwosci
-- Author      : szymonbortel8@gmail.com
-- Company     : agh
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\szymo\Desktop\PSC_Projekt\miernik_czest\Miernik_czestotliwosci\compile\miernik_czest.vhd
-- Generated   : Mon Dec 25 17:21:55 2017
-- From        : C:\Users\szymo\Desktop\PSC_Projekt\miernik_czest\Miernik_czestotliwosci\src\miernik_czest.bde
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


entity miernik_czest is
  port(
       CLK : in STD_LOGIC;
       CLR : in STD_LOGIC;
       fx : in STD_LOGIC;
       Ylatch1 : out STD_LOGIC_VECTOR(3 downto 0);
       Ylatch2 : out STD_LOGIC_VECTOR(3 downto 0);
       Ylatch3 : out STD_LOGIC_VECTOR(3 downto 0);
       Y1 : inout STD_LOGIC_VECTOR(3 downto 0);
       Y2 : inout STD_LOGIC_VECTOR(3 downto 0);
       Y3 : inout STD_LOGIC_VECTOR(3 downto 0)
  );
end miernik_czest;

architecture miernik_czest of miernik_czest is

---- Component declarations -----

component Dec_Counters
  port (
       CLR : in STD_LOGIC;
       GATE : in STD_LOGIC := '0';
       fx : in STD_LOGIC;
       GATEOUT : out STD_LOGIC := '0';
       Y : inout STD_LOGIC_VECTOR(3 downto 0) := "0000"
  );
end component;
component Fub6
  port (
       CLR : in STD_LOGIC;
       GATE : in STD_LOGIC := '0';
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
component automat
  port (
       CLK : in STD_LOGIC;
       LE : out STD_LOGIC := '0';
       GATE : inout STD_LOGIC := '0'
  );
end component;

----     Constants     -----
constant DANGLING_INPUT_CONSTANT : STD_LOGIC := 'Z';

---- Signal declarations used on the diagram ----

signal GATE122 : STD_LOGIC;
signal GATE165 : STD_LOGIC;
signal GATE2034 : STD_LOGIC;
signal GATE214 : STD_LOGIC;
signal NET295 : STD_LOGIC;

---- Declaration for Dangling input ----
signal Dangling_Input_Signal : STD_LOGIC;

begin

----  Component instantiations  ----

U1 : Dec_Counters
  port map(
       CLR => Dangling_Input_Signal,
       GATE => GATE2034,
       GATEOUT => GATE122,
       Y => Y1,
       fx => fx
  );

U24 : automat
  port map(
       CLK => CLK,
       GATE => GATE2034,
       LE => GATE214
  );

U26 : latch
  port map(
       CLR => NET295,
       LE => GATE214,
       Ylatch => Ylatch2,
       Ylicznik => Y2
  );

U29 : latch
  port map(
       CLR => NET295,
       LE => GATE214,
       Ylatch => Ylatch1,
       Ylicznik => Y1
  );

U33 : latch
  port map(
       CLR => NET295,
       LE => GATE214,
       Ylicznik => Y3
  );

U5 : Dec_Counters
  port map(
       CLR => NET295,
       GATE => GATE165,
       Y => Y3,
       fx => fx
  );

U8 : Fub6
  port map(
       CLR => NET295,
       GATE => GATE122,
       GATEOUT => GATE165,
       Y => Y2,
       fx => fx
  );


---- Terminal assignment ----

    -- Inputs terminals
	NET295 <= CLR;


---- Dangling input signal assignment ----

Dangling_Input_Signal <= DANGLING_INPUT_CONSTANT;

end miernik_czest;
