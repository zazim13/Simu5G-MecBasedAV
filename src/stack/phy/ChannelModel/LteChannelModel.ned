//
//                  Simu5G
//
// Authors: Giovanni Nardini, Giovanni Stea, Antonio Virdis (University of Pisa)
//
// This file is part of a software released under the license included in file
// "license.pdf". Please read LICENSE and README files before using it.
// The above files and the present reference are part of the software itself,
// and cannot be removed from it.
// 

package simu5g.stack.phy.ChannelModel;


moduleinterface LteChannelModelInterface
{
    @display("i=block/classifier2");
}

simple LteChannelModel like LteChannelModelInterface
{
    parameters:
    @display("i=block/classifier2");
    @class("LteChannelModel");
    
    // component carrier for this channel model
    int componentCarrierIndex = default(0);
}

simple LteRealisticChannelModel extends LteChannelModel
{
    parameters:
    @class("LteRealisticChannelModel");

    // Enable/disable shadowing        
    bool shadowing = default(true);

    // Pathloss scenario from ITU -->   
    string scenario = default("URBAN_MACROCELL");

    // eNodeB height -->
    double nodeb_height = default(25);
    // Building height -->
    double building_height = default(20);
    // determines if the UE is inside a building
    bool inside_building = default(false);

    double street_wide = default(20);
    double ue_height = default(1.5);
    bool tolerateMaxDistViolation = default(false);
    bool useTorus = default(false);

    double correlation_distance = default(50);

    // Target bler used to compute feedback -->
    double targetBler = default(0.01);
    // HARQ reduction -->
    double harqReduction = default(0.2);

    // Rank indicator tracefile -->
    double lambdaMinTh = default(0.02);
    double lambdaMaxTh = default(0.2);
    double lambdaRatioTh = default(20);

    // Antenna Gain of UE -->
    double antennaGainUe = default(0);
    // Antenna Gain of eNodeB -->
    double antennGainEnB = default(18);
    // Antenna Gain of Micro node -->
    double antennGainMicro = default(5);
    // Thermal Noise for 10 MHz of Bandwidth -->
    double thermalNoise = default(-104.5);
    // Ue noise figure -->
    double ue_noise_figure = default(7);
    // eNodeB noise figure -->
    double bs_noise_figure = default(5);
    // Cable Loss -->
    double cable_loss = default(2);

    // If true enable the possibility to switch dinamically the LOS/NLOS pathloss computation -->
    bool dynamic_los = default(false);
    // If dynamic-los is false this parameter, if true, compute LOS pathloss otherwise compute NLOS pathloss -->
    bool fixed_los = default(false);
    // Enable/disable fading -->  
    bool fading = default(true);
    // Fading type (JAKES or RAYGHLEY) -->  
    string fading_type = default("JAKES");
    // If jakes fading this parameter specify the number of path (tap channel) -->  
    int fading_paths = default(6);

    double delay_rms = default(363e-9);

    // if true, enables the inter-cell interference computation for UL and DL connections from background cells -->  
    bool bgCell_interference = default(true);
    // if true, enables the inter-cell interference computation for DL connections from external cells (maybe this is obsolete and should be removed) -->  
    bool extCell_interference = default(true);
    // if true, enables the inter-cell interference computation for DL connections -->  
    bool downlink_interference = default(false);
    // if true, enables the interference computation for UL connections -->
    bool uplink_interference = default(false);
	// if true, enables the interference computation for D2D connections -->  
    bool d2d_interference = default(true);
    
    bool enable_extCell_los = default(true);
    
    // read channel information from log file
    bool useRsrqFromLog = default(false);
    int rsrqShift = default(22);
    double rsrqScale = default(1.0);
    
    // collection of SINR statistics can be disabled because it might be quite time-consuming
    bool collectSinrStatistics = default(true);
     
    // statistics
    @signal[rcvdSinrDl];
    @statistic[rcvdSinrDl](title="SINR measured at packet reception, DL"; unit="dB"; source="rcvdSinrDl"; record=mean,vector);
    @signal[rcvdSinrUl];
    @statistic[rcvdSinrUl](title="SINR measured at packet reception, UL"; unit="dB"; source="rcvdSinrUl"; record=mean,vector);
    
    @signal[measuredSinrDl];
    @statistic[measuredSinrDl](title="SINR measured at feedback computation, DL"; unit="dB"; source="measuredSinrDl"; record=mean,vector);
    @signal[measuredSinrUl];
    @statistic[measuredSinrUl](title="SINR measured at feedback computation, UL"; unit="dB"; source="measuredSinrUl"; record=mean,vector);
    
    @signal[distance];
    @statistic[distance](title="distance between UE and serving base station"; unit="meters"; source="distance"; record=mean,vector);



   @signal[rcvdPWRDl];
   @statistic[rcvdPWRDl](title="Signal power measured at packet reception, DL"; unit="dB"; source="rcvdPWRDl"; record=mean,vector);
    
   @signal[rcvdPWRUl];
   @statistic[rcvdPWRUl](title="Signal power measured at packet reception, UL"; unit="dB"; source="rcvdPWRUl"; record=mean,vector);
    



   @signal[recvPowerDl];
   @statistic[recvPowerDl](title="recvPowerDl"; unit="dB"; source="recvPowerDl"; record=vector);
   
   @signal[antennaGainTxDl];
   @statistic[antennaGainTxDl](title="antennaGainTxDl"; unit="dB"; source="antennaGainTxDl"; record=vector);
      
   @signal[antennaGainRxDl];
   @statistic[antennaGainRxDl](title="antennaGainRxDl"; unit="dB"; source="antennaGainRxDl"; record=vector);
    
   @signal[noiseFigureDl];
   @statistic[noiseFigureDl](title="noiseFigureDl"; unit="dB"; source="noiseFigureDl"; record=vector);
      
   @signal[cableLossDl];
   @statistic[cableLossDl](title="cableLossDl"; unit="dB"; source="cableLossDl"; record=vector);
   
   @signal[attenuationDl];
   @statistic[attenuationDl](title="attenuationDl"; unit="dB"; source="attenuationDl"; record=vector);
   
   @signal[speed];
   @statistic[speed](title="speed"; unit="dB"; source="speed"; record=vector);
   
   @signal[thermalNoiseDl];
   @statistic[thermalNoiseDl](title="thermalNoiseDl"; unit="dB"; source="thermalNoiseDl"; record=vector);
   
   @signal[fadingAttenuationDl];
   @statistic[fadingAttenuationDl](title="fadingAttenuationDl"; unit="dB"; source="fadingAttenuationDl"; record=vector);
   
   @signal[recvPowerTxDl];
   @statistic[recvPowerTxDl](title="recvPowerTxDl"; unit="dB"; source="recvPowerTxDl"; record=vector);
      
      
      @signal[recvPowerUl];
   @statistic[recvPowerUl](title="recvPowerUl"; unit="dB"; source="recvPowerUl"; record=vector);
   
   @signal[antennaGainTxUl];
   @statistic[antennaGainTxUl](title="antennaGainTxUl"; unit="dB"; source="antennaGainTxUl"; record=vector);
   
   @signal[antennaGainRxUl];
   @statistic[antennaGainRxUl](title="antennaGainRxUl"; unit="dB"; source="antennaGainRxUl"; record=vector);
   
   @signal[noiseFigureUl];
   @statistic[noiseFigureUl](title="noiseFigureUl"; unit="dB"; source="noiseFigureUl"; record=vector);
  
   @signal[cableLossUl];
   @statistic[cableLossUl](title="cableLossUl"; unit="dB"; source="cableLossUl"; record=vector);
   
   @signal[attenuationUl];
   @statistic[attenuationUl](title="attenuationUl"; unit="dB"; source="attenuationUl"; record=vector);
      
   @signal[thermalNoiseUl];
   @statistic[thermalNoiseUl](title="thermalNoiseUl"; unit="dB"; source="thermalNoiseUl"; record=vector);
      
   @signal[fadingAttenuationUl];
   @statistic[fadingAttenuationUl](title="fadingAttenuationUl"; unit="dB"; source="fadingAttenuationUl"; record=vector);
   
   
   @signal[recvPowerTxUl];
   @statistic[recvPowerTxUl](title="recvPowerTxUl"; unit="dB"; source="recvPowerTxUl"; record=vector);


     @signal[attenuationPathLossDl];
   @statistic[attenuationPathLossDl](title="attenuationPathLossDl"; unit="dB"; source="attenuationPathLossDl"; record=vector);
     @signal[attenuationShadowingDl];
   @statistic[attenuationShadowingDl](title="attenuationShadowingDl"; unit="dB"; source="attenuationShadowingDl"; record=vector);

     @signal[attenuationPathLossUl];
   @statistic[attenuationPathLossUl](title="attenuationPathLossUl"; unit="dB"; source="attenuationPathLossUl"; record=vector);
     @signal[attenuationShadowingUl];
   @statistic[attenuationShadowingUl](title="attenuationShadowingUl"; unit="dB"; source="attenuationShadowingUl"; record=vector);

}

// NRChannelModel_3GPP38_901
//
// This channel model implements path loss, LOS probability and shadowing according to
// the following specifications:
//     3GPP TR 36.873, "Study on 3D channel model for LTE", v12.7.0, December 2017
//
simple NRChannelModel extends LteRealisticChannelModel
{
    parameters:
    @class("NRChannelModel");
}

// NRChannelModel_3GPP38_901
//
// This channel model implements path loss, LOS probability and shadowing according to
// the following specifications:
//     3GPP TR 38.901, "Study on channel model for frequencies from 0.5 to 100 GHz", v16.1.0, December 2019
//
// TODO implements Urban Macro only
// 
simple NRChannelModel_3GPP38_901 extends NRChannelModel
{
    parameters:
    @class("NRChannelModel_3GPP38_901");
    
    bool useBuildingPenetrationLossHighLossModel = default(false);
}