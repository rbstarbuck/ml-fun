function smoothed_data = smooth_1d(data, min_run_size)
%% SMOOTH_1D Eliminates runs of values < min_run_size from data

%% find centers of runs < min_run_size

last_idx = 1;
current_val = data(1);
bad_window_centers = [];

for idx = 2:length(data)
    % are we at the end of the current run?
    if data(idx) ~= current_val
        current_idx = idx;
        
        run_size = current_idx - last_idx;
        
        % is run size too small?
        if run_size < min_run_size
            window_center = current_idx - floor(run_size / 2);
            bad_window_centers(end + 1) = window_center;
        end
        
        % set params to reflect we're on a new run
        last_idx = current_idx;
        current_val = data(current_idx);
    end
end

%% make "bad windows" from run centers

bad_windows = [];
num_windows = length(bad_window_centers);

idx = 1;
while idx <= num_windows
    first_idx = idx;
    while idx <= num_windows-1 && bad_window_centers(idx + 1) - bad_window_centers(idx) < min_run_size
        idx = idx + 1;
    end
    last_idx = idx;
    
    first_idx = bad_window_centers(first_idx) - 2;
    if first_idx < 1
        first_idx = 1;
    end
    
    last_idx = bad_window_centers(last_idx) + 1;
    if last_idx > length(data)
        last_idx = length(data);
    end
    
    window = [first_idx , last_idx];
    bad_windows = [bad_windows ; window];
    
    idx = idx + 1;
end

%% relabel data inside bad windows

num_windows = size(bad_windows, 1);
smoothed_data = data;

for idx = 1:num_windows
    window = bad_windows(idx,:);
    first_idx = window(1);
    last_idx = window(2);
    first_val = data(window(1));
    last_val = data(window(2));
    
    if first_idx == 1
        first_val = last_val;
    elseif last_idx == length(data)
        last_val = first_val;
    end
       
    cutoff = first_idx + floor((last_idx - first_idx) / 2);
    
    for didx = first_idx:cutoff
        smoothed_data(didx) = first_val;
    end
    for didx = cutoff+1:last_idx
        smoothed_data(didx) = last_val;
    end
end

end

