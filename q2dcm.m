function R = q2dcm(q)
% Q2DCM Direction Cosine Matrix conversion from quaternion
%
% R = Q2DCM(q) computes using the minimum number of computations the
% DCM using quaternions. [R] has dimension [3x3] while the input [q]
% must be [4x1]. It is equivalent of [R,0;0,1] = crossqp(q)'*crossqm(q);
%
% If [q] is a [4xn] matrix then [R] is a [3x3xn] matrix.
%
% see also DCM2Q
%

% SPDX-License-Identifier: Apache-2.0
% 2016 Aureliano Rivolta

%%

% determine the number of quaternions
[~,n] = size(q);

% generates the matrix
R = zeros(3,3,n,'like',q);

% fill the matrix
for i = 1 : n
    
    % compute composing matrices
    QPT = crossqp(q(:,i))';
    QM = crossqm(q(:,i));
    
    % compose without computing unnecessary rows and columns
    R(:,:,i) = QPT(1:3,:)*QM(:,1:3);
    
end

end