$:.unshift File.join(File.dirname(__FILE__), "..", "test")

require 'test/unit'
require 'tc_parse_xspf'
require 'tc_parse_playlist'
require 'tc_parse_tracklist'
require 'tc_parse_track'
require 'tc_generate_xspf'
require 'tc_generate_playlist'
require 'tc_generate_tracklist'
require 'tc_generate_track'
require 'tc_dogfood'
require 'tc_parse_output_formats'
require 'tc_generate_output_formats'
require 'tc_rdoc'

