$:.unshift File.join(File.dirname(__FILE__), "..", "lib")

require 'xspf'
require 'test/unit'

class TestOuputFormats < Test::Unit::TestCase
  
  def setup
    
    track1 = XSPF::Track.new( { :location => 'http://some.nifty.locati.on/file1.ogg', :identifier => 'http://musicbrainz.org/track/9f342af1-982d-4c26-9f61-3ac258957a83', :title => 'Plus au sud', :creator => 'Yann Tiersen', :tracknum => '1', :album => 'Tout est calme', :meta_rel => 'http://www.example.org/key', :meta_content => 'value' } )

    track2 = XSPF::Track.new( { :location => 'http://some.nifty.locati.on/file2.ogg', :identifier => 'http://musicbrainz.org/track/eba1a9a9-1810-41f1-8cc9-2a00dda0a68c', :title => 'Les Grandes Marées', :creator => 'Yann Tiersen', :tracknum => '2', :album => 'Tout est calme', :meta_rel => 'http://www.example.org/key', :meta_content => 'value' } )

    track3 = XSPF::Track.new( { :location => 'http://some.nifty.locati.on/file3.ogg', :identifier => 'http://musicbrainz.org/track/0c18ef8c-04fa-47d5-b078-66ab6a819a83', :title => 'La Crise', :creator => 'Yann Tiersen', :tracknum => '3', :album => 'Tout est calme', :meta_rel => 'http://www.example.org/key', :meta_content => 'value' } )

    track4 = XSPF::Track.new( { :location => 'http://some.nifty.locati.on/file4.ogg', :identifier => '  http://musicbrainz.org/track/0f66dd52-bda0-4526-979d-af95ac637cc4', :title => 'Tout est calme', :creator => 'Yann Tiersen', :tracknum => '4', :album => 'Tout est calme', :meta_rel => 'http://www.example.org/key', :meta_content => 'value' } )

    track5 = XSPF::Track.new( { :location => 'http://some.nifty.locati.on/file5.ogg', :identifier => '  http://musicbrainz.org/track/a06ef58e-019e-409a-bf72-9bd080012ac3', :title => 'La Rupture', :creator => 'Yann Tiersen', :tracknum => '5', :album => 'Tout est calme', :meta_rel => 'http://www.example.org/key', :meta_content => 'value' } )

    track6 = XSPF::Track.new( { :location => 'http://some.nifty.locati.on/file6.ogg', :identifier => 'http://musicbrainz.org/track/f82c0a06-d4a8-41a5-9238-029e38fa9d7c', :title => 'La Relève', :creator => 'Yann Tiersen', :tracknum => '6', :album => 'Tout est calme', :meta_rel => 'http://www.example.org/key', :meta_content => 'value' } )

    track7 = XSPF::Track.new( { :location => 'http://some.nifty.locati.on/file7.ogg', :identifier => 'http://musicbrainz.org/track/97591e2b-967e-47eb-b2b3-9a450cd33352', :title => 'La Pharmacie', :creator => 'Yann Tiersen', :tracknum => '7', :album => 'Tout est calme', :meta_rel => 'http://www.example.org/key', :meta_content => 'value' } )

    track8 = XSPF::Track.new( { :location => 'http://some.nifty.locati.on/file8.ogg', :identifier => 'http://musicbrainz.org/track/ae7f8502-778d-4f5e-9dba-6fc5d553ad0e', :title => 'La Terrasse', :creator => 'Yann Tiersen', :tracknum => '8', :album => 'Tout est calme', :meta_rel => 'http://www.example.org/key', :meta_content => 'value' } )

    track9 = XSPF::Track.new( { :location => 'http://some.nifty.locati.on/file9.ogg', :identifier => 'http://musicbrainz.org/track/6e937503-9d01-428c-84b5-1200bab9d1c6', :title => "L''Étal", :creator => 'Yann Tiersen', :tracknum => '9', :album => 'Tout est calme', :meta_rel => 'http://www.example.org/key', :meta_content => 'value' } )

    track10 = XSPF::Track.new( { :location => 'http://some.nifty.locati.on/file10.ogg', :identifier => 'http://musicbrainz.org/track/2c4c845c-907a-4d96-940a-bbe8b2d0f126', :title => 'La Découverte', :creator => 'Yann Tiersen', :tracknum => '10', :album => 'Tout est calme', :meta_rel => 'http://www.example.org/key', :meta_content => 'value' } )

    tracklist = XSPF::Tracklist.new

    tracklist << track1
    tracklist << track2
    tracklist << track3
    tracklist << track4
    tracklist << track5
    tracklist << track6
    tracklist << track7
    tracklist << track8
    tracklist << track9
    tracklist << track10

    playlist = XSPF::Playlist.new( {:xmlns => 'http://xspf.org/ns/0/', :title => 'Tout est calme', :creator => 'Yann Tiersen', :license => 'Redistribution or sharing not allowed', :info => 'http://www.yanntiersen.com/', :tracklist => tracklist, :meta_rel => 'http://www.example.org/key', :meta_content => 'value' } )

    @xspf = XSPF.new( { :playlist => playlist } )

    @expected_m3u_output = <<END_OF_M3U
