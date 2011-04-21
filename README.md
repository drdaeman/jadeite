# Jadeite — an Erlang implementation of Jade-like language

[Jade][jade] is a template engine heavily influenced by [Haml][haml]
and implemented with JavaScript for [node.js][nodejs].

Jadeite is implementation of Jade-like template engine in Erlang.

## Status

The project is in pre-alpha status. While the task to create is somehow
ambitious, the state of things is, that there's nothing to see yet.

Although, [Neotoma][neotoma]-generated parser seem to work and
`jadeite_parse:parse/1` yields us an AST:

    1> jadeite_parse:parse("html\n    head\n        title This is a test\n").
    [{tag,"html"},
     {indent,4},
     {tag,"head"},
     {indent,8},
     {tag,"title"},
     {text," This is a test"},
     {newline,"\n"}]

As this is a hobby project, the development is irregular and may stall
for quite a long time.

## Limitations and differences

Major:

  - Neotoma 1.4 fails on non-ASCII input because of erlang's `re` module
    deficiency.

Minor:

  - A newline is required at the end of file.

## License

Copyright (c) 2011 Aleksey Zhukov <drdaeman@drdaeman.pp.ru>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

The Software is provided "as is", without warranty of any kind, express or
implied, including but not limited to the warranties of merchantability,
fitness for a particular purpose and noninfringement. In no event shall the
authors or copyright holders be liable for any claim, damages or other
liability, whether in an action of contract, tort or otherwise, arising from,
out of or in connection with the software or the use or other dealings in
the Software.


[jade]: http://jade-lang.com/
  (Jade - Template Engine)
[haml]: http://haml-lang.com/
  (#haml)
[nodejs]: http://nodejs.org/
  (node.js)
[neotoma]: https://github.com/seancribbs/neotoma
  (Erlang library and packrat parser-generator for parsing expression grammar)
