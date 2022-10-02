-- A DUT entity is used to wrap your design so that we can combine it with testbench.
-- This example shows how you can do this for the OR Gate

library ieee;
use ieee.std_logic_1164.all;

entity DUT is
    port(input_vector: in std_logic_vector(7 downto 0);
       	output_vector: out std_logic_vector(4 downto 0));
end entity;

architecture DutWrap of DUT is
   component BCD_adder is
	   port (a0,a1,a2,a3,b0,b1,b2,b3: in std_logic; y4,y3,y2,y1,y0: out std_logic);
     
   end component;
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: BCD_adder 
			port map (
					-- order of inputs B A
					b0 => input_vector(0),
					b1 => input_vector(1),
               b2 => input_vector(2),
					b3 => input_vector(3),
					a0 => input_vector(4),
               a1 => input_vector(5),
               a2 => input_vector(6),
               a3 => input_vector(7),



               -- order of output OUTPUT
					
					y0 => output_vector(0),
					y1 => output_vector(1),
					y2 => output_vector(2),
					y3 => output_vector(3),
					y4 => output_vector(4));
end DutWrap;