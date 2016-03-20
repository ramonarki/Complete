function T = T3D(THETA)
T = zeros(3,3);
T(1,1) = cos(THETA*pi/180);
T(1,2) = sin(THETA*pi/180);
T(2,1) = -T(1,2);
T(2,2) = T(1,1);
T(3,3) = 1;
