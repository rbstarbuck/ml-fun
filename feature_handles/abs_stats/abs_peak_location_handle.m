% abs_peak_location_handle
% author Yixing Liu & Michael Glazer
% created on December 05, 2015
% last modified on December 05, 2015
% @param input matrix is a a N x 3 matrix
% @return a 1 x 3 row vector 

function features = abs_peak_location_handle(input_matrix)
    Xapeak = -Inf;
    Yapeak = -Inf;
    Zapeak = -Inf;
    Xaloc = 0;
    Yaloc = 0;
    Zaloc = 0;
    N = size(input_matrix,1);
    for i = 1:N
        xAbsVal = input_matrix(i,1);
        yAbsVal = input_matrix(i,2);
        zAbsVal = input_matrix(i,3);
        if xAbsVal > Xapeak
            Xapeak = xAbsVal;
            Xaloc = i;
        end
        if yAbsVal > Yapeak
            Yapeak = yAbsVal;
            Yaloc = i;
        end
        if zAbsVal > Zapeak
            Zapeak = zAbsVal;
            Zaloc = i;
        end
    end
    
    features = [Xaloc, Yaloc, Zaloc];
end
