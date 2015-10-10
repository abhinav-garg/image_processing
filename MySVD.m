function [U, S, V] = MySVD(A)
    AAT = A*A.';
    ATA = A.'*A;
    [U, S2_U] = eig(AAT);
    [V, S2_V] = eig(ATA);
    [m,n] = size(A);
    S = abs(sqrt(S2_U));
    S = S(:,2:m);
end