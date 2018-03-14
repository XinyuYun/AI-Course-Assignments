function [M,P] = seamV_DP(E)
% Function addSeamV returns the input 4-channel image with the seam vector
% added
% Inputs  im4(m*n): gray scale energy image E 
%           
% Outputs M and P(m*n): arrays M and P that are constructed during dynamic programming

% ====================== My IMPLEMENTATION HERE ======================
%initialize M with E, P with all -1, and all indexes in P are from 1, first
%row is all -1
M = E;
P = -1 * ones(size(E));
%start interation from seconde row of E
for row = 2 : size(E, 1)
    %from fist column to end
    for col = 1 : size(E, 2) 
        %option 2 is always there
        option2 = M(row-1, col);
        if(col == 1)%if currently it is first column, set opiton1 = option2 to avoid out of boundary issue
            option1 = option2;           
            option3 = M(row-1, col+1);
        elseif(col == size(E, 2))%if at last column, set option3 = option2 to avoid out of boundary
            option1 = M(row-1, col-1);
            option3 = option2;
        else
            option1 = M(row-1, col-1);
            option3 = M(row-1, col+1);
        end
        
        if(option1 <= option2 && option1 <= option3)
            M(row, col) = E(row, col) + option1;
            if(col == 1)%if it is first column, P should be set to current column
                P(row, col) = col;
            else
                P(row, col) = col - 1;
            end
        elseif(option2 <= option1 && option2 <= option3)
            M(row, col) = E(row, col) + option2;
            P(row, col) = col;
        else % if program goes to else block belowed, current column must not the last one, no need to check again
            M(row, col) = E(row, col) + option3;
            P(row, col) = col + 1;  
        end
    end
end

% ====================================================================
end
