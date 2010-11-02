$:.unshift File.join(File.dirname(__FILE__), "..", "lib")

require 'xspf'
require 'test/unit'

class TestParsePlaylist < Test::Unit::TestCase
  
  def setup
    @playlist_document = <<END_OF_PLAYLIST
<?xml version="1.0" encoding="UTF-8"?>
<playlist version="0" xmlns="http://xspf.org/ns/0/">
    <title>XSPlF it up!</title>
    <creator>Mayhem &amp; Chaos Coordinator</creator>
    <annotation>Just a few songs to enjoy while you XSPlF it up!</annotation>
    <info>http://mayhem-chaos.net/xspf/xspf_it_up.html</info>
    <identifier>http://mayhem-chaos.net/xspf/xspf_it_up/1.0</identifier>
    <attribution>
        <location>ihttp://mayhem-chaos.net/xspf/xspf_it_up.html</location>
    </attribution>
    <trackList>
        <track>
        <identifier>http://musicbrainz.org/track/bdab6db0-2fd6-4166-a5fa-fbf2ff213793</identifier>
        <title>I Wanna Get High</title>
        <creator>Cypress Hill</creator>
        <duration>174613</duration>
        <meta rel="http://musicbrainz.org/track">http://musicbrainz.org/mm-2.1/track/bdab6db0-2fd6-4166-a5fa-fbf2ff213793</meta>
        </track>
        <track>
        <identifier>bdc846e7-6c26-4193-82a6-8d1b5a4d3429</identifier>
        <title>Smoke Two Joints</title>
        <creator>Sublime</creator>
        <duration>175466</duration>
        <meta rel="http://musicbrainz.org/track">http://musicbrainz.org/mm-2.1/track/bdc846e7-6c26-4193-82a6-8d1b5a4d3429</meta>
        </track>
        <track>
        <identifier>http://musicbrainz.org/track/7d9776f7-d428-40dc-a425-3c6e3dce4d58</identifier>
        <title>Hash Pipe</title>
        <creator>Weezer</creator>
        <duration>186533</duration>
        <meta rel="http://musicbrainz.org/track">http://musicbrainz.org/mm-2.1/track/7d9776f7-d428-40dc-a425-3c6e3dce4d58</meta>
        </track>
    </trackList>
</playlist>
END_OF_PLAYLIST

    xspf = XSPF.new(@playlist_document)
    @playlist = XSPF::Playlist.new(xspf)
  end

  def test_class
    assert_instance_of(XSPF::Playlist, @playlist)
  end

  def test_version
    assert_equal(@playlist.version, "0")
  end

  def test_xmlns
    assert_equal(@playlist.xmlns, "http://xspf.org/ns/0/")
  end

  def test_title
    assert_equal(@playlist.title, "XSPlF it up!")
  end

  def test_creator
    assert_equal(@playlist.creator, "Mayhem & Chaos Coordinator")
  end

  def test_annotation
    assert_equal(@playlist.annotation, "Just a few songs to enjoy while you XSPlF it up!")
  end

  def test_info
    assert_equal(@playlist.info, "http://mayhem-chaos.net/xspf/xspf_it_up.html")
  end

  def test_identifier
    assert_equal(@playlist.identifier, "http://mayhem-chaos.net/xspf/xspf_it_up/1.0")
  end

  def test_nil
    assert_nil(@playlist.image)
  end
  
  def test_error
    assert_raise(NoMethodError) { @playlist.inexistent_method }
  end

end

class TestError < Test::Unit::TestCase

  def test_creation_error
    assert_raise(TypeError) { XSPF::Playlist.new('error') }
  end
  
end
