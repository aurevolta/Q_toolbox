function q = minimal2q(xi)
% MINIMAL2Q Minimal representation to quaternion conversion
% 
% q = MINIMAL2Q(xi) determines the quaternion representation [q] with 
% dimensions [4x1] from the input vector xi with dimensions [3x1]
% 
% If [xi] is a [3xn] matrix then [q] is a [4xn] matrix.
%
% see also Q2MINIMAL, DQ2MINIMAL, MINIMAL2DQ

% SPDX-License-Identifier: Apache-2.0
% 2016 Aureliano Rivolta

%%

% determines the number of inputs
[~,n] = size(xi);

if n == 1
    
    OMEGA = norm(xi)/2;
    q = zq;
    
    if OMEGA == 0
        % output the identity quaternion
        return
    end
    
%     q(1:3,1) = xi*sinh(1i*OMEGA)/(1i*OMEGA)/2;
%     q(4,1) = cosh(1i*OMEGA);
% simplified 
    q(1:3,1) = -xi*sin(OMEGA)/(OMEGA)/2;
    q(4,1) = cos(OMEGA);
    % notice that 2 *OMEGA is equal to Euler angle
    % sign fixed to project possibly on the positive hemispace
else
    % use recursive procedure
    
    % initialize
    q = zeros(4,n);
    for j=1:n
        q(:,j) = minimal2q(xi(:,j));
    end
    
end


end