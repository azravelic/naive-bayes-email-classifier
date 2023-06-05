function [p_ham, p_spam] = ham_spam_probability(data)


  totalSamples = size(data, 1);

  spamSamples = sum(data(:, 1) == 1);

  hamSamples = sum(data(:, 1) == 0);

  p_spam = spamSamples / totalSamples;
  p_ham = hamSamples / totalSamples;


end
