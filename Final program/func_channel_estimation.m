function [y] = func_channel_estimation(User_Num,NBSant,k,AD_bits,SNRs,H_real,quantization_func)
    
    % replace the code from Noise_add to [Pre_Code_QPSK_signals, facter,~]
    NoisePS      = (randn(NBSant,User_Num)+1i*randn(NBSant,User_Num))/sqrt(2);
    NoisePS_pw   = 10.^(-SNRs(k)/10);
    NoisePS_add  = sqrt(NoisePS_pw)*NoisePS;
    PS = zeros(User_Num,1);
    for i = 1:1:User_Num
        PS(i)  = 1+1i;
    end
    
    PSh = zeros(NBSant,User_Num);
    
    for i = 1:1:User_Num
        PSh(:,i)  = conj(H_real(i,:)')*PS(i);
      
    end
    PShn = zeros(NBSant,User_Num);
    for i = 1:1:User_Num
        PShn(:,i)  = PSh(:,i)+NoisePS_add(:,i);
      
    end
    PShno = zeros(NBSant,User_Num);
    for i = 1:1:User_Num
      
            PShno(:,i) =quantization_func(PShn(:,i),AD_bits);
      
        
    end

    HLS_EST = zeros(NBSant,User_Num);  
        

      for i = 1:1:User_Num
        HLS_EST(:,i) = PShno(:,i)/PS(i);
      
      end
      HLS_est = zeros(User_Num,NBSant);
      for i = 1:1:User_Num
        HLS_est(i,:)    = conj([HLS_EST(:,i)]');
      
      end
   
      y = HLS_est;
      

  end
