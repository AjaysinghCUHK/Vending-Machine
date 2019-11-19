----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2018 04:48:18 PM
-- Design Name: 
-- Module Name: v1 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity v1 is
    Port ( reset : in bit;
           clk : in STD_LOGIC;
           one_in : in STD_LOGIC;
           two_in : in STD_LOGIC;
           five_in : in STD_LOGIC;
           one_out : out STD_LOGIC;
           two_out : out STD_LOGIC;
           five_out : out STD_LOGIC;
	       one_out2 : out STD_LOGIC;
		   two_out2 : out STD_LOGIC;
		   five_out2 : out STD_LOGIC;
           collect_in : in STD_LOGIC_VECTOR (1 downto 0);
           dispense : out STD_LOGIC_VECTOR (1 downto 0);   
           cancel : in STD_LOGIC;
           ssd : out STD_LOGIC_VECTOR (6 downto 0);
           ssdcat : out STD_LOGIC
);
end v1;

architecture Behavioral of v1 is
type state_type is (
	S0,
	S1,
	S2,
	S3,
	S4,
	S5,
	S6,
	S7,
	S8,
	S9,
	S10
);
signal clkout: bit;
component clock_divider_1Hz
port ( reset : in  bit;
       clk_in : in  std_logic; -- you can als use bit
       clk_out : out  bit );
end component;
signal state, next_state : state_type;
signal digit: STD_LOGIC_VECTOR(3 downto 0);
signal ms_pulse: STD_LOGIC:='0';
signal count: integer:=0;
signal counter_en: STD_LOGIC:='0';  -- Counter enable
signal ms_count: integer:=0;
signal sec_pulse: STD_LOGIC:='0';
signal sec_count: integer:=0; -- Counter to be updated each second

variable x : integer := 0;
begin
G1: clock_divider_1Hz port map(reset, clk, clkout);
state_transition : process(clkout, reset)
begin
	if reset ='1' then 
		state <= S0;
	else
		if clkout'event and clkout='1' then 
			state <= next_state;
		end if;
	end if;
end process;

state_assignment : process(ms_pulse, state, one_in, two_in, five_in, cancel, collect_in)
begin  
	next_state <= state;
	one_out <= '0';
    two_out <= '0';
    five_out <= '0';
    one_out2 <= '0';
    two_out2 <= '0';
    five_out2 <= '0';
    dispense <= "00";
