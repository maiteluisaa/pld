LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
-------------------------------------
ENTITY testbench IS
END ENTITY testbench;
-------------------------------------

ARCHITECTURE stimulus OF testbench IS 
    component ir is -- declaração de componente
        port (clk: in std_logic;
        en: in std_logic;
        reset: in std_logic;
        data: in std_logic_vector(15 downto 0);
        opcode: out std_logic_vector(7 downto 0);
        immediate: out std_logic_vector(7 downto 0);
        mem_addr: out std_logic_vector(7 downto 0)); 
    end component ir;

    -- declaração de signals
    
    signal clk: std_logic:= '0'; 
    signal en: std_logic:= '0';
    signal reset: std_logic:= '0';
    signal data: std_logic_vector(15 downto 0) := "0000000000000011";
    signal opcode: std_logic_vector(7 downto 0);
    signal immediate: std_logic_vector(7 downto 0);
    signal mem_addr: std_logic_vector(7 downto 0);
    
begin
    
    dut: ir port map ( -- conectando as portas do componente nos signals
        clk => clk,
        en => en,
        reset => reset,
        data => data,
        opcode => opcode,
        immediate => immediate,
        mem_addr => mem_addr);

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
        wait for 50 ns;
        en <= '1';           
        wait for 5 ns;
        en <= '0'; 
    end process;
    
    process
    begin
        wait for 25 ns;
        data <= "0000000000000011";
        wait for 25 ns;
        data <= "0000000000000010";
        wait for 25 ns;
        data <= "0000000000000111";
        wait for 25 ns;
        data <= "0000000000000110";
        
    end process;
    
END ARCHITECTURE stimulus;