http://some.nifty.locati.on/file1.ogg
http://some.nifty.locati.on/file2.ogg
http://some.nifty.locati.on/file3.ogg
http://some.nifty.locati.on/file4.ogg
http://some.nifty.locati.on/file5.ogg
http://some.nifty.locati.on/file6.ogg
http://some.nifty.locati.on/file7.ogg
http://some.nifty.locati.on/file8.ogg
http://some.nifty.locati.on/file9.ogg
http://some.nifty.locati.on/file10.ogg
END_OF_M3U

    @expected_smil_output = <<END_OF_SMIL
<?xml version="1.0"?>
<smil xmlns:xspf="http://xspf.org/ns/0/">
  <body>
    <seq>
      <audio src="http://some.nifty.locati.on/file1.ogg"/>
      <audio src="http://some.nifty.locati.on/file2.ogg"/>
      <audio src="http://some.nifty.locati.on/file3.ogg"/>
      <audio src="http://some.nifty.locati.on/file4.ogg"/>
      <audio src="http://some.nifty.locati.on/file5.ogg"/>
      <audio src="http://some.nifty.locati.on/file6.ogg"/>
      <audio src="http://some.nifty.locati.on/file7.ogg"/>
      <audio src="http://some.nifty.locati.on/file8.ogg"/>
      <audio src="http://some.nifty.locati.on/file9.ogg"/>
      <audio src="http://some.nifty.locati.on/file10.ogg"/>
    </seq>
  </body>
</smil>
END_OF_SMIL

    @expected_html_ouput = <<END_OF_HTML
<html xmlns:xspf="http://xspf.org/ns/0/">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tout est calme</title>
<link href="http://www.w3.org/StyleSheets/Core/Modernist" rel="stylesheet" type="text/css" media="screen">
<style type="text/css">
dl {
  margin-bottom: 5px;
}

.track {
}

.location {
}

.creator {
}

.top {
}

.duration {
}

.trackList {
}

.info {
}

.annotation {
}

.attribution {
}

.image {
}

.meta {
}

.license {
}

.trackNum {
}

.date {
}

.identifier {
}

.link {
}


		</style>
