function M = crossqm(q)
% CROSSQM Quaternion multiplication matrix (-)
%
% M = CROSSQM(q) computes the multiplication matrix form of a [4x1]
% quaternion [q]. 
% If [q] is a matrix [4xn] the output [M] will be [4x4xn].
% Supports also symbolic variables. 
%
% see also CROSSM, CROSSMT, CROSSQP, CROSSQMT, CROSSQPT.

% SPDX-License-Identifier: Apache-2.0
% 2016 Aureliano Rivolta

%%

% determine the number of vectors in input
[~,n] = size(q);

% generates the matrix 
M = zeros(4,4,n,'like',q);

% assign 
M(1:3,1:3,:) = crossmt(q(1:3,:));

M(1,1,:) = q(4,:);
M(2,2,:) = q(4,:);
M(3,3,:) = q(4,:);
M(4,4,:) = q(4,:);

M(4,1,:) = -q(1,:);
M(4,2,:) = -q(2,:);
M(4,3,:) = -q(3,:);

M(1,4,:) = q(1,:);
M(2,4,:) = q(2,:);
M(3,4,:) = q(3,:);

end