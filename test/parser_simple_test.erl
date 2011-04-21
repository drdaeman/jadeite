-module(parser_simple_test).
-include_lib("eunit/include/eunit.hrl").

simple_parsing_test() ->
  Matches = [
    {"html", {tag, "html"}},
    {":javascript", {filter, "javascript"}},
    {"!!! 5", {doctype, "5"}},
    {"#content", {id, "content"}},
    {".notice", {classname, "notice"}}
  ],
  lists:map(fun({S, E}) ->
    ?assertEqual([E, {newline, "\n"}], jadeite_parse:parse(S ++ "\n"))
  end, Matches).

structure_parsing_test() ->
  Matches = [
    ["!!! 5\nhtml\n    head\n", {doctype, "5"}, {newline, "\n"},
                                {tag, "html"},
                                {indent, 4}, {tag, "head"}, {newline, "\n"}],
    ["p Hello, world!\n", {tag, "p"}, {text, " Hello, world!"}, {newline, "\n"}],
    ["li: i Warning\n", {tag, "li"}, {colon}, {tag, "i"}, {text, " Warning"}, {newline, "\n"}]
  ],
  lists:map(fun([H|T]) ->
    ?assertEqual(T, jadeite_parse:parse(H))
  end, Matches).
