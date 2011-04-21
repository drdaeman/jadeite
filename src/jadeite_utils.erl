-module(jadeite_utils).
-author('Aleksey Zhukov <drdaeman@drdaeman.pp.ru>').
-export([text_length/1, text_length/2, split/2]).

split(Instr, Token) ->
    split(Instr, Token, []).

split(Instr, Token, Result) ->
    Tpos = string:rstr(Instr, Token),
    if Tpos =:= 0 ->
        [Instr | Result];
    true ->
        NewResult = [string:substr(Instr, Tpos + string:len(Token)) | Result],
        split(string:substr(Instr, 1, Tpos - 1),Token,NewResult)
    end.

text_length(Text) ->
    text_length(Text, 8).

text_length([], _) ->
    0;

text_length(Text, TabSize) ->
    PartLengths = lists:map(fun string:len/1, split(Text, "\t")),
    LastPart = lists:last(PartLengths),
    TabbedLengths = lists:map(
        fun(A) -> (A div TabSize + 1) * TabSize end,
        lists:sublist(PartLengths, length(PartLengths) - 1)),
    lists:sum(TabbedLengths) + LastPart.
