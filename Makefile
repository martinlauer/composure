
all:
	@echo "Try: make tests"
	@false

tests:
	cd test && make tests

clean::
	rm -f test/*~ test/t/*~
	rm -rf test/composure_test
