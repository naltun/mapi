ifeq ($(shell uname), Darwin)
    EXT := dylib
else
    EXT := so
endif

all: target/debug/libmapi.$(EXT)
	ruby src/main.rb

target/debug/libmapi.$(EXT): src/lib.rs Cargo.toml
	cargo build

clean:
	rm -rf target