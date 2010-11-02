require 'xspf'

f = File.open('playlist-tiersen.m3u', 'r')
tl = XSPF::Tracklist.new
f.each { |line| tl << XSPF::Track.new( { :location => line.gsub(/'/, '\'') } ) unless line =~ /^#EXT/ }
f.close

pl = XSPF::Playlist.new( { :tracklist => tl } )
x = XSPF.new( { :playlist => pl } )

ff = File.open('playlist-tiersen-from-m3u.xspf', 'w')
ff.write(x.to_xml)
ff.close
