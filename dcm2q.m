function q = dcm2q(R,v) %#codegen
% DCM2Q DCM to quaternion conversion
%
% q = DCM2Q(R) Converts the DCM [R] of dimensions [3x3] into the
% quaternion [q] with dimensions [4x1].
%
% q21 = DCM2Q(x2,x1) determines the quaternion q21 such that the
% corresponding DCM maps the unit vector x1 into the vectors x2.
%
% The functiomn support multiple conversions: input and output shall be
% concatenated on the third dimension. 
%
% Probably not supported for code generation, it has been coded for
% flexibility, not speed.
%
% see also Q2DCM

% SPDX-License-Identifier: Apache-2.0
% 2016 Aureliano Rivolta

%% pre computation

% determine the size of the first input
[m,n,z] = size(R);

% check if it's dcm conversion or vector conversion
if nargin == 1 && n == 3
    
    % DCM conversion
    v = eye(3);
    
    if z > 1 % multiple inputs
        % recursive
        q = zeros(4,z);
        for i = 1 : z
            q(:,i) = dcm2q(R(:,:,i));
        end
        return
    end
    
    if abs(det(R)-1) >1e-14 || m ~= 3
        error 'input DCM is not a DCM'
    end
    
elseif nargin > 1
    
    % optimal q that rotates input 2 vectors to input 1 vectors
    [~,n2] = size(v);
    
    if n ~= n2
        error 'input dimensions non consistens'
    end
    
    if z > 1 % multiple inputs
        % recursive
        q = zeros(4,z);
        for i = 1 : z
            q(:,i) = dcm2q(R(:,:,i),v(:,:,i));
        end
        return
    end
    
    % force normalization
    v=v./repmat(sqrt(sum(v.^2)),3,1);
    
end

%% actual computation

% initialize
Qi = zeros(4);

% sum the contribution over all measurements or all 3 orthogonal directions
for i = 1:n
    Qi = crossqm([R(:,i);0])'*crossqp([v(:,i);0])+Qi;
end

% generates the matrix
Q = .5*(Qi+Qi');

% just in case for code generation
coder.extrinsic('svd'); 
[S,V]=deal(zeros(4));

% extract the singular values and eigenvectors
[S,V,~] = svd(Q);

% find the maximum eigenvalue
[~,index] = max(diag(V));

% output as q the eigenvector of the maximum eigenvalue
q = S(:,index);

end