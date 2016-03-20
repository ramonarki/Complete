%----------------------- Begin Code Sequence -----------------------------%
% Purpose:                                                                %
% Convert ECI (CIS, Epoch J2000.0) Coordinates to WGS 84 (CTS, ECEF)      %
% Coordinates. This function has been vectorized for speed.               %
%                                                                         %
% Inputs:                                                                 %
%-------                                                                  %
%JD                                                     Julian Date
%
%r_ECI                  [3 x 1]                         Position Vector
%                                                       in ECI coordinate
%                                                       frame of reference
%
%
%
% Outputs:
%---------                                                                %
%r_ECEF                 [3 x 1]                         Position Vector in
%                                                       ECEF coordinate
%                                                       frame of reference
%
%
% References:
%-------------
%Orbital Mechanics with Numerit, http://www.cdeagle.com/omnum/pdf/csystems.pdf
%
%
% Function Dependencies:
%------------------
% JD2GMST
%------------------------------------------------------------------       %
% Programed by Darin Koblick  07-05-2010                                  %
% Modified on 03/01/2012 to add acceleration vector support
% Modified on 16/03/2015 by Ramon A. Gomez Moya to use in Mathscript for
% Telecom Bretagne - ISAE Project
%------------------------------------------------------------------       %
function [r_ECEF] = ECItoECEF(JD,r_ECI)

%Calculate the Greenwich Apparent Sideral Time (THETA)
%See http://www.cdeagle.com/omnum/pdf/csystems.pdf equation 27
THETA = JD2GAST(JD);

%Assemble the transformation matricies to go from ECI to ECEF
%See http://www.cdeagle.com/omnum/pdf/csystems.pdf equation 26
r_ECEF = squeeze(MultiDimMatrixMultiply(T3D(THETA),r_ECI));
%----------------------------- End Code-----------------------------------%



