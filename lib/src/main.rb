require 'ffi'
require 'colorize'
require 'sinatra'
require 'sinatra/reloader' if development?

module MAPI
  extend FFI::Library
  ffi_lib 'target/debug/libmapi.' + FFI::Platform::LIBSUFFIX
  attach_function :get_harddisk_avail, [], :int
  attach_function :get_ram_used, [], :int
end

# Retrieve all information
get '/' do
  # fix me
end

get '/cpu' do
  # fix me
end

get '/filescount' do
  # fix me
end

get '/hdd-available' do
  resp = MAPI.get_harddisk_avail / 1024
  $stdout.puts '[*] Request to /hdd-available called...'.colorize(:light_yellow)
  return "HDD Space available: #{resp} GB's"
end

get '/ram-used' do
  resp = MAPI.get_ram_used / 1024
  $stdout.puts '[*] Request to /ram-used called...'.colorize(:light_yellow)
  return "RAM Used: #{resp} GB's"
end
