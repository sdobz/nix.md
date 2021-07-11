
SRC = $(wildcard src/nixmd/*.tl) $(wildcard src/nixmd/*/*.tl)
LUA = $(SRC:src/%.tl=build/%.lua)

SRC_LUA = $(wildcard src/nixmd/*.lua) $(wildcard src/nixmd/*/*.lua)
LUA_LUA = $(SRC_LUA:src/%.lua=build/%.lua)

TL = tl
TLFLAGS = --quiet -I src

build/%.lua: src/%.tl
	$(TL) $(TLFLAGS) gen --check $< -o $@

build/%.lua: src/%.lua
	cp $< $@

default: build/nixmd $(LUA) $(LUA_LUA)

build/nixmd:
	mkdir -p $@

all: clean default

clean:
	rm -rf build tmp

.PHONY: clean
