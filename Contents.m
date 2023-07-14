% QUATERNION_TOOLBOX
% This toolbox contains useful functions related to quaternions for
% attitude, i.e. SO(3)
%
% Version 1.0 23-05-2017
%
% Vector Matrix forms
%   crossm   - Vector cross matrix 
%   crossmt  - Vector cross matrix transpose
% 
% Quaternion Matrix forms
%   crossqm  - Quaternion multiplication matrix (-)
%   crossqmt - Quaternion multiplication matrix (-T)
%   crossqp  - Quaternion multiplication matrix (+)
%   crossqpt - Quaternion multiplication matrix (+T)
%
% Quaternion generation routines
%   zq       - Null rotation unitary quaternion
%   q_gen    - Single rotation quaternion generator
%   randq    - Random unitary quaternion
%   randqn    - Normal distribution unitary quaternion
%
% Conversions
%   q2dcm    - Direction Cosine Matrix conversion from quaternion
%   dcm2q     - DCM to quaternion conversion
%   minimal2q - Minimal representation to quaternion conversion
%   q2minimal - Quaternion to minimal representation conversion
%   qconj    - Conjugate quaternion
%
% Utilities
%   quatnormalize - Set quaternion modulus to one

% Tutorial
%   quat_demo - Quaternion demo