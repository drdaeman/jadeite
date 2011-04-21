-module(test_suite).
-include_lib("eunit/include/eunit.hrl").

all_test_() ->
    [
        {module, parser_simple_test},
        {module, utils_test}
    ].
