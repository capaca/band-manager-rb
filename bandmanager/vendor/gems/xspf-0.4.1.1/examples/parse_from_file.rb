require 'xspf'

f = File.new("playlist.xspf")
x = XSPF.new(f)
f.close
pl = XSPF::Playlist.new(x)
tl = XSPF::Tracklist.new(pl)

puts "XML version: #{x.version}"
puts "XML encoding: #{ x.encoding}"
puts "XSPF version: #{pl.version}"
puts "Namespace: #{pl.xmlns}"
puts "Playlist title: #{pl.title}"
puts "Playlist creator: #{pl.creator}"
puts "Playlist annotation: #{pl.annotation}"
puts "Playlist info: #{pl.info}"
puts "Playlist identifier: #{pl.identifier}"
puts "Playlist attribution: #{pl.attribution}"
puts "Tracklist: #{pl.tracklist}"
tl.tracks.each do |t|
    puts "Track identifier: #{t.identifier}"
    puts "Track title: #{t.title}"
    puts "Track creator: #{t.creator}"
    puts "Track duration: #{t.duration}"
    puts "Track metainformation: link=#{t.meta_rel} content=#{t.meta_content}"
end

# Convert the XSPF document to SMIL
x.to_smil

# Convert the XSPF document to HTML
x.to_html

# Convert the XSPF document in a M3U playlist
x.to_m3u