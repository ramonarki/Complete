%Orbit range elevation azimuth position ground station site latitude longitude
% Richard Rieber
% October 1, 2006
% rrieber@gmail.com
% 
% function topo = ECEFtoAzEl(ECEF, lat, long, h, Rp)
% 
% Revision: 10/1/09 - Added an H1 look up line. Also preallocated memory for 
%                     r, az, and el before for-loop to speed things up.
% Purpose:  This function computes range, elevation, and azimuth of an orbiting object
%           given the ECEF coordinates of the object and the latitude, longitude, and
%           altitude of the tracking station.
% 
% NOTE:  This function requires the use of the subfunction 'R2.m' which creates a
%        rotation matrix about the 2-axis (Y-axis) and 'R3.m' which creates a
%        rotation matrix about the 3-axis (Z-axis).
% 
% Inputs: o ECEF - A 3 x n matrix of position vectors in the ECEF frame of the orbiting
%                  object in km
%         o lat  - A vector of length n providing the latitude of the tracking station
%                  in radians
%         o long - A vector of length n providing the longitude of the tracking station
%                  in radians
%         o h    - A vector of length n providing the height of the tracking station
%                  in km
%         o Rp   - Radius of planet in km.  Default is Earth at 6378.1363 km [OPTIONAL]
% 
% Outputs: o topo - A 3 x n matrix consisting of range in km, elevation in radians,
%                   and azimuth in radians

function topo = ECEFtoAzEl(ECEF, lat, long, h)

%Checking number of inputs for errors
Rp = 6378.1363; %Radius of Earth (km)

%for j = 1:n  %Iterating thru the number of positions provided by user
    r_site = h + Rp;
    R_site = [r_site*cos(lat)*cos(long);
              r_site*cos(lat)*sin(long);
              r_site*sin(lat)];
    
    R_sat = ECEF - R_site;
    
    R_SEZ = R2(pi/2 - lat)*R3(long)*R_sat;
    
    r   = norm(R_SEZ);
    sin_el = R_SEZ(3)/r;
    cos_el = norm(R_SEZ(1:2))/r;
    
    sin_az = R_SEZ(2)/norm(R_SEZ(1:2));
    cos_az = -R_SEZ(1)/norm(R_SEZ(1:2));
    
    el = atan2(sin_el,cos_el);
    az = atan2(sin_az,cos_az);
%end

topo = [r, el, az];