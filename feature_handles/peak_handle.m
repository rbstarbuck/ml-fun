% peak_handle
% author Yixing Liu & Michael Glazer
% created on December 05, 2015
% last modified on December 05, 2015
% @param input matrix is a a N x 3 matrix
% @return a 1 x 3 row vector 

function features = peak_handle(input_matrix)
    Xpeak = -Inf;
    Ypeak = -Inf;
    Zpeak = -Inf;
    N = size(input_matrix,1);
    for i = 1:N
        xVal = input_matrix(N,1);
        yVal = input_matrix(N,2);
        zVal = input_matrix(N,3);
        if xVal > Xpeak
            Xpeak = xVal;
        end
        if yVal > Ypeak
            Ypeak = yVal;
        end
        if zVal > Zpeak
            Zpeak = zVal;
        end
    end
    
    features = [Xpeak, Ypeak, Zpeak];
end
