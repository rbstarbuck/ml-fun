%% abs_mean_handle
% author Yixing Liu & Michael Glazer
% created on October 19, 2015
% last modified on October 19, 2015
% @param input matrix is a a N x 3 matrix
% @return 1 x 3 a row vector
function features = abs_mean_handle(input_matrix)
    Xsum = 0;
    Ysum = 0;
    Zsum = 0; 
    N = size(input_matrix,1);
    for i = 1:N
        Xsum = Xsum + abs(input_matrix(i,1));
        Ysum = Ysum + abs(input_matrix(i,2));
        Zsum = Zsum + abs(input_matrix(i,3)); 
    end
    
    features = [Xsum/N, Ysum/N, Zsum/N];
end
