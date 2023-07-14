function q = randq(n)
% RANDQ Random unitary quaternion
%
% q = RANDQ generates a random quaternion with all 4 components taken using
% a rectangular distribution (-1,1). [q] has unitary norm. 
%
% Q = RANDQ(n) generates [n] random quaternion with all 4 components taken using
% a rectangular distribution (-1,1). [Q] is a [4xn] matrix such that 
% [Q]=[q,q,..,q] and each [q] has unitary norm.
%
% see also RANDDQ

% SPDX-License-Identifier: Apache-2.0
% 2016 Aureliano Rivolta

%% old

% if nargin == 0
%     q = 2*(rand(4,1)-.5);
%     % divide by the norm
%     q = q/norm(q);
% else
%     q=2*(rand(4,n)-.5);
%     % computes the norm
%     q_norm=sqrt(sum(q.^2));
%     % divide by the norm
%     q=q./repmat(q_norm,4,1);
% end

%% new (2018)
if nargin == 0
    n=1;
end

% angles
[theta,psi,phi] = generate_random_angles(n);

% euler vector
e = spherical_direction(psi,phi);

% quaternion
q = [e.*repmat(sin(theta/2),3,1)
            cos(theta/2)];

% sign variation        
s = sign(rand(1,n)-.5);
index = find(s<0);
q(:,index)=-q(:,index);

        
end




function e = spherical_direction(psi,phi)
% spherical coordinates into unitary vector
% psi = [-pi,pi] phi = [-pi/2, pi/2]

e = [sin(psi).*cos(phi);sin(psi).*sin(phi);cos(psi)];

end


function [theta,psi,phi] = generate_random_angles(n)
% uniform distribution (currently)

% euler angle theta = [-pi,pi]
theta = (rand(1,n)-.5)*2*pi; 

% psi = [-pi,pi]
psi = (rand(1,n)-.5)*2*pi; 

% phi = [-pi/2, pi/2]
phi = (rand(1,n)-.5)*pi; 

end


