clc;
clear;
pkg load io;

data_raw = cell2mat(textscan(fopen('spam_ham_dataset.csv'),'%s%s%q%s', 'delimiter', ','));
data = data_raw(2:end,:);
tokens_cell = tokenize(data(:,3));

%creating dictionary

text = cat(2, tokens_cell{:});
[word_list, ~, idx] = unique(text);
word_counts = num2cell(histc(idx, 1:max(idx)));

word_list = word_list';
dict = [word_list word_counts];
dict = sortrows(dict,-2);
dict = dict(2:201, :);

str = data(:, 3); %text column
binary_matrix = zeros(5171,200);

for i  = 1:200
  pattern = dict{i,1};
  contains = @(str, pattern) ~cellfun('isempty', strfind(str, pattern));
  binary_matrix(:,i) = contains(str, pattern);

end

labels = zeros(5171, 1);
for j = 1: 5171
    labels(j) = data{j, 4}-48; %gives me 1 as 49 and 0 as 48, so i subtracted 48 to get 1 and 0 :)
end

dataset = [labels binary_matrix]; %final dataset
[train_data, test_data] = split_train_test(dataset);

counts_train = count_matrix(train_data);
[p_ham, p_spam] = ham_spam_probability(train_data);

predicted_train = predict(train_data(:, 2:end), counts_train, p_ham, p_spam);

counts_test = count_matrix(test_data);
predicted_test= predict(test_data(:, 2:end), counts_test, p_ham, p_spam);


disp("\nTrain Accuracy: ");
disp(mean(double(predicted_train == train_data(:, 1)) * 100));

disp("\nTest Accuracy: ");
disp(mean(double(predicted_test == test_data(:, 1)) * 100));

