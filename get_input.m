function choice = get_input()
% Get user input while labelling the watermelon
%
% OUTPUT:
%   choice: user input whether continue to add, remove labels or stop

    answer = questdlg("add region, remove region, or stop", ...
        "Select", "+ Add", "- Remove", "□ Stop", "□ Stop");
    
    switch answer
    case '+ Add'
        choice = 1;
    case '- Remove'
        choice = 2;
    case '□ Stop'
        choice = 0;
    end
end

