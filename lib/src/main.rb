require 'ffi'
require 'colorize'
require 'sinatra'
require 'sinatra/reloader' if development?

module MAPI
  extend FFI::Library
  ffi_lib 'target/debug/libmapi.' + FFI::Platform::LIBSUFFIX
  attach_function :get_harddisk_avail, [], :int
  attach_function :get_ram, [], :int
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

get '/harddisk' do
  avail = MAPI.get_harddisk_avail / 1024
#   total = MAPI.get_harddisk_total
#   used = (total - avail) / 1024
#   resp = "Harddisk Space Total: #{total}\n" +
# 	"Harddisk Space Available: #{avail}\n" +
# 	"Harddisk Space Used: #{used}"
  $stdout.puts '[*] Request to /harddisk called...'.colorize(:light_yellow)
  return "#{avail} GB's of harddisk space available..."
end

get '/ram' do
  resp = MAPI.get_ram / 1024
  $stdout.puts '[*] Request to /ram called...'.colorize(:light_yellow)
  return "#{resp} MB's being used..."
end
