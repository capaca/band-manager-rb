$:.unshift File.join(File.dirname(__FILE__), "..", "lib")

require 'xspf'
require 'test/unit'

class TestGenerateTrack < Test::Unit::TestCase

  def setup
    @track = XSPF::Track.new( { :location => 'http://some.nifty.locati.on/file.ogg', :identifier => 'http://musicbrainz.org/track/860287b7-ff56-4c12-a346-da2722414aed', :title => 'Democracy', :creator => 'Leonard Cohen', :meta_rel => 'http://www.example.org/key', :meta_content => 'value' } )
  end
  
  def test_class
    assert_instance_of(XSPF::Track, @track)
  end

  def test_creation_with_arguments
    assert_equal('http://musicbrainz.org/track/860287b7-ff56-4c12-a346-da2722414aed', @track.identifier)
    assert_equal('http://some.nifty.locati.on/file.ogg', @track.location)
    assert_equal('Leonard Cohen', @track.creator)
    assert_equal('Democracy', @track.title)
  end

  def test_to_xml

    xml = "<track><location>http://some.nifty.locati.on/file.ogg</location><identifier>http://musicbrainz.org/track/860287b7-ff56-4c12-a346-da2722414aed</identifier><title>Democracy</title><creator>Leonard Cohen</creator><meta rel='http://www.example.org/key'>value</meta></track>"

    assert_equal(xml, @track.to_xml)
  end

  def test_nil
    assert_nil(@track.album)
  end

  def test_error
    assert_raise(NoMethodError) { @track.inexistent_method }
  end
  
end
