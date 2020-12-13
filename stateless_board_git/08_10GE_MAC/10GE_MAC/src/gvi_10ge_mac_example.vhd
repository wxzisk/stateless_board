------------------------------------------------------------------------------
--      _______      _______                                                --
--     / ____\ \    / /_   _|                                               --
--    | |  __ \ \  / /  | |                                                 --
--    | | |_ | \ \/ /   | |                                                 --
--    | |__| |  \  /   _| |_                                                --
--     \_____|   \/   |_____|                                               --
--                                                                          --
-- Copyright (c) 2012-2018 Hangzhou Yanman Co. Ltd.  All rights reserved.   --
--                                                                          --
-- THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY   --
-- KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE      --
-- IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A               --
-- PARTICULAR PURPOSE.                                                      --
--                                                                          --
-- Website: www.gvi-tech.com                                                --
-- Email: support@gvi-tech.com                                              --
--                                                                          --
------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

-- currently in PMA loopback mode using mac phy types
entity ten_gig_eth_example_top is
port (
	reset				: in  std_logic;
    SYS_CLK_P    		: in  STD_LOGIC;
    SYS_CLK_N    		: in  STD_LOGIC;

	refclk_p			: in  std_logic;
	refclk_n			: in  std_logic;
	phy3_txp			: out std_logic;
	phy3_txn			: out std_logic;
	phy3_rxp			: in  std_logic;
	phy3_rxn			: in  std_logic;
	phy3_tx_disable		: out std_logic;
	data_temp           : in  std_logic_vector(63 downto 0);
	clk_out_156M             : out std_logic;
--	tx_axis_tlast_in  : in std_logic;
--	tx_axis_tvalid_in : in std_logic;
	empty              : in std_logic;
	fifo_rd_en         : inout std_logic;
	
	--data and wr_en to fifo
	rx_axis_tdata_out      : out std_logic_vector(63 downto 0);
	rx_axis_tvalid_out     : out std_logic;
	out_fifo_full         : in std_logic
	
);
end entity ten_gig_eth_example_top;



architecture wrapper of ten_gig_eth_example_top is

    attribute DowngradeIPIdentifiedWarnings: string;

    attribute DowngradeIPIdentifiedWarnings of wrapper : architecture is "yes";
	
	component ten_gig_eth_pcs_pma_0_gt_common
	generic
	(
		WRAPPER_SIM_GTRESET_SPEEDUP : string := "TRUE"
	);
	port
	(
		refclk         : in  std_logic;
		qpllreset      : in  std_logic;
		qpll0lock      : out std_logic;
		qpll0outclk    : out std_logic;
		qpll0outrefclk : out std_logic
	);
	end component;

	component ten_gig_eth_pcs_pma_0_shared_clock_and_reset
	port
	(
		areset                  : in  std_logic;
		refclk_p                : in  std_logic;
		refclk_n                : in  std_logic;
		qpll0reset              : in  std_logic;
		refclk                  : out std_logic;
		coreclk                  : out std_logic;
		txoutclk                : in  std_logic;
		qplllock                : in  std_logic;
		reset_tx_bufg_gt        : in  std_logic;
		areset_txusrclk2        : out std_logic;
		areset_coreclk          : out std_logic;
		gttxreset               : out std_logic;
		gtrxreset               : out std_logic;
		txuserrdy               : out std_logic;
		txusrclk                : out std_logic;
		txusrclk2               : out std_logic;
		qpllreset               : out std_logic;
		reset_counter_done      : out std_logic
	);
	end component;
	
	component ten_gig_mac_wrapper
	port (
		reset						: in  std_logic;
		rx_axis_tdata				: out std_logic_vector(63 downto 0);
		rx_axis_tkeep				: out std_logic_vector(7 downto 0);
		rx_axis_tvalid				: out std_logic;
		rx_axis_tlast				: out std_logic;
		rx_axis_tready				: in  std_logic;
		tx_axis_tdata				: in  std_logic_vector(63 downto 0);
		tx_axis_tkeep				: in  std_logic_vector(7 downto 0);
		tx_axis_tvalid				: in  std_logic;
		tx_axis_tlast				: in  std_logic;
		tx_axis_tready				: out std_logic;
		
		pcspma_clk156				: in  std_logic;
		pcspma_dclk					: in  std_logic;
		pcspma_txclk322				: out std_logic;
		pcspma_mmcm_locked_clk156	: in  std_logic;
		pcspma_qplllock				: in  std_logic;
		pcspma_areset_clk156		: in  std_logic;
		pcspma_qplloutclk			: in  std_logic;
		pcspma_qplloutrefclk		: in  std_logic;
		pcspma_gttxreset			: in  std_logic;
		pcspma_gtrxreset			: in  std_logic;
		pcspma_txuserrdy			: in  std_logic;
		pcspma_txusrclk				: in  std_logic;
		pcspma_txusrclk2			: in  std_logic;
		pcspma_reset_counter_done	: in  std_logic;	
		pcspma_qpllreset			: out std_logic;
		pcspma_reset_tx_bufg_gt		: out std_logic;

		phy0_txp					: out std_logic;
		phy0_txn					: out std_logic;
		phy0_rxp					: in  std_logic;
		phy0_rxn					: in  std_logic
	);
	end component;

