function qc = qconj(q)
% QCONJ Conjugate quaternion
%
% qc = QCONJ(q) generates the conjugate of the quaternion q [4x1]
%
% Qc = QCONJ(Q) generates the conjugate of the quaternions contained
% in Q [4xn]. Qc is a [4xn] matrix.
%
% see also DQ_CONJ

% SPDX-License-Identifier: Apache-2.0
% 2016 Aureliano Rivolta

%%
qc = [-q(1:3,:)
       q(4,:)];

end