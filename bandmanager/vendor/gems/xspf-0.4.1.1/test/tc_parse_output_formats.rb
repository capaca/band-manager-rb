$:.unshift File.join(File.dirname(__FILE__), "..", "lib")

require 'xspf'
require 'test/unit'

class TestOuputFormats < Test::Unit::TestCase
  
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
                <location>http://mayhem-chaos.net/xspf/xspf_it_up.html</location>
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

    @expected_smil_output = <<END_OF_SMIL
<?xml version="1.0"?>
<smil xmlns:xspf="http://xspf.org/ns/0/">
  <body>
    <seq/>
  </body>
</smil>
END_OF_SMIL

# This @expected_html_ouput is not 100% correct because we do not parse the <attribution> element, therefore XSPF for Ruby does not generate the same HTML xsltproc does.
    @expected_html_ouput = <<END_OF_HTML
<html xmlns:xspf="http://xspf.org/ns/0/">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>XSPlF it up!</title>
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
<h1>XSPlF it up!</h1>
<dl class="top">
<dt class="creator">creator</dt>
<dd class="creator">Mayhem &amp; Chaos Coordinator</dd>
<dt class="annotation">annotation</dt>
<dd class="annotation">Just a few songs to enjoy while you XSPlF it up!</dd>
<dt class="info">info</dt>
<dd class="info"><a href="http://mayhem-chaos.net/xspf/xspf_it_up.html">http://mayhem-chaos.net/xspf/xspf_it_up.html</a></dd>
<dt class="identifier">identifier</dt>
<dd class="identifier">http://mayhem-chaos.net/xspf/xspf_it_up/1.0</dd>
<dt class="attribution">attribution</dt>
<dd class="attribution"><ol></ol></dd>
<dt class="trackList">trackList</dt>
<dd class="trackList"><ol>
<li><dl class="track">
<dt class="identifier">identifier</dt>
<dd class="identifier">http://musicbrainz.org/track/bdab6db0-2fd6-4166-a5fa-fbf2ff213793</dd>
<dt class="creator">creator</dt>
<dd class="creator">Cypress Hill</dd>
<dt class="duration">duration</dt>
<dd class="duration">174613</dd>
<dt class="meta">meta</dt>
<dd class="meta"><a href="http://musicbrainz.org/mm-2.1/track/bdab6db0-2fd6-4166-a5fa-fbf2ff213793">http://musicbrainz.org/mm-2.1/track/bdab6db0-2fd6-4166-a5fa-fbf2ff213793</a></dd>
</dl></li>
<li><dl class="track">
<dt class="identifier">identifier</dt>
<dd class="identifier">bdc846e7-6c26-4193-82a6-8d1b5a4d3429</dd>
<dt class="creator">creator</dt>
<dd class="creator">Sublime</dd>
<dt class="duration">duration</dt>
<dd class="duration">175466</dd>
<dt class="meta">meta</dt>
<dd class="meta"><a href="http://musicbrainz.org/mm-2.1/track/bdc846e7-6c26-4193-82a6-8d1b5a4d3429">http://musicbrainz.org/mm-2.1/track/bdc846e7-6c26-4193-82a6-8d1b5a4d3429</a></dd>
</dl></li>
<li><dl class="track">
<dt class="identifier">identifier</dt>
<dd class="identifier">http://musicbrainz.org/track/7d9776f7-d428-40dc-a425-3c6e3dce4d58</dd>
<dt class="creator">creator</dt>
<dd class="creator">Weezer</dd>
<dt class="duration">duration</dt>
<dd class="duration">186533</dd>
<dt class="meta">meta</dt>
<dd class="meta"><a href="http://musicbrainz.org/mm-2.1/track/7d9776f7-d428-40dc-a425-3c6e3dce4d58">http://musicbrainz.org/mm-2.1/track/7d9776f7-d428-40dc-a425-3c6e3dce4d58</a></dd>
</dl></li>
</ol></dd>
</dl>
</body>
</html>
END_OF_HTML

