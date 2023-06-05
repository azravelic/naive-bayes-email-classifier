function tf = contains(str, pattern)
%MYCONTAINS Check if a pattern is contained in a string
%   TF = MYCONTAINS(STR, PATTERN) returns a logical array TF that indicates
%   whether each element of the string array STR contains the specified
%   pattern.

    % Create a regular expression pattern that matches the entire string
    % (with word boundaries)
    regexPattern = ['\b', regexptranslate('escape', pattern), '\b'];

    % Use the regular expression pattern to search for matches in the string
    idx = regexp(str, regexPattern, 'once');

    % Convert the index array to a logical array
    tf = ~cellfun(@isempty, idx);
end

