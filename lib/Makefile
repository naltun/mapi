ifeq ($(shell uname), Darwin)
    EXT := dylib
else
    EXT := so
endif

all: target/debug/libmapi.$(EXT)

target/debug/libmapi.$(EXT): src/lib.rs Cargo.toml
	cargo build --release

clean:
	rm -rf target