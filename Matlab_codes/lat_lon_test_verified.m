%Results verified with values from: 
%http://www.satellite-calculations.com/TLETracker/SatTracker.htm
%& 
%http://www.n2yo.com/?s=33591

%% FIRST QUADRANT  (NORTH-EAST)
% julianDate = 2457460.5;
% hour= 13
% min=52
% sec=53
% coord_x=5547.24799
% coord_y=2432.7857
% coord_z=3948.95998
%Expected: lat=33 lon=3.83  WORKS (ASCENDING) WITH MEMORY

% julianDate = 2457460.5;
% hour= 16
% min=10
% sec=21
% coord_x=-5639.435568
% coord_y=-3693.454912
% coord_z=2589.6898068
%Expected: lat=21.014 lon=158.91 WORKS DESCENDING WITH MEMORY
%% SECOND QUADRANT (NORTH-WEST)
% julianDate = 2457460.5;
% hour= 14
% min=04
% sec=48
% coord_x=2100.67106
% coord_y=-68.411826
% coord_z=6911.06356
% %Expected: lat= 73.08 lon= -24.70  ASCENDING WORKS WITH MEMORY

% julianDate = 2457460.5;
% hour= 14
% min=11
% sec=10
% coord_x=-332.161906
% coord_y=-1479.71471
% coord_z=7059.961733
% %Expected: lat= 77.87 lon= -127.08  WORKS DESCENDING WITH MEMORY

%% THIRD QUADRANT (SOUTH-WEST)
% julianDate = 2457460.5;
% hour= 17
% min=06
% sec=32
% coord_x=6241.541984
% coord_y=3641.590015
% coord_z=-396.390486
%Expected lat=-3.12 lon=-38   WORKS (ASCENDING) WITH MEMORY (LAT)

% julianDate = 2457460.5;
% hour= 13
% min=09
% sec=57
% coord_x=-3425.08042
% coord_y=-789.734263
% coord_z=-6324.08233
%Expected lat=-60.93 lon=-176.101   WORKS (DESCENDING) WITH MEMORY (LAT)

%% FOURTH QUADRANT (SOUTH-EAST)
% julianDate = 2457460.5;
% hour= 16
% min=16
% sec=23
% coord_x=-6273.79017
% coord_y=-3581.96604
% coord_z=-2.26384137
%Expected lat=-0.01 lon=153.90 (DESCENDING) WORKS WITH MEMORY


% julianDate = 2457460.5;
% hour= 13
% min=35
% sec=16
% coord_x=5261.478902
% coord_y=3614.961937
% coord_z=-3415.74006
%Expected lat=-28.15 lon=19.05 WORKS (ASCENDING) WITH MEMORY

%% Program

B=B+1;
re=6378;
UT_hour=(hour*3600+min*60+sec)/3600;

theta=atan(coord_y/coord_x);
T=(julianDate-2451545.0)/36525.0
T0=6.697374558+ (2400.051336*T)+(0.000025862*T^2)+(UT_hour*1.0027379093)
gst=mod(T0,24);
angle_sid=gst*2*pi/24;

lon=mod((theta -angle_sid),2*pi);
r=sqrt(coord_x^2+coord_y^2);
lat = atan(coord_z/r);
alt=r/cos(lat) -re

lat = lat*180/pi
lon=lon*180/pi


if lat>0
    if lon>0 && lon<181 && lat>A
        lon=lon;
    else
        if lon>0 && lat<A
            lon=lon-180;
        else
            lon=lon-360;
        end
    end
else
    if lon>180
    lon=lon-360;
    if lon<0 && lat<A
        lon=lon+180;
    end
    else
        if lat>A
         lon=lon;
        elseif lat<A
            lon=lon-180;
        end
    end
end
lon