jD=2457466.07;
r_ECI= [-5894.1793 -3687.9634 -1997.3022];
latES= 43.62*pi/180;
lonES= 1.45*pi/180;
hES=0.15; %in km
r_ECEF = ECItoECEF(jD,r_ECI');
topo = ECEFtoAzEl(r_ECEF, latES, lonES, hES);
r = topo(1)*180/pi;
el=topo(2)*180/pi;
az=topo(3)*180/pi;
if az<0
az=360+az;
end
az 
el

