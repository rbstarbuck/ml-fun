% entropy_handle
% author Yixing Liu & Michael Glazer
% created on December 05, 2015
% last modified on December 05, 2015
% @param input matrix is a a N x 3 matrix
% @return a 1 x 3 row vector 

function features = entropy_handle(input_matrix)
    N = size(input_matrix,1);
    Xenergy = sum(abs(fft(input_matrix(:,1))).^2);
    Yenergy = sum(abs(fft(input_matrix(:,2))).^2);
    Zenergy = sum(abs(fft(input_matrix(:,3))).^2);
    %XenergyNorm = Xenergy/sum(Xenergy + 1e-12);
    %YenergyNorm = Yenergy/sum(Yenergy + 1e-12);
    %ZenergyNorm = Zenergy/sum(Zenergy + 1e-12);
    %Xentropy = -sum(XenergyNorm*log(XenergyNorm+1e-12)/log2(N));
    %Yentropy = -sum(YenergyNorm*log(YenergyNorm+1e-12)/log2(N));
    %Zentropy = -sum(ZenergyNorm*log(ZenergyNorm+1e-12)/log2(N));
    
    Xentropy = -sum(Xenergy.*log(Xenergy+1e-12)/log2(N));
    Yentropy = -sum(Yenergy.*log(Yenergy+1e-12)/log2(N));
    Zentropy = -sum(Zenergy.*log(Zenergy+1e-12)/log2(N));
    
    features = [Xentropy, Yentropy, Zentropy];
end