--	component ClkGen is
--	port (
--		  clk_in1_p   : in  std_logic;
--		  clk_in1_n   : in  std_logic;
--		  reset   : in  std_logic;
--		  clkout_100M   : out std_logic;
--		  locked   : out std_logic
--	 );
--	 end component ClkGen;

	signal rx_axis_tdata			: std_logic_vector(63 downto 0);
	signal rx_axis_tkeep			: std_logic_vector(7 downto 0);
	signal rx_axis_tvalid			: std_logic;
	signal rx_axis_tlast			: std_logic;
	signal rx_axis_tready			: std_logic;

	signal tx_axis_tdata			: std_logic_vector(63 downto 0);
	signal tx_axis_tkeep			: std_logic_vector(7 downto 0);
	signal tx_axis_tvalid			: std_logic;
--	signal tx_axis_tlast			: std_logic;
	signal tx_axis_tready			: std_logic;
  
	signal clk156					: std_logic;
	signal pcspma_txclk322			: std_logic;
	signal pcspma_areset_clk156		: std_logic;
	signal pcspma_gttxreset			: std_logic;
	signal pcspma_gtrxreset			: std_logic;
	signal pcspma_txuserrdy			: std_logic;
	signal pcspma_txusrclk			: std_logic;
	signal pcspma_txusrclk2			: std_logic;
	signal pcspma_reset_counter_done: std_logic;	
	signal pcspma_mmcm_locked_clk156: std_logic;
	signal pcspma_qpll0reset		: std_logic;
	signal pcspma_qpllreset			: std_logic;
	signal pcspma_reset_tx_bufg_gt	: std_logic;
	signal pcspma_refclk			: std_logic;
	signal pcspma_qpll0lock			: std_logic;
	signal pcspma_qpll0outclk		: std_logic;
	signal pcspma_qpll0outrefclk	: std_logic;
	signal pcspma_userdata_areset	: std_logic;
