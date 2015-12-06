function y = action_resize(input, num)
%% resize input matrix to fill in pca
% created on 1st December by Yixing
% last modified on 1st December

% @param input: N by 5 matrix      
% @param num: number of action samples
% @param y: return a N/num by 3*num matrix 

% Note: sliding window approach is adopted to increase the number of
% training data

N = size(input,1);
% M = floor (N/num) for normal partition
M = N - num; % for sliding window approach
y = zeros(M, 3*num);
k = 1;
for i = 1:M
    for j = 0:num-1
        y(i,j*3+1) = input(k,2);
        y(i,j*3+2) = input(k,3);
        y(i,j*3+3) = input(k,4);
        k = k+1;
    end
    % sliding window approach
    k = k - num + 1;
end

