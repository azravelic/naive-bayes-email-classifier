function counts = count_matrix(data) %data is matrix with labels and boolean values
  labels = data(:, 1);
  counts = zeros(2, 200);
  spamSamples = sum(data(:, 1) == 1);
  hamSamples = sum(data(:, 1) == 0);

  for i = 1:2
    for j  = 2:201
      counts(i, j-1) = sum(data(data(:, 1) == i-1, j)); %if i=1-> get ham rows; if i=2 ->get spam rows
    endfor

endfor

counts = handle_zero_probability(counts);



  counts(1, :) = counts(1, :)./hamSamples;
  counts(2, :) = counts(2, :)./spamSamples;

  end
