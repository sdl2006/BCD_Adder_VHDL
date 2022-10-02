library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;


entity FULLADDER is
  port(A,B,Cin : in std_logic ; S,C : out std_logic);
end entity FULLADDER;



architecture achitect of FULLADDER is
  signal a1,a3,a4: std_logic ;
  
begin 

  MXOR1: XOR_2 port map (A=>B , B=>A , Y=>a1);
  MXOR2: XOR_2 port map (A=>Cin , B=>a1 , Y=>S);
  MNAND_1: NAND_2 port map (A=>A, B=>B ,Y=>a4);
  MNAND_2b: NAND_2 port map (A=>Cin, B=>a1 ,Y=>a3);
  
  MNAND_5: NAND_2 port map (A=>a4, B=>a3 ,Y=>C);
  
end achitect ;


library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;


entity bas is
  port(a0,a1,a2,a3,b0,b1,b2,b3,m : in std_logic ; s0,s1,s2,s3,c : out std_logic);
end entity bas;



architecture basar of bas is
  signal p0,p1,p2,p3,k1,k2,k3: std_logic ;
  component FULLADDER is
    port (A,B,Cin: in std_logic; S,C: out std_logic);
  end component FULLADDER;
begin 

  XOR0: XOR_2 port map (A=>b0 , B=>m , Y=>p0);
  XOR1: XOR_2 port map (A=>b1 , B=>m , Y=>p1);
  XOR2: XOR_2 port map (A=>b2 , B=>m , Y=>p2);
  XOR3: XOR_2 port map (A=>b3 , B=>m , Y=>p3);
  
  fa0: FULLADDER port map (A=>m ,B=>a0 ,Cin=>p0 ,S=>s0 ,C=>k1);
  fa1: FULLADDER port map (A=>a1 ,B=>p1 ,Cin=>k1 ,S=>s1 ,C=>k2);
  fa2: FULLADDER port map (A=>a2 ,B=>p2 ,Cin=>k2 ,S=>s2 ,C=>k3);
  fa3: FULLADDER port map (A=>a3,B=>p3 ,Cin=>k3 ,S=>s3 ,C=>c);

  
  
end basar ;

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity BCD_adder  is
  port (a0,a1,a2,a3,b0,b1,b2,b3: in std_logic; y4,y3,y2,y1,y0: out std_logic);
end entity BCD_adder;

architecture Struct of BCD_adder is
  component bas is
    port(a0,a1,a2,a3,b0,b1,b2,b3,m : in std_logic ; s0,s1,s2,s3,c : out std_logic);
  end component bas;
  signal c1,s1,s2,s3,s0,k,p1,p2,o1,l1,l2 : std_logic;
begin
  -- component instances
  AND1: AND_2 port map (A => s3, B => s1, Y => p1);
  AND2: AND_2 port map (A => s3, B => s2, Y => p2);
  OR1: OR_2 port map (A => p1, B => p2, Y => o1);
  OR2: OR_2 port map (A => o1, B => c1, Y => k);
  OR3: OR_2 port map (A => k, B => l1, Y => y4);
  
  bas_1:bas port map (a0=>a0,a1=>a1,a2=>a2,a3=>a3,b0=>b0,b1=>b1,b2=>b2,b3=>b3,m=>'0',s0=>s0,s1=>s1,s2=>s2,s3=>s3,c=>c1);
  bas_2:bas port map (a0=>s0,a1=>s1,a2=>s2,a3=>s3,b0=>'0',b1=>k,b2=>k,b3=>'0',m=>'0',s0=>y0,s1=>y1,s2=>y2,s3=>y3,c=>l1);
end Struct;