%compared with http://www.satellite-calculations.com/TLETracker/SatTracker.htm
jD=2457465.2933;
r_ECI= [-5327.92 -2823.11 -3933.55];
latES= 43.62*pi/180;
lonES= 1.45*pi/180;
hES=0.15; %in km
[r_ECEF v_ECEF a_ECEF] = ECItoECEF(jD,r_ECI',[0; 0; 0],[0; 0; 0]);
topo = ECEFtoAzEl(r_ECEF, latES, lonES, hES);
r = topo(1)*180/pi;
el=topo(2)*180/pi;
az=topo(3)*180/pi;
if az<0
    az=360+az;
end
