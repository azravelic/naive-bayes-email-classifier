function [train_data, test_data] = split_train_test(data)
    nRows = size(data, 1);
    nTrain = round(nRows * 0.7);


    train_data = data(1:nTrain, :);
    test_data = data(nTrain+1:end, :);

end