# This @expected_html_output is the output of xsltproc and is 100% correct. This should be the @expected_html_output in the future, when XSPF for Ruby will parse the <attribution> element.
#     @expected_html_ouput = <<END_OF_HTML
# <html xmlns:xspf="http://xspf.org/ns/0/">
# <head>
# <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
# <title>XSPlF it up!</title>
# <link href="http://www.w3.org/StyleSheets/Core/Modernist" rel="stylesheet" type="text/css" media="screen">
# <style type="text/css">
# dl {
#   margin-bottom: 5px;
# }
# 
# .track {
# }
# 
# .location {
# }
# 
# .creator {
# }
# 
# .top {
# }
# 
# .duration {
# }
# 
# .trackList {
# }
# 
# .info {
# }
# 
# .annotation {
# }
# 
# .attribution {
# }
# 
# .image {
# }
# 
# .meta {
# }
# 
# .license {
# }
# 
# .trackNum {
# }
# 
# .date {
# }
# 
# .identifier {
# }
# 
# .link {
# }
# 
# 
# 		</style>
# </head>
# <body>
# <h1>XSPlF it up!</h1>
# <dl class="top">
# <dt class="creator">creator</dt>
# <dd class="creator">Mayhem &amp; Chaos Coordinator</dd>
# <dt class="annotation">annotation</dt>
# <dd class="annotation">Just a few songs to enjoy while you XSPlF it up!</dd>
# <dt class="info">info</dt>
# <dd class="info"><a href="http://mayhem-chaos.net/xspf/xspf_it_up.html">http://mayhem-chaos.net/xspf/xspf_it_up.html</a></dd>
# <dt class="identifier">identifier</dt>
# <dd class="identifier">http://mayhem-chaos.net/xspf/xspf_it_up/1.0</dd>
# <dt class="attribution">attribution</dt>
# <dd class="attribution"><ol><li>
# <dt class="location">location</dt>
# <dd class="location"><a href="http://mayhem-chaos.net/xspf/xspf_it_up.html">http://mayhem-chaos.net/xspf/xspf_it_up.html</a></dd>
# </li></ol></dd>
# <dt class="trackList">trackList</dt>
# <dd class="trackList"><ol>
# <li><dl class="track">
# <dt class="identifier">identifier</dt>
# <dd class="identifier">http://musicbrainz.org/track/bdab6db0-2fd6-4166-a5fa-fbf2ff213793</dd>
# <dt class="creator">creator</dt>
# <dd class="creator">Cypress Hill</dd>
# <dt class="duration">duration</dt>
# <dd class="duration">174613</dd>
# <dt class="meta">meta</dt>
# <dd class="meta"><a href="http://musicbrainz.org/mm-2.1/track/bdab6db0-2fd6-4166-a5fa-fbf2ff213793">http://musicbrainz.org/mm-2.1/track/bdab6db0-2fd6-4166-a5fa-fbf2ff213793</a></dd>
# </dl></li>
# <li><dl class="track">
# <dt class="identifier">identifier</dt>
# <dd class="identifier">bdc846e7-6c26-4193-82a6-8d1b5a4d3429</dd>
# <dt class="creator">creator</dt>
# <dd class="creator">Sublime</dd>
# <dt class="duration">duration</dt>
# <dd class="duration">175466</dd>
# <dt class="meta">meta</dt>
# <dd class="meta"><a href="http://musicbrainz.org/mm-2.1/track/bdc846e7-6c26-4193-82a6-8d1b5a4d3429">http://musicbrainz.org/mm-2.1/track/bdc846e7-6c26-4193-82a6-8d1b5a4d3429</a></dd>
# </dl></li>
# <li><dl class="track">
# <dt class="identifier">identifier</dt>
# <dd class="identifier">http://musicbrainz.org/track/7d9776f7-d428-40dc-a425-3c6e3dce4d58</dd>
# <dt class="creator">creator</dt>
# <dd class="creator">Weezer</dd>
# <dt class="duration">duration</dt>
# <dd class="duration">186533</dd>
# <dt class="meta">meta</dt>
# <dd class="meta"><a href="http://musicbrainz.org/mm-2.1/track/7d9776f7-d428-40dc-a425-3c6e3dce4d58">http://musicbrainz.org/mm-2.1/track/7d9776f7-d428-40dc-a425-3c6e3dce4d58</a></dd>
# </dl></li>
# </ol></dd>
# </dl>
# </body>
# </html>
# END_OF_HTML

    @expected_soundblox_ouput = <<END_OF_SOUNDBLOX
<?xml version="1.0"?>
<soundbloxdata xmlns:xspf="http://xspf.org/ns/0/">
  <customize autostart="false" startopen="true"/>
  <playlist name="XSPlF it up!">
    <track/>
    <track/>
    <track/>
  </playlist>
</soundbloxdata>
END_OF_SOUNDBLOX

    @xspf = XSPF.new(@playlist_document)
  end

  def test_m3u
    assert_nil(@xspf.to_m3u)
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