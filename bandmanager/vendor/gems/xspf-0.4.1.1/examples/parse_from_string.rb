require 'xspf'

playlist_document = <<-END_OF_PLAYLIST
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

x = XSPF.new(playlist_document)
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
