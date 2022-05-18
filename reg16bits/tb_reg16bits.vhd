LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
-------------------------------------
ENTITY testbench IS
END ENTITY testbench;
-------------------------------------

ARCHITECTURE stimulus OF testbench IS
    component reg16bits is -- declaração de componente
        port (clk : in std_logic;
        clear : in std_logic;
        w_flag: in std_logic;
        data_in: in std_logic_vector(15 downto 0);
        reg_out: out std_logic_vector(15 downto 0));

    end component reg16bits;
    
    -- declaração de signals
    signal clk : std_logic := '0';
    signal clear : std_logic := '0';
    signal w_flag : std_logic := '0';
    signal data_in : std_logic_vector(15 downto 0);
    signal reg_out : std_logic_vector(15 downto 0);

begin

    dut: reg16bits port map (  -- conectando as portas do componente nos signals
        clk => clk,
        clear => clear,
        w_flag => w_flag,
        data_in => data_in,
        reg_out => reg_out);

    process
    begin
        wait for 10 ns;
        clk <= '0';
        wait for 10 ns;
        clk <= '1'; 
    end process;  

    process
    begin
        wait for 60 ns;
        clear <= '1';           
        wait;
    end process;
    
    process
    begin
        wait for 65 ns;
        w_flag <= '1';           
        wait for 10 ns;
        w_flag <= '0'; 
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