--	signal clk_100M       			: std_logic := '0';
	signal tx_axis_tvalid_in : std_logic;
	signal rx_axis_tlast_d0 :std_logic; 
	signal rx_axis_tlast_d1 :std_logic; 
	signal tx_axis_tlast_in : std_logic;   
	signal cnt :std_logic_vector(15 downto 0); 
	signal tx_axis_tdata_dly : std_logic_vector (63 downto 0);
	signal tx_axis_tvalid_in1 : std_logic;
    signal tx_axis_tvalid_in2 : std_logic;
	signal packet_gen_start			: std_logic := '0';
	signal packet_gen_busy			: std_logic := '0';
	signal frame_cnt				: std_logic_vector(7 downto 0) := (others=>'0');
	signal packet_frame_index		: std_logic_vector(47 downto 0) := (others=>'0');
	signal packet_frame_index_dly		: std_logic_vector(47 downto 0) := (others=>'0');
	signal start_dly_vec			: std_logic_vector(1 downto 0) := (others=>'0');
    signal packet_length_cnt        : std_logic_vector (15 downto 0);      
    signal data_rx_last             : std_logic_vector (63 downto 0);     
    signal first_header_transfered  : std_logic;
    signal first_header             : std_logic_vector(63 downto 0);
    signal packet_number_10G_out        : std_logic_vector (63 downto 0);
    signal packet_number_10G_send        : std_logic_vector (63 downto 0);
	signal rx_axis_tvalid_d0        : std_logic;

	
	attribute mark_debug   : string; 
	attribute mark_debug of rx_axis_tdata	: signal is "true";
	attribute mark_debug of rx_axis_tkeep	: signal is "true";
	attribute mark_debug of rx_axis_tvalid	: signal is "true";
--	attribute mark_debug of rx_axis_tlast	: signal is "true";
	attribute mark_debug of rx_axis_tready	: signal is "true";
--	attribute mark_debug of packet_length_cnt	: signal is "true";
--	attribute mark_debug of first_header_transfered	: signal is "true";
--	attribute mark_debug of first_header	: signal is "true"; 
    attribute mark_debug of tx_axis_tkeep    : signal is "true";
    attribute mark_debug of tx_axis_tvalid    : signal is "true";
    attribute mark_debug of tx_axis_tlast_in    : signal is "true";
    attribute mark_debug of tx_axis_tdata_dly    : signal is "true";
    attribute mark_debug of packet_number_10G_out    : signal is "true";
    attribute mark_debug of packet_number_10G_send    : signal is "true";
    
--    attribute mark_debug of tx_axis_tready    : signal is "true";

begin

	phy3_tx_disable <=  '0';
    clk_out_156M <= clk156;
--    inst_ClkGen : ClkGen
--    port map(
--        clk_in1_p   => SYS_CLK_P,
--        clk_in1_n   => SYS_CLK_N,
--        reset   =>  '0',
--        clkout_100M => clk_100M,
--        locked   => open
--    );

	ten_gig_eth_pcs_pma_gt_common_block : ten_gig_eth_pcs_pma_0_gt_common
	generic map
	(
		WRAPPER_SIM_GTRESET_SPEEDUP  =>  "TRUE"  --Does not affect hardware
	)
	port map
	(
		refclk         => pcspma_refclk,
		qpllreset      => pcspma_qpllreset,
		qpll0lock       => pcspma_qpll0lock,
		qpll0outclk     => pcspma_qpll0outclk,
		qpll0outrefclk  => pcspma_qpll0outrefclk
	);
	
	ten_gig_eth_base_shared_clock_reset_block : ten_gig_eth_pcs_pma_0_shared_clock_and_reset
	port map
	(
	   areset              => reset,  --
	   refclk_p            => refclk_p,  --
	   refclk_n            => refclk_n,  --
	   coreclk             => clk156,  -- 
	   txoutclk            => pcspma_txclk322,  -- 
	   qplllock            => pcspma_qpll0lock,  -- 
	   areset_coreclk      => pcspma_areset_clk156,  -- 
	   qpll0reset          => pcspma_qpll0reset,
	   refclk              => pcspma_refclk,
	   qpllreset           => pcspma_qpllreset,
	   reset_tx_bufg_gt    => pcspma_reset_tx_bufg_gt,
	   areset_txusrclk2    => pcspma_userdata_areset,
	   gttxreset           => pcspma_gttxreset,  -- 
	   gtrxreset           => pcspma_gtrxreset,  -- 
	   txuserrdy           => pcspma_txuserrdy,  --
	   txusrclk            => pcspma_txusrclk,   --
	   txusrclk2           => pcspma_txusrclk2,  --
	   reset_counter_done  => pcspma_reset_counter_done  --
	);

	inst_ten_gig_mac_wrapper : ten_gig_mac_wrapper
	port map(
		reset						=> reset,
		
		rx_axis_tdata				=> rx_axis_tdata,
		rx_axis_tkeep				=> rx_axis_tkeep,
		rx_axis_tvalid				=> rx_axis_tvalid,
		rx_axis_tlast				=> rx_axis_tlast,
		rx_axis_tready				=> '1',
		tx_axis_tdata				=> tx_axis_tdata_dly,
		tx_axis_tkeep				=> tx_axis_tkeep,
		tx_axis_tvalid				=> tx_axis_tvalid,
		tx_axis_tlast				=> tx_axis_tlast_in,
		tx_axis_tready				=> tx_axis_tready,
		
		pcspma_clk156				=> clk156,
		pcspma_dclk					=> clk156,
		pcspma_txclk322				=> pcspma_txclk322,
		pcspma_mmcm_locked_clk156	=> pcspma_qpll0lock,
		pcspma_qplllock				=> pcspma_qpll0lock,
		pcspma_areset_clk156		=> pcspma_areset_clk156,
		pcspma_qplloutclk			=> pcspma_qpll0outclk,
		pcspma_qplloutrefclk		=> pcspma_qpll0outrefclk,
		pcspma_gttxreset			=> pcspma_gttxreset,
		pcspma_gtrxreset			=> pcspma_gtrxreset,
		pcspma_txuserrdy			=> pcspma_txuserrdy,
		pcspma_txusrclk				=> pcspma_txusrclk,
		pcspma_txusrclk2			=> pcspma_txusrclk2,
		pcspma_reset_counter_done	=> pcspma_reset_counter_done,
		pcspma_qpllreset			=> pcspma_qpll0reset,
		pcspma_reset_tx_bufg_gt		=> pcspma_reset_tx_bufg_gt,

		phy0_txp					=> phy3_txp,
		phy0_txn					=> phy3_txn,
		phy0_rxp					=> phy3_rxp,
		phy0_rxn					=> phy3_rxn
	);
