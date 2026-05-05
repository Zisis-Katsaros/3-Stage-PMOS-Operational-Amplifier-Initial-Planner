function [Cc, I8, W] = Op_Amp_Algorithm(CL,GB, SR, Vdd, Vss, kn, kp, ...
    Vinmin, Vinmax, VT1min, VT1max, VT3max)
    %
    % Calculates Cc, Rb and the widths of the transistors of an Operational
    % Amplifier based on the inputs provided
    %
    % Inputs: 
    % CL= Load capacitor 
    % GB: Gain bandwidth product
    % Vdd, Vss: Power supplies
    % kn, kp: Transconductance parameters
    %
    % Outputs: 
    % Cc: Miller capacitor
    % I8: Value of the AC current source
    % W: Array containing the widths of the transistors 1 through 8
    
    W = zeros(1, 8); 
    L = [2, 2, 2, 2, 2, 2, 2, 2];
    C0 = 1e-12; 
    Cc = 0.22158*CL + C0; % Calculation of Cc:

    I5 = SR*Cc; % Calculation of I5

    b3 = I5/(Vss - Vinmin - VT1min + VT3max)^2;
    W_L3 = b3/kn;
    W(3) =  calcW(W_L3, L(3)); % Calculation of W3

    W_L4 = W_L3;
    W(4) = calcW(W_L4, L(4)); % Calculation of W4

    gm1 = GB*Cc*2*3.14159265359;
    W_L1 = gm1^2/(kp*I5);
    W(1) = calcW(W_L1, L(1)); % Calculation of W1

    W_L2 = W_L1;
    W(2) = calcW(W_L2, L(2)); % Calculation of W2

    gm6 = 10*gm1;
    gm4 = sqrt(kn*W(4)/L(4)*I5);
    W_L6 = W(4)/L(4)*gm6/gm4;
    W(6) = calcW(W_L6, L(6)); % Calculation of W6
    
    VDS5sat = Vdd - sqrt(I5/(kp*W(1)/L(1))) - Vinmax - VT1max;
    W_L5 = 2*I5/(kp*VDS5sat^2);
    W(5) = calcW(W_L5, L(5)); % Calculation of W5
    
    I6 = gm6^2/(2*kn*W(6)/L(6));
    W_L7 = W(5)/L(5)*I6/I5;
    W(7) = calcW(W_L7, L(7)); % Calculation of W7

    I8 = I5*0.8;
    W_L8 = W(5)/L(5)*I8/I5;
    W(8) = calcW(W_L8, L(8)); % Calculation of W8

    Cc_in_pF = Cc*10^12; 
    I8_in_uA = I8*10^6;
    fprintf(['Cc = %0.6f pF\n' ...
                'I8 = %0.6f uA\n' ...
                'W = '], Cc_in_pF, I8_in_uA);
    disp(W);
end

