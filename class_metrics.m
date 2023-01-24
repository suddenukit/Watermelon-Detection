function metrics = class_metrics(conf_mat)
% compute metrics from confusion matrix
% refactored from https://github.com/preethamam 
% INPUT:
%   img_name: confusion matrix
%
% OUTPUT:
%   metrics: Accuracy Precision Recall F1score Specificity IoU
% 
    TP = conf_mat(1, 1);
    FP = conf_mat(2, 1);
    FN = conf_mat(1, 2);
    TN = conf_mat(2,2);
    Precision = TP / (TP+FP); % positive predictive value (PPV)
    Recall    = TP / (TP+FN); % true positive rate (TPR), sensitivity
    if ((TN / (TN+FP)) > 1)
        Specificity = 1;
    elseif ((TN / (TN+FP)) < 0)
        Specificity = 0;
    else
        Specificity = TN / (TN+FP); % (SPC) or true negative rate
    end
    Accuracy = (TP+TN)/(TP+TN+FP+FN); % Accuracy
    F1score  = 2*TP /(2*TP + FP + FN); %dice
    IoU = TP / (TP + FP + FN);
    
    metrics = [Accuracy Precision Recall F1score Specificity IoU];
end