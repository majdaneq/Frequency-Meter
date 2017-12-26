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
-- Generated   : Mon Dec 25 16:53:18 2017
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

component Fub26
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
       GATE : inout STD_LOGIC := '0';
       LE : out STD_LOGIC := '0'
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

---- Signal declarations used on the diagram ----

signal NET122 : STD_LOGIC;
signal NET165 : STD_LOGIC;
signal NET181 : STD_LOGIC;
signal NET214 : STD_LOGIC;

begin

----  Component instantiations  ----

U21 : Dec_Counters
  port map(
       CLR => CLR,
       GATEIN => NET181,
       GATEOUT => NET122,
       Y => Y1,
       fx => fx
  );

U22 : Dec_Counters
  port map(
       CLR => CLR,
       GATEIN => NET122,
       GATEOUT => NET165,
       Y => Y2,
       fx => fx
  );

U23 : Dec_Counters
  port map(
       CLR => CLR,
       GATEIN => NET165,
       Y => Y3,
       fx => fx
  );

U24 : automat
  port map(
       CLK => CLK,
       GATE => NET181,
       LE => NET214
  );

U26 : latch
  port map(
       CLR => CLR,
       LE => NET214,
       Ylatch => Ylatch2,
       Ylicznik => Y2
  );

U27 : latch
  port map(
       CLR => CLR,
       LE => NET214,
       Ylatch => Ylatch1,
       Ylicznik => Y1
  );

U34 : Fub26
  port map(
       CLR => CLR,
       LE => NET214,
       Ylatch => Ylatch3,
       Ylicznik => Y3
  );


end miernik_czest;
