function q = randqn(sigma,n)
% RANDQN Normal distribution unitary quaternion
%
% q = RANDQN generates a random quaternion with all 4 components taken using
% a rectangular distribution (-1,1). [q] has unitary norm. 
%
% Q = RANDQN(n) generates [n] random quaternion with all 4 components taken using
% a rectangular distribution (-1,1). [Q] is a [4xn] matrix such that 
% [Q]=[q,q,..,q] and each [q] has unitary norm.
%
% see also RANDDQ, RANDQ

% SPDX-License-Identifier: Apache-2.0
% 2016 Aureliano Rivolta

%%

if nargin == 0
    sigma = 1;
    n = 1;
elseif nargin == 1
    n = 1;
end


% random angles
RAND_ANG = sigma*randn(3,n);

% initialize
q  = zeros(4,n);

for i = 1 : n
    q(:,i) = q_gen('xyz',RAND_ANG(:,i)');
end


end

