% main function

CL = 2.66e-12;
GB = 7.66e6;
SR = 18.66e6;
Vdd = 1.998;
Vss = -1.998;
kn = 100e-6;
kp = 50e-6;
Vinmin = -0.1;
Vinmax = 0.1;
VT1min = 0.7556;
VT1max = 1.0556;
VT3max = 1.086;

[Cc, Rb, W] = Op_Amp_Algorithm(CL,GB, SR, Vdd, Vss, kn, kp, Vinmin, Vinmax, ...
    VT1min, VT1max, VT3max);