</head>
<body>
<h1>Tout est calme</h1>
<dl class="top">
<dt class="creator">creator</dt>
<dd class="creator">Yann Tiersen</dd>
<dt class="info">info</dt>
<dd class="info"><a href="http://www.yanntiersen.com/">http://www.yanntiersen.com/</a></dd>
<dt class="license">license</dt>
<dd class="license"><a href="Redistribution%20or%20sharing%20not%20allowed">Redistribution or sharing not allowed</a></dd>
<dt class="meta">meta</dt>
<dd class="meta"><a href="value">value</a></dd>
<dt class="trackList">trackList</dt>
<dd class="trackList"><ol>
<li><dl class="track">
<dt class="location">location</dt>
<dd class="location"><a href="http://some.nifty.locati.on/file1.ogg">http://some.nifty.locati.on/file1.ogg</a></dd>
<dt class="identifier">identifier</dt>
<dd class="identifier">http://musicbrainz.org/track/9f342af1-982d-4c26-9f61-3ac258957a83</dd>
<dt class="creator">creator</dt>
<dd class="creator">Yann Tiersen</dd>
<dt class="trackNum">trackNum</dt>
<dd class="trackNum">1</dd>
<dt class="meta">meta</dt>
<dd class="meta"><a href="value">value</a></dd>
</dl></li>
<li><dl class="track">
<dt class="location">location</dt>
<dd class="location"><a href="http://some.nifty.locati.on/file2.ogg">http://some.nifty.locati.on/file2.ogg</a></dd>
<dt class="identifier">identifier</dt>
<dd class="identifier">http://musicbrainz.org/track/eba1a9a9-1810-41f1-8cc9-2a00dda0a68c</dd>
<dt class="creator">creator</dt>
<dd class="creator">Yann Tiersen</dd>
<dt class="trackNum">trackNum</dt>
<dd class="trackNum">2</dd>
<dt class="meta">meta</dt>
<dd class="meta"><a href="value">value</a></dd>
</dl></li>
<li><dl class="track">
<dt class="location">location</dt>
<dd class="location"><a href="http://some.nifty.locati.on/file3.ogg">http://some.nifty.locati.on/file3.ogg</a></dd>
<dt class="identifier">identifier</dt>
<dd class="identifier">http://musicbrainz.org/track/0c18ef8c-04fa-47d5-b078-66ab6a819a83</dd>
<dt class="creator">creator</dt>
<dd class="creator">Yann Tiersen</dd>
<dt class="trackNum">trackNum</dt>
<dd class="trackNum">3</dd>
<dt class="meta">meta</dt>
<dd class="meta"><a href="value">value</a></dd>
</dl></li>
<li><dl class="track">
<dt class="location">location</dt>
<dd class="location"><a href="http://some.nifty.locati.on/file4.ogg">http://some.nifty.locati.on/file4.ogg</a></dd>
<dt class="identifier">identifier</dt>
<dd class="identifier">  http://musicbrainz.org/track/0f66dd52-bda0-4526-979d-af95ac637cc4</dd>
<dt class="creator">creator</dt>
<dd class="creator">Yann Tiersen</dd>
<dt class="trackNum">trackNum</dt>
<dd class="trackNum">4</dd>
<dt class="meta">meta</dt>
<dd class="meta"><a href="value">value</a></dd>
</dl></li>
<li><dl class="track">
<dt class="location">location</dt>
<dd class="location"><a href="http://some.nifty.locati.on/file5.ogg">http://some.nifty.locati.on/file5.ogg</a></dd>
<dt class="identifier">identifier</dt>
<dd class="identifier">  http://musicbrainz.org/track/a06ef58e-019e-409a-bf72-9bd080012ac3</dd>
<dt class="creator">creator</dt>
<dd class="creator">Yann Tiersen</dd>
<dt class="trackNum">trackNum</dt>
<dd class="trackNum">5</dd>
<dt class="meta">meta</dt>
<dd class="meta"><a href="value">value</a></dd>
</dl></li>
<li><dl class="track">
<dt class="location">location</dt>
<dd class="location"><a href="http://some.nifty.locati.on/file6.ogg">http://some.nifty.locati.on/file6.ogg</a></dd>
<dt class="identifier">identifier</dt>
<dd class="identifier">http://musicbrainz.org/track/f82c0a06-d4a8-41a5-9238-029e38fa9d7c</dd>
<dt class="creator">creator</dt>
<dd class="creator">Yann Tiersen</dd>
<dt class="trackNum">trackNum</dt>
<dd class="trackNum">6</dd>
<dt class="meta">meta</dt>
<dd class="meta"><a href="value">value</a></dd>
</dl></li>
<li><dl class="track">
<dt class="location">location</dt>
<dd class="location"><a href="http://some.nifty.locati.on/file7.ogg">http://some.nifty.locati.on/file7.ogg</a></dd>
<dt class="identifier">identifier</dt>
<dd class="identifier">http://musicbrainz.org/track/97591e2b-967e-47eb-b2b3-9a450cd33352</dd>
<dt class="creator">creator</dt>
<dd class="creator">Yann Tiersen</dd>
<dt class="trackNum">trackNum</dt>
<dd class="trackNum">7</dd>
<dt class="meta">meta</dt>
<dd class="meta"><a href="value">value</a></dd>
</dl></li>
<li><dl class="track">
<dt class="location">location</dt>
<dd class="location"><a href="http://some.nifty.locati.on/file8.ogg">http://some.nifty.locati.on/file8.ogg</a></dd>
<dt class="identifier">identifier</dt>
<dd class="identifier">http://musicbrainz.org/track/ae7f8502-778d-4f5e-9dba-6fc5d553ad0e</dd>
<dt class="creator">creator</dt>
<dd class="creator">Yann Tiersen</dd>
<dt class="trackNum">trackNum</dt>
<dd class="trackNum">8</dd>
<dt class="meta">meta</dt>
<dd class="meta"><a href="value">value</a></dd>
</dl></li>
<li><dl class="track">
<dt class="location">location</dt>
<dd class="location"><a href="http://some.nifty.locati.on/file9.ogg">http://some.nifty.locati.on/file9.ogg</a></dd>
<dt class="identifier">identifier</dt>
<dd class="identifier">http://musicbrainz.org/track/6e937503-9d01-428c-84b5-1200bab9d1c6</dd>
<dt class="creator">creator</dt>
<dd class="creator">Yann Tiersen</dd>
<dt class="trackNum">trackNum</dt>
<dd class="trackNum">9</dd>
<dt class="meta">meta</dt>
<dd class="meta"><a href="value">value</a></dd>
</dl></li>
<li><dl class="track">
<dt class="location">location</dt>
<dd class="location"><a href="http://some.nifty.locati.on/file10.ogg">http://some.nifty.locati.on/file10.ogg</a></dd>
<dt class="identifier">identifier</dt>
<dd class="identifier">http://musicbrainz.org/track/2c4c845c-907a-4d96-940a-bbe8b2d0f126</dd>
<dt class="creator">creator</dt>
<dd class="creator">Yann Tiersen</dd>
<dt class="trackNum">trackNum</dt>
<dd class="trackNum">10</dd>
<dt class="meta">meta</dt>
<dd class="meta"><a href="value">value</a></dd>
</dl></li>
</ol></dd>
</dl>
</body>
</html>
END_OF_HTML


    @expected_soundblox_ouput = <<END_OF_SOUNDBLOX
