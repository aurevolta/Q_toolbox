function xi = q2minimal(q)
% Q2MINIMAL Quaternion to minimal representation conversion
% 
% xi = Q2MINIMAL(q) determines the minimum representation of the [4x1]
% input quaternion [q] and outputs the [3x1] vector [xi].
% 
% If [q] is a [4xn] matrix then [xi] is a [3xn] matrix.
%
% see also MINIMAL2Q, DQ2MINIMAL, MINIMAL2DQ

% SPDX-License-Identifier: Apache-2.0
% 2016 Aureliano Rivolta

%%

% determines the number of inputs
[~,n] = size(q);

if n == 1
    
    % compute the conversion
    if q(4)>=1 || q(4) <= -1
        % null rotation
        xi = [0;0;0];
    else
        % apply the formula
%         xi = q(1:3)*sign(q(4))*acosh(abs(q(4)))/sqrt(q(4)^2-1);
%         simplified
        OMEGA = acos(min([abs(q(4)),1]));
        xi = -OMEGA/sin(OMEGA)*q(1:3)*sign(q(4))*2;
        % the minus sign is so that the exponential map coincides with
        % rotations. Otherwise a transpose would be needed for conversion. 
        % this applies only to q --> xi, the inverse is a direct mapping.
        % notice that 2 * OMEGA is equal to Euler angle
    end
else
    % use recursive procedure
    
    % initialize
    xi = zeros(3,n);
    for i=1:n
        xi(:,i) = q2minimal(q(:,i));
    end
    
end


end