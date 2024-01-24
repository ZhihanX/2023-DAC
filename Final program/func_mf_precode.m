function [x, Beita] = func_mf_precode(s,H)
    [Num_UE,Num_BS_Antennas] = size(H); %number of antennas
    Power_Symbol=1/Num_BS_Antennas;
    Power_Total=1;
    Beita = sqrt( Power_Total / trace(conj(H') * Power_Symbol * H));   
    P =  Beita * H';
    x = P * s;
end