<?xml version="1.0"?>
<soundbloxdata xmlns:xspf="http://xspf.org/ns/0/">
  <customize autostart="false" startopen="true"/>
  <playlist name="Tout est calme">
    <track>
      <mp3url>http://some.nifty.locati.on/file1.ogg</mp3url>
      <downloadurl>http://some.nifty.locati.on/file1.ogg</downloadurl>
    </track>
    <track>
      <mp3url>http://some.nifty.locati.on/file2.ogg</mp3url>
      <downloadurl>http://some.nifty.locati.on/file2.ogg</downloadurl>
    </track>
    <track>
      <mp3url>http://some.nifty.locati.on/file3.ogg</mp3url>
      <downloadurl>http://some.nifty.locati.on/file3.ogg</downloadurl>
    </track>
    <track>
      <mp3url>http://some.nifty.locati.on/file4.ogg</mp3url>
      <downloadurl>http://some.nifty.locati.on/file4.ogg</downloadurl>
    </track>
    <track>
      <mp3url>http://some.nifty.locati.on/file5.ogg</mp3url>
      <downloadurl>http://some.nifty.locati.on/file5.ogg</downloadurl>
    </track>
    <track>
      <mp3url>http://some.nifty.locati.on/file6.ogg</mp3url>
      <downloadurl>http://some.nifty.locati.on/file6.ogg</downloadurl>
    </track>
    <track>
      <mp3url>http://some.nifty.locati.on/file7.ogg</mp3url>
      <downloadurl>http://some.nifty.locati.on/file7.ogg</downloadurl>
    </track>
    <track>
      <mp3url>http://some.nifty.locati.on/file8.ogg</mp3url>
      <downloadurl>http://some.nifty.locati.on/file8.ogg</downloadurl>
    </track>
    <track>
      <mp3url>http://some.nifty.locati.on/file9.ogg</mp3url>
      <downloadurl>http://some.nifty.locati.on/file9.ogg</downloadurl>
    </track>
    <track>
      <mp3url>http://some.nifty.locati.on/file10.ogg</mp3url>
      <downloadurl>http://some.nifty.locati.on/file10.ogg</downloadurl>
    </track>
  </playlist>
</soundbloxdata>
END_OF_SOUNDBLOX

  end

  def test_m3u
    assert_equal(@expected_m3u_output, @xspf.to_m3u)
  end
  
  def test_smil
    assert_equal(@expected_smil_output, @xspf.to_smil)
  end

  def test_html
    assert_equal(@expected_html_ouput, @xspf.to_html)
  end

  def test_soundblox
    assert_equal(@expected_soundblox_ouput, @xspf.to_soundblox)
  end

  def test_error
    assert_raise(NoMethodError) { @xspf.to_other_format }
  end
end