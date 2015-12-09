% mean_sample_zero_cross_handle
% author Yixing Liu & Michael Glazer
% created on December 05, 2015
% last modified on December 05, 2015
% @param input matrix is a a N x 3 matrix
% @return a 1 x 3 row vector 

function features = mean_sample_zero_cross_handle(input_matrix)
    %average number of samples recorded between 0 crossings
    N = size(input_matrix,1);
    prevXVal = input_matrix(1,1);
    prevYVal = input_matrix(1,2);
    prevZVal = input_matrix(1,3);
    Xsize = 1;
    Ysize = 1;
    Zsize = 1;
    Xlocs = zeros(1,1);
    Ylocs = zeros(1,1);
    Zlocs = zeros(1,1);
    for i = 2:N
        if prevXVal < 0 && input_matrix(i,1) > 0 || prevXVal > 0 && input_matrix(i,1) < 0
            Xlocs(Xsize) = i;
            Xsize = Xsize + 1;
            prevXVal = input_matrix(i,1);
        end
        if prevYVal < 0 && input_matrix(i,2) > 0 || prevYVal > 0 && input_matrix(i,2) < 0
            Ylocs(Ysize) = i;
            Ysize = Ysize + 1;
            prevYVal = input_matrix(i,2);
        end
        if prevZVal < 0 && input_matrix(i,3) > 0 || prevZVal > 0 && input_matrix(i,3) < 0
            Zlocs(Zsize) = i;
            Zsize = Zsize + 1;
            prevZVal = input_matrix(i,2);
        end
    end
    Xdif = 0;
    Ydif = 0;
    Zdif = 0;
    for i = 2:Xsize-2
        Xdif = Xdif + Xlocs(i) - Xlocs(i-1);
    end
    Xmeancross = Ydif/Xsize;
    for i = 2:Ysize-2
        Ydif = Ydif + Ylocs(i) - Ylocs(i-1);
    end
    Ymeancross = Ydif/Ysize;
    for i = 2:Zsize-2
        Zdif = Zdif + Zlocs(i) - Zlocs(i-1);
    end
    Zmeancross = Zdif/Zsize;
    features = [Xmeancross, Ymeancross, Zmeancross];
end
