%%Inputs
eciXsat=3108.943;
eciYsat=704.4515;
eciZsat=6483.3227;
latAnt=43.62*pi/180; %rad
lonAnt=1.45*pi/180; %rad
altAnt=0.15 %km
jD=2457463.068668981;
%jD=2457462.5;
% hour=13;
% min=38;
% sec=53;

%% Constants
w=7.2921151e-5;
Re=6378.135;


%%Calculations
%% Calculate Sideral Time
%delta_t=hour*3600+min*60+sec;
% UT=delta_t/86400;
% du=jD-2451545.0;
% Tu=du/36525;
JD_integ=floor(jD);
UT=jD-JD_integ;
jD=jD-UT;
Tu=(jD - 2451545.0)/36525;
theta0=24110.54841+Tu*(864018.812866+Tu*(0.093104-Tu*6.2e-6))
theta0=mod(theta0 + 86400.0*1.00273790934*UT,86400.0);
thetaG=2*pi*theta0/86400;
%thetaG=(theta0+w*delta_t); %Local sideral time in radians

%%Calculate user position
theta=mod(thetaG + lonAnt,2*pi);
R=(Re+altAnt)*cos(latAnt);
eciXant=R*cos(theta);
eciYant=R*sin(theta);
eciZant=(Re+altAnt)*sin(latAnt);

%d=sqrt((eciXsat-eciXant)^2+(eciYsat-eciYant)^2+(eciZsat-eciZant)^2);

r= [eciXsat-eciXant eciYsat-eciYant eciZsat-eciZant];

rS= sin(latAnt)*cos(theta)*r(1)+sin(latAnt)*sin(theta)*r(2) - cos(latAnt)*r(3);
rE=-sin(theta)*r(1)+cos(theta)*r(2);
rZ=cos(latAnt)*cos(theta)*r(1)+cos(latAnt)*sin(theta)*r(2)+sin(latAnt)*r(3);

range=sqrt(rS^2+rE^2+rZ^2)
elev=asin(rZ/range)*180/pi
azimuth = atan(-rE/rS);

if rS>0
    azimuth = azimuth+pi;
end
if azimuth<0
    azimuth=azimuth+2*pi;
end
azimuth=azimuth*180/pi

