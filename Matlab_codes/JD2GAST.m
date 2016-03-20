%----------------------------- Begin Function -----------------------------
%Purpose:
%--------
%Convert a specified Julian Date Vector to Greenwhich Apparent Sidereal Time.
%
%Inputs:
%-------
%JD             [N x M x L]                         Julian Date Vector                      
%       
%
%Outputs:
%--------
%GAST           [N x M x L]                         Greenwich Apparent Sidereal
%                                                   Time in degrees from
%                                                   0-360
%
%References:
%-----------
%Approximate Sidereal Time, 
%http://www.usno.navy.mil/USNO/astronomical-applications/...
%astronomical-information-center/approx-sider-time
%
%Universal Sidereal Times, The Astronomical Almanac For The Year 2004
%
%Programed by: 
%-------------
%Darin Koblick 07-17-2010
%Darin Koblick 05-28-2012 Updated Mean obliquity of the ecliptic terms
%--------------------------------------------------------------------------
function GAST = JD2GAST(JD)
%THETAm is the mean siderial time in degrees
THETAm = JD2GMST(JD);

%Compute the number of centuries since J2000
T = (JD - 2451545.0)./36525;

%Mean obliquity of the ecliptic (EPSILONm)
% see http://www.cdeagle.com/ccnum/pdf/demogast.pdf equation 3
% also see Vallado, Fundamentals of Astrodynamics and Applications, second edition.
%pg. 214 EQ 3-53
EPSILONm = 23.439291-0.0130111.*T - 1.64E-07.*(T.^2) + 5.04E-07.*(T.^3);

%Nutations in obliquity and longitude (degrees)
% see http://www.cdeagle.com/ccnum/pdf/demogast.pdf equation 4
L = (280.4665 + 36000.7698.*T)*pi/180;
dL = (218.3165 + 481267.8813.*T)*pi/180;
OMEGA = (125.04452 - 1934.136261.*T)*pi/180;

%Calculate nutations using the following two equations:
% see http://www.cdeagle.com/ccnum/pdf/demogast.pdf equation 5
dPSI = -17.20.*sin(OMEGA) - 1.32.*sin(2.*L) - .23.*sin(2.*dL) ...
    + .21.*sin(2.*OMEGA);
dEPSILON = 9.20.*cos(OMEGA) + .57.*cos(2.*L) + .10.*cos(2.*dL) - ...
    .09.*cos(2.*OMEGA);

%Convert the units from arc-seconds to degrees
dPSI = dPSI.*(1/3600);
dEPSILON = dEPSILON.*(1/3600);

%(GAST) Greenwhich apparent sidereal time expression in degrees
% see http://www.cdeagle.com/ccnum/pdf/demogast.pdf equation 1
GAST = mod(THETAm + dPSI.*cos((EPSILONm+dEPSILON)*pi/180),360);