rx_axis_tvalid_out <= rx_axis_tvalid;
rx_axis_tdata_out <= rx_axis_tdata;

process(reset,clk156)
begin
    if(reset = '1') then
        rx_axis_tvalid_d0 <= '0';
    elsif(rising_edge(clk156)) then
        rx_axis_tvalid_d0 <= rx_axis_tvalid;
    end if;
end process;



--process(reset,clk156,rx_axis_tvalid)
--begin
--    if(reset = '1') then
--        rx_packet_len_cnt <= X"00";
--    elsif(rising_edge(clk156)) then
--        if(rx_axis_tvalid = '0') then
--            rx_packet_len_cnt <= X"00";
--        else
--            rx_packet_len_cnt <= rx_packet_len_cnt + '1';
--        end if;
--    end if;
--end process;

--process(reset,rx_axis_tvalid,rx_packet_len_cnt,out_fifo_full)
--begin
--    if(reset = '1') then
--        --packet_drop <= '0';
--        packet_drop_nxt <= '0';
--    elsif(rx_axis_tvalid = '1' and rx_packet_len_cnt = X"00" and out_fifo_full = '1') then
--        --packet_drop <= '1';
--        packet_drop_nxt <= '1';
--    elsif(rx_axis_tvalid = '1' and rx_packet_len_cnt = X"00" and out_fifo_full = '0') then
--        --packet_drop <= '0';
--        packet_drop_nxt <= '0';
--    elsif(rx_packet_len_cnt > X"00") then
--        --packet_drop <= packet_drop;
--        packet_drop_nxt <= packet_drop;
--    else 
--        --packet_drop <= '0';
--        packet_drop_nxt <= '0';
--    end if;
--end process;
--process(reset,clk156)
--begin
--    if(reset = '1') then
--        packet_drop <= '0';
--    elsif(rising_edge(clk156)) then
--        packet_drop <= packet_drop_nxt;
--    end if;   
--end process;

--process(reset,clk156)
--begin
--    if(reset = '1') then
--        rx_axis_tvalid_d0 <= '0';
--    elsif(rising_edge(clk156)) then
--        rx_axis_tvalid_d0 <= rx_axis_tvalid;
--    end if;   
--end process;

