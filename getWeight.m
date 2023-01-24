function [weightsArray] = getWeight(param1)
% Calculate the weights for the center and radius in each iteration
%
% INPUT:
%   param1: number of iteration
%
% OUTPUT:
%   weightsArray: calculated weights

weightsArray = ones(1, param1);
weightsArray = weightsArray / param1;
end

