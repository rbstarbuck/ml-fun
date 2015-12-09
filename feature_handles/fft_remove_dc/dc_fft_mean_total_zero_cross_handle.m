% abs_fft_mean_total_zero_cross_handle
% author Yixing Liu & Michael Glazer
% created on December 05, 2015
% last modified on December 05, 2015
% @param input matrix is a a N x 3 matrix
% @return a 1 x 3 row vector 

function features = abs_fft_mean_total_zero_cross_handle(input_matrix)
    %average number of 0 crossings
    N = size(input_matrix,1);
    input_matrix(:,1) = abs(fft(input_matrix(:,1)-mean(input_matrix(:,1))));
    input_matrix(:,2) = abs(fft(input_matrix(:,2)-mean(input_matrix(:,2))));
    input_matrix(:,3) = abs(fft(input_matrix(:,3)-mean(input_matrix(:,3))));
    prevXVal = input_matrix(1,1);
    prevYVal = input_matrix(1,2);
    prevZVal = input_matrix(1,3);
    Xcross = 0;
    Ycross = 0;
    Zcross = 0;
    for i = 2:N
        if prevXVal < 0 && input_matrix(i,1) > 0 || prevXVal > 0 && input_matrix(i,1) < 0
            Xcross = Xcross + 1;
            prevXVal = input_matrix(i,1);
        end
        if prevYVal < 0 && input_matrix(i,2) > 0 || prevXVal > 0 && input_matrix(i,2) < 0
            Ycross = Ycross + 1;
            prevYVal = input_matrix(i,2);
        end
        if prevZVal < 0 && input_matrix(i,3) > 0 || prevZVal > 0 && input_matrix(i,3) < 0
            Zcross = Zcross + 1;
            prevZVal = input_matrix(i,2);
        end
    end
    Xmeancross = mean(Xcross);
    Ymeancross = mean(Ycross);
    Zmeancross = mean(Zcross);
    features = [Xmeancross, Ymeancross, Zmeancross];
end