--process(reset,clk156)
--begin
--    if(reset = '1') then
--        rx_axis_tdata_d0 <= X"0000000000000000";
--    elsif(rising_edge(clk156)) then
--        rx_axis_tdata_d0 <= rx_axis_tdata;
--    end if;
--end process;

--process(reset, clk156, packet_drop, rx_axis_tvalid_d0)
--begin
--    if(reset = '1') then
--        rx_axis_tvalid_out <= '0';
--        rx_axis_tdata_out <= X"0000000000000000";
--    elsif(rising_edge(clk156)) then
--        if(packet_drop = '1' and rx_axis_tvalid_d0 = '1') then
--            rx_axis_tvalid_out <= '0';
--            rx_axis_tdata_out <= rx_axis_tdata_d0;
--        elsif(packet_drop = '0' and rx_axis_tvalid_d0 = '1')then
--            rx_axis_tvalid_out <= '1';
--            rx_axis_tdata_out <= rx_axis_tdata_d0;
--        else
--            rx_axis_tvalid_out <= '0';
--            rx_axis_tdata_out <= rx_axis_tdata_d0;
--        end if;
--    end if;
--end process;

process(reset,clk156)
begin
    if(reset = '1') then
        packet_number_10G_out <= X"0000000000000000";
    elsif(rising_edge(clk156)) then
        if(rx_axis_tvalid = '1' and rx_axis_tvalid_d0 = '0') then
        packet_number_10G_out <= packet_number_10G_out + '1';
        end if;
    end if;
end process;

process(reset,clk156)
begin
    if(reset = '1') then
        packet_number_10G_send <= X"0000000000000000";
    elsif(rising_edge(clk156)) then
        if(tx_axis_tlast_in = '1') then
        packet_number_10G_send <= packet_number_10G_send + '1';
        end if;
    end if;
end process;
   
	process(reset, clk156, empty, tx_axis_tready)
	   begin
	       if(reset = '1') then
	        fifo_rd_en <= '0';
	        cnt <= "0000000000000000";
	        tx_axis_tvalid_in <= '0';
	        tx_axis_tdata <= X"0000000000000000";
	        tx_axis_tvalid_in1 <= '0';
	        tx_axis_tvalid_in2 <= '0';
	        tx_axis_tlast_in <= '0';
	        tx_axis_tdata_dly <= X"0000000000000000";
	      elsif(rising_edge(clk156)) then
	       tx_axis_tdata <= data_temp;
	       tx_axis_tvalid_in <= fifo_rd_en;
	       tx_axis_tvalid_in1 <= tx_axis_tvalid_in;
	       tx_axis_tvalid_in2 <= tx_axis_tvalid_in1;
	       tx_axis_tdata_dly(63 downto 56) <= tx_axis_tdata(7 downto 0);
           tx_axis_tdata_dly(55 downto 48) <= tx_axis_tdata(15 downto 8);
           tx_axis_tdata_dly(47 downto 40) <= tx_axis_tdata(23 downto 16);
           tx_axis_tdata_dly(39 downto 32) <= tx_axis_tdata(31 downto 24);
           tx_axis_tdata_dly(31 downto 24) <= tx_axis_tdata(39 downto 32);
           tx_axis_tdata_dly(23 downto 16) <= tx_axis_tdata(47 downto 40);
           tx_axis_tdata_dly(15 downto 8) <= tx_axis_tdata(55 downto 48);
           tx_axis_tdata_dly(7 downto 0) <= tx_axis_tdata(63 downto 56);
	       if(fifo_rd_en = '0') then
	           if(empty = '0' and tx_axis_tready = '1') then
	               fifo_rd_en <= '1';
	               cnt <= cnt + 1;
	               tx_axis_tlast_in <= '0';
	           else
	               fifo_rd_en <= '0';
	               cnt <= "0000000000000000";
	               tx_axis_tlast_in <= '0';
	           end if;
	       else
	           if((data_temp = X"ffffffffffffffff" or empty = '1') and cnt > 2) then
	               fifo_rd_en <= '0';
	               cnt <= "0000000000000000";
	               tx_axis_tlast_in <= '1';
	           else
	               fifo_rd_en <= '1';
	               cnt <= cnt +1 ;
	               tx_axis_tlast_in <= '0';
	           end if;
	      end if;
	      end if;
	   end process;
	   
