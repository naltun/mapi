require 'ffi'
require 'colorize'
require 'sinatra'
require 'sinatra/reloader' if development?

module MAPI
  extend FFI::Library
  ffi_lib 'lib/target/debug/libmapi.' + FFI::Platform::LIBSUFFIX
  attach_function :get_files_count, [], :int
  attach_function :get_harddisk_avail, [], :int
  attach_function :get_ram_used, [], :int
end

get '/' do
  resp = "MAPI usage:\n" +
         "eg. curl $SERVER_ADDR:$PORT/{endpoint}\n\n" +
         "These endpoints can be:\n" +
         "/cpu\n" +
         "/filescount" +
         "/hdd-available\n" +
         "/ram-used\n\n" +
         'For more information, consider visiting https://github.com/naltun/mapi'
  $stdout.puts '[*] Request to / called...'.colorize(:light_yellow)
  return resp
end

get '/cpu' do
  # fix me
end

get '/filescount' do
  resp = MAPI.get_files_count
  $stdout.puts '[*] Request to /filescount called...'.colorize(:light_yellow)
  return "File Count: #{resp}"
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
