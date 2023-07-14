function q = q_gen(axis,angle)
% Q_GEN Single rotation quaternion generator
% q = QGEN(axis,angle) generates a single rotation quaternion [q] with
% [axis] as Euler axis and [angle] as Euler angle.
%
% [axis] can be a column vector [3x1] or a char such as 'x', 'y' or 'z'. In
% the latter cases the Euler axis is taken as [1;0;0], [0;1;0] or [0;0;1].
%
% If [axis] and [angle] have more then one column, a recursive procedure
% will compute subsequent rotations to generate the output [q]. Rotations
% are applied in column order. [axis] must be composed of [3xn] vectors or
% [1xn] characters string. 

% SPDX-License-Identifier: Apache-2.0
% 2016 Aureliano Rivolta

%%

% determine the number of rotations
[~,n] = size(axis);
[~,na] = size(angle);

% check consistency
if na ~= n
    error('axis of rotations and angles dimensions are not consistent')
end

%%
if n == 1
    % generate a single quaternion
    
    if ischar(axis)
        % if axis is a char, get the corresponding unitary vector
        switch axis
            case 'x'
                axis = [1;0;0];
            case 'y'
                axis = [0;1;0];
            case 'z'
                axis = [0;0;1];
            otherwise
                error('wrong axis input')
        end
    else
        axis=axis/norm(axis); % normalize to be sure
    end

    % generate the quaternion
    q = [axis*sin(angle/2)
        cos(angle/2)];
else
    % generates a quaternion made by subsequent rotations using a recursive
    % procedure calling again this function one by one.
    
    % computes the first one
    q = q_gen(axis(:,1),angle(1));
    
    for i = 2 : n
        % rotate again and again until the end of the sequence
        q = crossqm(q_gen(axis(:,i),angle(i)))*q;
    end
    
    
end

end