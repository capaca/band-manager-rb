# This code does NOT work because 'pl' is a new object, unrelated to 'x'; and 'tl' is a new object, unrelated to 'pl'

require 'xspf'

f = File.new("playlist.xspf")
x = XSPF.new(f)
pl = XSPF::Playlist.new(x)
tl = XSPF::Tracklist.new(pl)

some_other_track = XSPF::Track.new( {
        :location => 'http://some.nifty.locati.on/file1.ogg',
        :identifier => 'http://musicbrainz.org/track/9f342af1-982d-4c26-9f61-3ac258957a83',
        :title => 'Plus au sud',
        :creator => 'Yann Tiersen',
        :tracknum => '1',
        :album => 'Tout est calme',
        :meta_rel => 'http://www.example.org/key',
        :meta_content => 'value'
        } )

tl << some_other_track
pl.title = 'My modified playlist'
f = File.open('playlist.xspf', 'w')
f.write(x.to_xml)
f.close