tx_axis_tvalid <= tx_axis_tvalid_in and tx_axis_tvalid_in1 and tx_axis_tvalid_in2;

----

    
--    process(reset,clk156, rx_axis_tvalid , rx_axis_tvalid_out )
--    begin
--        if(reset ='1') then
--            first_header <= X"0000000000000000";
--        elsif(rising_edge(clk156)) then
--            if(rx_axis_tvalid = '1' and rx_axis_tvalid_out = '0') then
--                first_header <= rx_axis_tdata;
--            else 
--                first_header <= X"0000000000000000";
--        end if;
--        end if;
--    end process;
    
    
    process(reset, clk156)
        begin
           if(reset = '1') then
            tx_axis_tkeep <= "11111111";
            else
                 tx_axis_tkeep <= "11111111";
           end if;
        end process;
        
    
--    process(reset,clk156, out_fifo_full, rx_axis_tvalid)
--    begin
--        if(reset = '1') then
--            rx_axis_tready <= '0';
--        elsif(out_fifo_full='0' and rx_axis_tvalid = '1') then
--            rx_axis_tready <= '1';
--        else
--            rx_axis_tready <= '0';
--        end if;
--    end process;
    
--    process(reset, clk156,rx_axis_tdata)
--        begin
--            if(reset = '1') then
--                rx_axis_tdata_out <= X"0000000000000000";
--            elsif(rising_edge(clk156))   then
--                rx_axis_tdata_out(63 downto 56) <= rx_axis_tdata(7 downto 0);
--                rx_axis_tdata_out(55 downto 48) <= rx_axis_tdata(15 downto 8);
--                rx_axis_tdata_out(47 downto 40) <= rx_axis_tdata(23 downto 16);
--                rx_axis_tdata_out(39 downto 32) <= rx_axis_tdata(31 downto 24);
--                rx_axis_tdata_out(31 downto 24) <= rx_axis_tdata(39 downto 32);
--                rx_axis_tdata_out(23 downto 16) <= rx_axis_tdata(47 downto 40);
--                rx_axis_tdata_out(15 downto 8) <= rx_axis_tdata(55 downto 48);
--                rx_axis_tdata_out(7 downto 0) <= rx_axis_tdata(63 downto 56); 
--            end if;
--        end process;
    
    
--    process(reset, clk156, out_fifo_full, rx_axis_tvalid,rx_axis_tdata)
--        begin
--            if(reset = '1') then
--                rx_axis_tvalid_out <= '0';
--            elsif(rising_edge(clk156))   then  
--                if(out_fifo_full='0' and rx_axis_tvalid = '1') then
--                    if(first_header_transfered = '1' and rx_axis_tdata = first_header and rx_axis_tdata /= X"0000000000000000") then
--                        rx_axis_tvalid_out <= '0';
--                    else
--                        rx_axis_tvalid_out <= rx_axis_tvalid;
--                    end if;
--                else
--                    rx_axis_tvalid_out <= '0';
--                end if;
--            end if;
--        end process;
        
--rx_axis_tvalid_out <= rx_axis_tvalid_out_d0 and rx_axis_tvalid_out_d1;        

--process(reset, clk156, rx_axis_tvalid,rx_axis_tlast_d0 )       
--    begin
--    if(reset = '1') then
--        packet_length_cnt <= X"0000";  
--    elsif(rising_edge(clk156)) then    
--        if(rx_axis_tready = '1') then
--            packet_length_cnt <= packet_length_cnt + '1';
--        else 
--            packet_length_cnt <= X"0000";
--        end if;
--    end if;
--    end process; 


end wrapper;
