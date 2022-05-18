LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
-------------------------------------
ENTITY testbench IS
END ENTITY testbench;
-------------------------------------

ARCHITECTURE stimulus OF testbench IS 
    component pc is -- declaração de componente
        port (clk: in std_logic;
        load: in std_logic;
        reset: in std_logic;
        up: in std_logic;
        data_in: in std_logic_vector(15 downto 0);
        data: inout std_logic_vector(15 downto 0)); 
    end component pc;

    -- declaração de signals
    
    signal clk: std_logic:= '0'; 
    signal load: std_logic:= '0';
    signal reset: std_logic:= '0';
    signal up: std_logic:= '0';
    signal data_in: std_logic_vector(15 downto 0) := "0000000000000011";
    signal data: std_logic_vector(15 downto 0); 
begin
    
    dut: pc port map ( -- conectando as portas do componente nos signals
        clk => clk,
        load => load,
        reset => reset,
        up => up,
        data_in => data_in,
        data => data);

    process -- declaração dos estímulos dos signals
    begin
        wait for 10 ns;
        clk <= '0';
        wait for 10 ns;
        clk <= '1'; 
    end process;  

    process
    begin
        wait for 500 ns;
        reset <= '1';
        wait for 200 ns;
        reset <= '0';
    end process;
    
    process
    begin
        wait for 45 ns;
        load <= '1';           
        wait for 10 ns;
        load <= '0'; 
    end process;
    
    process
    begin
        wait for 5 ns;
        up <= '1';           
        wait for 50 ns;
        up <= '0'; 
    end process;
    
    process
    begin
        wait for 25 ns;
        data_in <= "0000000000000011";
        wait for 25 ns;
        data_in <= "0000000000000010";
        wait for 25 ns;
        data_in <= "0000000000000111";
        wait for 25 ns;
        data_in <= "0000000000000110";
        
    end process;
    
END ARCHITECTURE stimulus;