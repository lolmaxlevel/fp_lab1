-module(distinct_powers).

%% API
-export([count_distinct_terms/0]).

% Function to filter unique terms

count_distinct_terms() ->
    Terms = generate_powers(),
    % это можно считать редьюсером
    UniqueTerms = filter_unique(Terms),
    Count = length(UniqueTerms),
    Count.

generate_powers() ->
  lists:flatten([[math:pow(X, Y), math:pow(Y, X)] || X <- lists:seq(2,100), Y <- lists:seq(2,100)]).

filter_unique(Terms) ->
    lists:usort(Terms).