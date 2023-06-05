function predictions = predict(data, counts, p_ham, p_spam)

  predictions = zeros(length(data),1);
  for i = 1: length(data)
    p_s_ham= 1;
    p_s_spam = 1;
    for j = 1: 200

      if(data(i, j)==1)
        p_s_ham = p_s_ham*counts(1,j);
        p_s_spam = p_s_spam*counts(2,j);
      else
        p_s_ham = p_s_ham*(1-counts(1,j));
        p_s_spam = p_s_spam*(1-counts(2,j));
      endif

    endfor

    p_ham_s  = p_s_ham*p_ham;
    p_spam_s = p_s_spam*p_spam;
    prediction = compare(p_ham_s, p_spam_s);

  endfor

end
