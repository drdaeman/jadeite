-module(utils_test).
-include_lib("eunit/include/eunit.hrl").

text_length_test() ->
  Matches = [
      {"", 0},
      {"test", 4},
      {"     ", 5},
      {"\t", 8},
      {"test\t", 8},
      {"test\ttest", 12},
      {"\t\ttest", 20}
  ],
  lists:map(fun({S, E}) ->
    ?assertEqual(E, jadeite_utils:text_length(S))
  end, Matches).
