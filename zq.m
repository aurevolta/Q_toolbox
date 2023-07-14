function q0 = zq(n)
% ZQ Null rotation unitary quaternion
%
% q0 = zq creates the null rotation, or identity, quaternion. [q0] = [0;0;0;1]
% Q0 = zq(n) creates [n] null rotation quaternions. [Q0] has dimension
% [4xn].
% 
% Note: also q0 = -zq represent the null rotation quaternion. 
%
% see also ZDQ.

% SPDX-License-Identifier: Apache-2.0
% 2016 Aureliano Rivolta

%%

if nargin == 0
    q0 = [0;0;0;1];
else
    q0 = [zeros(3,n);ones(1,n)];
end

end