%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Performs foreground/background segmentation based on a graph cut
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% INPUT: 
%        im: input image  in double format 
%        scribbleMask: 
%               scribbleMask(i,j) = 2 means pixel(i,j) is a foreground seed
%               scribbleMask(i,j) = 1 means pixel(i,j) is a background seed
%               scribbleMask(i,j) = 0 means pixel(i,j) is not a seed
%        lambda: parameter for graph cuts
%        numClusters: parameter for kmeans
%        inftCost: parameter for infinity cost constraints
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% OUTPUT:   segm is the segmentation mask of the  same size as input image im
%           segm(i,j) = 1 means pixel (i,j) is the foreground
%           segm(i,j) = 0 means pixel (i,j) is the background
%
%           eng_finish: the energy of the computed segmentation
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [segm,eng_finish]  = segmentGC(im,scribbleMask,lambda,numClusters,inftyCost)

[row,col,d] = size(im);
if(numClusters ~= 0)
    %fprintf("kmeans clustering is not implemented. \n");
    %return
    R = im(:,:,1);
    G = im(:,:,2);
    B = im(:,:,3);
    kmean([R(:),G(:),B(:)], numClusters);
    
else
    %get the dataB & F based on inftyCoust
    
    %get size of scribbleMast
    [row_m, col_m] = size(scribbleMask);
    %generate dataB & dataF
    dataB = (reshape(scribbleMask, [row_m * col_m, 1])==2) * inftyCost;
    dataF = (reshape(scribbleMask, [row_m * col_m, 1])==1) * inftyCost;
end




%compute sigma^2
sigma_2 = 0;
sum_pq = 0;
average_channels = mean(im, 3);
for row_i = 1: row
    for col_i = 1: col
        if(row_i ~= row)
            sum_pq = sum_pq + (average_channels(row_i, col_i) - average_channels(row_i+1,col_i))^2;
        end
        if(col_i ~= col)
            sum_pq = sum_pq + (average_channels(row_i, col_i) - average_channels(row_i, col_i+1))^2;
        end
    end
end
sigma_2 = sum_pq / (row*(row-1) + col*(col-1));
%compute W_pq
w_pq = [];
    function [index] = getIndex(row, col, currRow, currCol)
        index = (currCol-1)*row + currRow;
    end
for row_i = 1 : row
    for col_i = 1 : col
        if(row_i ~= 1) %if not first row, get W(p,q) with upper 1 pixel
            w_pq = [w_pq; [getIndex(row, col, row_i, col_i), getIndex(row, col, row_i-1, col_i)], lambda*exp(-1*((average_channels(row_i, col_i)-average_channels(row_i-1,col_i))^2)/(2*sigma_2))];
        end
        if(row_i ~= row) %if not last row, get W(p,q) with lower 1 pixel
            w_pq = [w_pq; [getIndex(row, col, row_i, col_i), getIndex(row, col, row_i+1, col_i)], lambda*exp(-1*(((average_channels(row_i, col_i)-average_channels(row_i+1,col_i))^2)/(2*sigma_2)))];
        end
        if(col_i ~= 1) %if not first colomn, get W(p,q) with left 1 pixel
            w_pq = [w_pq; [getIndex(row, col, row_i, col_i), getIndex(row, col, row_i, col_i-1)], lambda*exp(-1*((average_channels(row_i, col_i)-average_channels(row_i,col_i-1))^2)/(2*sigma_2))];
        end
        if(col_i ~= col) %if not last colomn, get W(p,q) with right 1 pixel
            w_pq = [w_pq; [getIndex(row, col, row_i, col_i), getIndex(row, col, row_i, col_i+1)], lambda*exp(-1*((average_channels(row_i, col_i)-average_channels(row_i,col_i+1))^2)/(2*sigma_2))];
        end
    end
end

[labels,eng_start,eng_finish] = solveMinCut(dataB',dataF',w_pq);

segm = reshape(labels, [row,col]);  % return the whole image as the foreground 
end
