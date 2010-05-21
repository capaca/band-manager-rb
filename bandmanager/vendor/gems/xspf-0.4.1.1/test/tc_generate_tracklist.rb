$:.unshift File.join(File.dirname(__FILE__), "..", "lib")

require 'xspf'
require 'test/unit'

class TestGenerateTracklist < Test::Unit::TestCase
  
  def setup
    @track1 = XSPF::Track.new( { :location => 'http://some.nifty.locati.on/file1.ogg', :identifier => 'http://musicbrainz.org/track/9f342af1-982d-4c26-9f61-3ac258957a83', :title => 'Plus au sud', :creator => 'Yann Tiersen', :tracknum => '1', :album => 'Tout est calme', :meta_rel => 'http://www.example.org/key', :meta_content => 'value' } )

    @track2 = XSPF::Track.new( { :location => 'http://some.nifty.locati.on/file2.ogg', :identifier => 'http://musicbrainz.org/track/eba1a9a9-1810-41f1-8cc9-2a00dda0a68c', :title => 'Les Grandes Marées', :creator => 'Yann Tiersen', :tracknum => '2', :album => 'Tout est calme', :meta_rel => 'http://www.example.org/key', :meta_content => 'value' } )

    @track3 = XSPF::Track.new( { :location => 'http://some.nifty.locati.on/file3.ogg', :identifier => 'http://musicbrainz.org/track/0c18ef8c-04fa-47d5-b078-66ab6a819a83', :title => 'La Crise', :creator => 'Yann Tiersen', :tracknum => '3', :album => 'Tout est calme', :meta_rel => 'http://www.example.org/key', :meta_content => 'value' } )

    @track4 = XSPF::Track.new( { :location => 'http://some.nifty.locati.on/file4.ogg', :identifier => '  http://musicbrainz.org/track/0f66dd52-bda0-4526-979d-af95ac637cc4', :title => 'Tout est calme', :creator => 'Yann Tiersen', :tracknum => '4', :album => 'Tout est calme', :meta_rel => 'http://www.example.org/key', :meta_content => 'value' } )

    @track5 = XSPF::Track.new( { :location => 'http://some.nifty.locati.on/file5.ogg', :identifier => '  http://musicbrainz.org/track/a06ef58e-019e-409a-bf72-9bd080012ac3', :title => 'La Rupture', :creator => 'Yann Tiersen', :tracknum => '5', :album => 'Tout est calme', :meta_rel => 'http://www.example.org/key', :meta_content => 'value' } )

    @track6 = XSPF::Track.new( { :location => 'http://some.nifty.locati.on/file6.ogg', :identifier => 'http://musicbrainz.org/track/f82c0a06-d4a8-41a5-9238-029e38fa9d7c', :title => 'La Relève', :creator => 'Yann Tiersen', :tracknum => '6', :album => 'Tout est calme', :meta_rel => 'http://www.example.org/key', :meta_content => 'value' } )

    @track7 = XSPF::Track.new( { :location => 'http://some.nifty.locati.on/file7.ogg', :identifier => 'http://musicbrainz.org/track/97591e2b-967e-47eb-b2b3-9a450cd33352', :title => 'La Pharmacie', :creator => 'Yann Tiersen', :tracknum => '7', :album => 'Tout est calme', :meta_rel => 'http://www.example.org/key', :meta_content => 'value' } )

    @track8 = XSPF::Track.new( { :location => 'http://some.nifty.locati.on/file8.ogg', :identifier => 'http://musicbrainz.org/track/ae7f8502-778d-4f5e-9dba-6fc5d553ad0e', :title => 'La Terrasse', :creator => 'Yann Tiersen', :tracknum => '8', :album => 'Tout est calme', :meta_rel => 'http://www.example.org/key', :meta_content => 'value' } )

    @track9 = XSPF::Track.new( { :location => 'http://some.nifty.locati.on/file9.ogg', :identifier => 'http://musicbrainz.org/track/6e937503-9d01-428c-84b5-1200bab9d1c6', :title => "L''Étal", :creator => 'Yann Tiersen', :tracknum => '9', :album => 'Tout est calme', :meta_rel => 'http://www.example.org/key', :meta_content => 'value' } )

    @track10 = XSPF::Track.new( { :location => 'http://some.nifty.locati.on/file10.ogg', :identifier => 'http://musicbrainz.org/track/2c4c845c-907a-4d96-940a-bbe8b2d0f126', :title => 'La Découverte', :creator => 'Yann Tiersen', :tracknum => '10', :album => 'Tout est calme', :meta_rel => 'http://www.example.org/key', :meta_content => 'value' } )

    @tracklist = XSPF::Tracklist.new({})

    @tracklist << @track1
    @tracklist << @track2
    @tracklist << @track3
    @tracklist << @track4
    @tracklist << @track5
    @tracklist << @track6
    @tracklist << @track7
    @tracklist << @track8
    @tracklist << @track9
    @tracklist << @track10
    
  end

  def test_tracklist_class
    assert_instance_of(XSPF::Tracklist, @tracklist)
  end

  def test_tracklist_creation_from_nil
    tl = XSPF::Tracklist.new
    assert_instance_of(XSPF::Tracklist, tl)
  end

  def test_number_of_tracks
    assert_equal(@tracklist.tracks.size, 10)
  end

  def test_track_class
    @tracklist.tracks.each do |t|
      assert_instance_of(XSPF::Track, t)
    end
  end

  def test_error
    assert_raise(NoMethodError) { @tracklist.inexistent_method }
  end

  def test_to_xml
    xml = "<trackList><track><location>http://some.nifty.locati.on/file1.ogg</location><identifier>http://musicbrainz.org/track/9f342af1-982d-4c26-9f61-3ac258957a83</identifier><title>Plus au sud</title><creator>Yann Tiersen</creator><album>Tout est calme</album><trackNum>1</trackNum><meta rel='http://www.example.org/key'>value</meta></track><track><location>http://some.nifty.locati.on/file2.ogg</location><identifier>http://musicbrainz.org/track/eba1a9a9-1810-41f1-8cc9-2a00dda0a68c</identifier><title>Les Grandes Mar\303\251es</title><creator>Yann Tiersen</creator><album>Tout est calme</album><trackNum>2</trackNum><meta rel='http://www.example.org/key'>value</meta></track><track><location>http://some.nifty.locati.on/file3.ogg</location><identifier>http://musicbrainz.org/track/0c18ef8c-04fa-47d5-b078-66ab6a819a83</identifier><title>La Crise</title><creator>Yann Tiersen</creator><album>Tout est calme</album><trackNum>3</trackNum><meta rel='http://www.example.org/key'>value</meta></track><track><location>http://some.nifty.locati.on/file4.ogg</location><identifier>  http://musicbrainz.org/track/0f66dd52-bda0-4526-979d-af95ac637cc4</identifier><title>Tout est calme</title><creator>Yann Tiersen</creator><album>Tout est calme</album><trackNum>4</trackNum><meta rel='http://www.example.org/key'>value</meta></track><track><location>http://some.nifty.locati.on/file5.ogg</location><identifier>  http://musicbrainz.org/track/a06ef58e-019e-409a-bf72-9bd080012ac3</identifier><title>La Rupture</title><creator>Yann Tiersen</creator><album>Tout est calme</album><trackNum>5</trackNum><meta rel='http://www.example.org/key'>value</meta></track><track><location>http://some.nifty.locati.on/file6.ogg</location><identifier>http://musicbrainz.org/track/f82c0a06-d4a8-41a5-9238-029e38fa9d7c</identifier><title>La Rel\303\250ve</title><creator>Yann Tiersen</creator><album>Tout est calme</album><trackNum>6</trackNum><meta rel='http://www.example.org/key'>value</meta></track><track><location>http://some.nifty.locati.on/file7.ogg</location><identifier>http://musicbrainz.org/track/97591e2b-967e-47eb-b2b3-9a450cd33352</identifier><title>La Pharmacie</title><creator>Yann Tiersen</creator><album>Tout est calme</album><trackNum>7</trackNum><meta rel='http://www.example.org/key'>value</meta></track><track><location>http://some.nifty.locati.on/file8.ogg</location><identifier>http://musicbrainz.org/track/ae7f8502-778d-4f5e-9dba-6fc5d553ad0e</identifier><title>La Terrasse</title><creator>Yann Tiersen</creator><album>Tout est calme</album><trackNum>8</trackNum><meta rel='http://www.example.org/key'>value</meta></track><track><location>http://some.nifty.locati.on/file9.ogg</location><identifier>http://musicbrainz.org/track/6e937503-9d01-428c-84b5-1200bab9d1c6</identifier><title>L\303\211tal</title><creator>Yann Tiersen</creator><album>Tout est calme</album><trackNum>9</trackNum><meta rel='http://www.example.org/key'>value</meta></track><track><location>http://some.nifty.locati.on/file10.ogg</location><identifier>http://musicbrainz.org/track/2c4c845c-907a-4d96-940a-bbe8b2d0f126</identifier><title>La D\303\251couverte</title><creator>Yann Tiersen</creator><album>Tout est calme</album><trackNum>10</trackNum><meta rel='http://www.example.org/key'>value</meta></track></trackList>"
    assert_equal( xml, @tracklist.to_xml )
  end

end