case(state) is
	when S0 =>
	   	if ms_pulse='1' then
                digit <= "0000";  -- Display MSB at left 7-segment
        else
               digit <= "0000";  -- Display LSB at right 7-segment
        end if;
		if one_in='1' then
			next_state <= S1;
		elsif two_in='1' then
			next_state <= S2;
		elsif five_in ='1' then
			next_state <= S5;
		elsif cancel ='1' then
        	next_state <= S0;
		else 	
            next_state <= S0;
		end if;
	when S1 =>
		if ms_pulse='1' then
                digit <= "0000";  -- Display MSB at left 7-segment
        else
               digit <= "0001";  -- Display LSB at right 7-segment
        end if;
		if one_in = '1' then
			next_state <= S2;
		elsif two_in='1' then
			next_state <= S3;
		elsif five_in ='1' then
			next_state <= S6;
		elsif cancel ='1' then
			one_out <= '1';
        	next_state <= S0;
		else 	
			next_state <= S1;
		end if;
	when S2 =>		
	   if ms_pulse='1' then
                digit <= "0000";  -- Display MSB at left 7-segment
        else
               digit <= "0010";  -- Display LSB at right 7-segment
        end if;
		if one_in='1' then
			next_state <= S3;
		elsif two_in='1' then
			next_state <= S4;
		elsif five_in ='1' then
			next_state <= S7;
		elsif cancel ='1' then
            two_out <= '1';
        	next_state <= S0;
		else 	
			next_state <= S2;
		end if;
	when S3 =>
        if ms_pulse='1' then
             digit <= "0000";  -- Display MSB at left 7-segment
        else
             digit <= "0011";  -- Display LSB at right 7-segment
        end if;
		if one_in='1' then
			next_state <= S4;
		elsif two_in='1' then
			next_state <= S5;
		elsif five_in ='1' then
			next_state <= S8;
		elsif cancel ='1' then
			one_out <= '1';
            two_out <= '1';
        	next_state <= S0;	
		else 	
			next_state <= S3;
		end if;
	when S4 =>
        if ms_pulse='1' then
             digit <= "0000";  -- Display MSB at left 7-segment
        else
             digit <= "0100";  -- Display LSB at right 7-segment
        end if;
		if one_in='1' then
			next_state <= S5;
		elsif two_in='1' then
			next_state <= S6;
		elsif five_in ='1' then
			next_state <= S9;
		elsif cancel ='1' then
            two_out2 <= '1';
        	next_state <= S0;
		else 	
			next_state <= S4;
		end if;
	when S5 =>
	   	if ms_pulse='1' then
             digit <= "0000";  -- Display MSB at left 7-segment
        else
             digit <= "0101";  -- Display LSB at right 7-segment
        end if; 
		if one_in='1' then
			next_state <= S6;
		elsif two_in='1' then
			next_state <= S7;
		elsif five_in ='1' then
			next_state <= S10;
		elsif cancel ='1' then
            five_out <= '1';
        	next_state <= S0;
		elsif collect_in = "01" then
			dispense <= "01"; 
			next_state <= S0;
		else 	
			next_state <= S5;
		end if;
	when S6 =>
        if ms_pulse='1' then
          digit <= "0000";  -- Display MSB at left 7-segment
        else
          digit <= "0110";  -- Display LSB at right 7-segment
        end if; 
	       if cancel ='1' then
			one_out <= '1';
            five_out <= '1';
        	next_state <= S0;
		elsif collect_in = "01" then
	       	one_out <= '1';
			dispense <= "01";
			next_state <= S0;
		elsif collect_in = "10" then
		    dispense <= "10";		
		    next_state <= S0;	
		else
			next_state <= S6;
		end if;
	when S7 =>
	     if ms_pulse='1' then
           digit <= "0000";  -- Display MSB at left 7-segment
         else
           digit <= "0111";  -- Display LSB at right 7-segment
         end if; 
		 if cancel ='1' then
            two_out <= '1';
            five_out <= '1';
        	next_state <= S0;
        elsif collect_in = "01" then
            two_out <= '1';
            dispense <= "01";
            next_state <= S0;     
        elsif collect_in = "10" then
        	one_out <= '1';
            dispense <= "10";
            next_state <= S0;
		else
			next_state <= S7;
		end if;
	when S8 =>
	   	if ms_pulse='1' then
          digit <= "0000";  -- Display MSB at left 7-segment
        else
          digit <= "1000";  -- Display LSB at right 7-segment
        end if; 
		if cancel ='1' then
			one_out <= '1';
            two_out <= '1';
            five_out <= '1';
        	next_state <= S0;
        elsif collect_in = "01" then
            one_out <= '1';
            two_out <= '1';
            dispense <= "01";
            next_state <= S0;
        elsif collect_in = "10" then
            two_out <= '1';
            dispense <= "10";
            next_state <= S0;
		else
			next_state <= S8;
		end if;
	when S9 =>
	  	if ms_pulse='1' then
           digit <= "0000";  -- Display MSB at left 7-segment
         else
           digit <= "1001";  -- Display LSB at right 7-segment
         end if;  
		if cancel ='1' then
            two_out <= '1';
            five_out <= '1';
            one_out2 <= '1';
            next_state <= S0;
        elsif collect_in = "01" then
            two_out2 <= '1';
            dispense <= "01";
            next_state <= S0;
        elsif collect_in = "10" then
            one_out <= '1';
            two_out <= '1';
            dispense <= "10";
            next_state <= S0;
		else
			next_state <= S9;
		end if;
	when S10 =>
		if ms_pulse='1' then
   digit <= "0001";  -- Display MSB at left 7-segment
 else
   digit <= "0000";  -- Display LSB at right 7-segment
 end if;  
		if cancel = '1' then
			one_out <= '1';
            two_out <= '1';
            five_out <= '1';
            one_out2 <= '1';
        	next_state <= S0;
        elsif collect_in = "01" then
        	five_out <= '1';
            dispense <= "01";
            next_state <= S0;
        elsif collect_in = "10" then
        	two_out2 <= '1';
            dispense <= "10";
            next_state <= S0;
		else
			next_state <= S10;
		end if;
	end case;
end process;
process(clk)
    	    begin
          
      	    case digit is
        		when "0000"=>ssd<="1111110"; -- display 0
        		when "0001"=>ssd<="0110000"; -- display 1
        		when "0010"=>ssd<="1101101"; -- display 2
        		when "0011"=>ssd<="1111001"; -- display 3
        		when "0100"=>ssd<="0110011"; -- display 4
        		when "0101"=>ssd<="1011011"; -- display 5
        		when "0110"=>ssd<="1011111"; -- display 6
        		when "0111"=>ssd<="1110000"; -- display 7
        		when "1000"=>ssd<="1111111"; -- display 8
        		when "1001"=>ssd<="1111011"; -- display 9
        		when "1010"=>ssd<="1110111"; -- display 10, HEX code: A
        		when "1011"=>ssd<="0011111"; -- display 11, HEX code: B
        		when "1100"=>ssd<="1001110"; -- display 12, HEX code: C
        		when "1101"=>ssd<="0111101"; -- display 13, HEX code: D
        		when "1110"=>ssd<="1001111"; -- display 14, HEX code: E
        		when "1111"=>ssd<="1000111"; -- display 15, HEX code: F
      	  end case;
      	       	  if rising_edge(clk) then
            if (count=49999) then
                ms_pulse <= not ms_pulse;
                        count<=0;
                else
                        count <= count + 1;
                end if;
            end if;
                        
            ssdcat <= ms_pulse; 
            end process;
end Behavioral;
