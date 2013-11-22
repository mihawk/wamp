REBAR = $(shell pwd)/rebar

.PHONY: 

all: compile

compile:
	$(REBAR) boss c=compile

clean:
	$(REBAR) clean

start:
	./init-dev.sh


wamp: all



###
### Docs
###
docs:
	@$(REBAR) skip_deps=true doc

