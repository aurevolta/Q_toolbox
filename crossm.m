function M = crossm(v)
% CROSSM Vector cross matrix 
%
% M = CROSSM(v) computes the matrix form of the cross product of [v]. 
% c = crossm(a)*b is equivalent to c = cross(a,b).
%
% if [v] is a matrix [3xn] the output M will be [3x3xn]. 
% Supports also symbolic variables. 
%
% see also CROSSMT, CROSSQM, CROSSQP, CROSSQMT, CROSSQPT.

% SPDX-License-Identifier: Apache-2.0
% 2016 Aureliano Rivolta

%%

% determine the number of vectors in input
[~,n] = size(v);

% generates the matrix 
M = zeros(3,3,n,'like',v);

% assign 
M(1,2,:) = -v(3,:);
M(2,1,:) =  v(3,:);
M(1,3,:) =  v(2,:);
M(3,1,:) = -v(2,:);
M(2,3,:) = -v(1,:);
M(3,2,:) =  v(1,:);

end
