-module(basic_SUITE).

-include_lib("common_test/include/ct.hrl").
-include_lib("stdlib/include/assert.hrl").

-export([all/0]).
-export([regular_data_tests/1]).

all() ->
    [regular_data_tests].

%% Common test requires Config argument in test cases
regular_data_tests(_) ->
    test_regular_case(4613732).


test_regular_case(Expected) ->
    ?assertEqual(Expected, fib_even_module:sum_even_fib()).