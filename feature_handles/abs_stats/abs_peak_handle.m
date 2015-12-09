% abs_peak_handle
% author Yixing Liu & Michael Glazer
% created on December 05, 2015
% last modified on December 05, 2015
% @param input matrix is a a N x 3 matrix
% @return a 1 x 3 row vector 

function features = abs_peak_handle(input_matrix)
    Xapeak = -Inf;
    Yapeak = -Inf;
    Zapeak = -Inf;
    N = size(input_matrix,1);
    for i = 1:N
        xAbsVal = abs(input_matrix(N,1));
        yAbsVal = abs(input_matrix(N,2));
        zAbsVal = abs(input_matrix(N,3));
        if xAbsVal > Xapeak
            Xapeak = xAbsVal;
        end
        if yAbsVal > Yapeak
            Yapeak = yAbsVal;
        end
        if zAbsVal > Zapeak
            Zapeak = zAbsVal;
        end
    end
    
    features = [Xapeak, Yapeak, Zapeak];
end
