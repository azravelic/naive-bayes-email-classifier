function [tokens_cell]  = tokenize(data)
%Function takes raw text column and preprocesses it

  text_col = lower(data);
  text_col = cellfun(@(x) regexprep(x, '[^\w\s]', ''), text_col, 'UniformOutput', false);
  tokens_cell = cellfun(@(s) strsplit(s, " "), text_col, "UniformOutput", false);
  tokens_cell = cellfun(@(x) x(cellfun(@(y) ischar(y) && numel(y) >= 4, x)), tokens_cell, 'UniformOutput', false);
  tokens_cell = cellfun(@(x) cellfun(@(y) regexprep(y, '\d', ''), x, 'UniformOutput', false), tokens_cell, 'UniformOutput', false);

  end
