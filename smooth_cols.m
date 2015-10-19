function yy = smooth_cols(y, span, method)
yy = zeros(size(y));
for i = 1:size(y,2)
   yy(:,i) = smooth(y(:,i), span, method);
end
end
