# Makefile

ERL ?= erl
APP := jadeite

.PHONY: deps test

all: deps
	@./rebar compile

deps:
	@./rebar get-deps

clean:
	@./rebar clean

distclean: clean
	@./rebar delete-deps

docs:
	@erl -noshell -run edoc_run application '$(APP)' '"."' '[]'

tests:
	@./rebar eunit

shell: all
	$(ERL) -pz ./ebin
