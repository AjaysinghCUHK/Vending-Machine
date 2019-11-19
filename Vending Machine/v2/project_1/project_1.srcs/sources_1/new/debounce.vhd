library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clock_divider_1Hz is
    port ( reset : in  bit;
           clk_in : in  std_logic; -- you can als use bit
           clk_out : out  bit );
end clock_divider_1Hz;

architecture behavioral of clock_divider_1Hz is
    signal slow_clock_temp: bit;
    signal counter: integer; 
begin
    process (reset , clk_in)
    begin
        if (reset = '1') then
            slow_clock_temp <= '0';
            counter <= 0;
        elsif rising_edge (clk_in) then
             if ( counter = 4999999) then -- 1 MHz /1 Hz /2 -1 = 499999
                                         -- set the counter threshold to a smaller value for simulation
                 slow_clock_temp <= NOT( slow_clock_temp );
                 counter <= 0;
             else
                 counter <= counter + 1;
             end if;
         end if;
    end process ;
    clk_out <= slow_clock_temp ;
end behavioral;
