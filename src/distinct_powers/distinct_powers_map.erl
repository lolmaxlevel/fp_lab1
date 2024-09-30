-module(distinct_powers_map).

%% API
-export([count_distinct_terms/0]).

% Function to count distinct terms
count_distinct_terms() ->
    Terms = generate_powers(),
    UniqueTerms = filter_unique(Terms),
    Count = length(UniqueTerms),
    Count.

% Function to generate powers using map
generate_powers() ->
    lists:flatten(lists:map(fun(A) ->
        lists:map(fun(B) ->
            math:pow(A, B)
        end, lists:seq(2, 100))
    end, lists:seq(2, 100))).

% Function to filter unique terms
filter_unique(Terms) ->
    lists:usort(Terms).