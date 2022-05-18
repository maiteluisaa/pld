LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
-------------------------------------
ENTITY testbench IS
END ENTITY testbench;
-------------------------------------

ARCHITECTURE stimulus OF testbench IS 
    component ula is -- declaração de componente
        port (a, b: in SIGNED(15 downto 0);
              aluop : in std_logic_vector(2 downto 0); 
              result_lsb: out SIGNED(15 downto 0);
              result_msb: out SIGNED(15 downto 0));
    end component ula;

    -- declaração de signals
    signal a : SIGNED(15 downto 0) := "0000000000000000";
    signal b : SIGNED(15 downto 0) := "0000000000000000";
    signal aluop : std_logic_vector(2 downto 0) := "000";
    signal result_lsb : SIGNED(15 downto 0);
    signal result_msb : SIGNED(15 downto 0);

begin

    dut: ula port map ( -- conectando as portas do componente nos signals
        a => a,
        b => b,
        aluop => aluop,
        result_lsb => result_lsb,
        result_msb => result_msb);

    process -- estímulos dos signals
    begin
        wait for 25 ns;
        a <= "0000000000000011";
        wait for 25 ns;
        a <= "0000000000000010";
    end process;  

    process
    begin
        wait for 25 ns;
        b <= "0000000000000010";
        wait for 25 ns;
        b <= "0000000000000010";
    end process;

    process
    begin
        wait for 100 ns;
        aluop <= "000";
        wait for 100 ns;
        aluop <= "001";
        wait for 100 ns;
        aluop <= "010";
        wait for 100 ns;
        aluop <= "011";
        wait for 100 ns;
        aluop <= "100";
        wait for 100 ns;
        aluop <= "101";
        wait for 100 ns;
        aluop <= "110";
        wait for 100 ns;
        aluop <= "111";
    end process;

END ARCHITECTURE stimulus;
