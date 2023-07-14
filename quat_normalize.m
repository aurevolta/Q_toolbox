function qn = quat_normalize(q)
% QUATNORMALIZE Set quaternion modulus to one
%
% qn = QUAT_NORMALIZE(q) set the norm to one of the input quaternion [q] 
% of dimensions [4x1]. 
%
% Qn = QUAT_NORMALIZE(Q) set the norm to one of the input quaternion [q] 
% of dimensions [4xn]. Qn has dimensions [4xn].

% SPDX-License-Identifier: Apache-2.0
% 2016 Aureliano Rivolta

%%
qn = zeros(4,size(q,2),'like',q);
qn(1:4,1:size(q,2)) = q(1:4,1:end)./repmat(sqrt(sum(q(1:4,1:end).^2,1)),4,1);

end