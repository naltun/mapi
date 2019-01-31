# M-API

### What is it?
_Monitor API_ let's you monitor your system via a RESTful API.

This project uses the lovely Rust for the backend and the venerated Ruby for the web server...

Did I mention this program uses [FFI programming](https://en.wikipedia.org/wiki/Foreign_function_interface)? It's my first FFI-based project, and the performance may not be optimized.

That being said, this project is to help me learn Ru{st|by} FFI programming. Is it serving its purpose? Absolutely.

For more information on Rust FFI programming, please visit [The Rust FFI Omnibus](http://jakegoulding.com/rust-ffi-omnibus/).

##### ATTN:
This repository is _not_ ready for any production use, and probably never will be. For one, this is a project to help me learn FFI programming; production use should have the web server reimplemented in pure Rust.

Also, features need to be implemented, such as additional system monitoring endpoints and API authorization.

That said, please feel free to mess with the software.

### Installing
There are two files you will need to use:
* `Gemfile`, located at the project root
* `Cargo.toml`, located in `lib/`

Run `bundle install` at the project's root directory, then head into `lib/` and run `cargo build`.

#### Rust requirements
```shell
libc = "0.2.0"
sysinfo = "0.8.0"
```

#### Ruby requirements
```shell
ffi
colorize
sinatra

# For testing/development
sinatra-reloader
```

### License

GNU GPLv2 because software freedom?

Love your Free/Libre, Open Source Software. For more information on freedom-respecting software, please visit [Wikipedia](https://en.wikipedia.org/wiki/Free_software_movement).
