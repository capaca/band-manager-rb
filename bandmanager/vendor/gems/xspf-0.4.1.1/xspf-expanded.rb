class XSPF
     # Version for the XML document or _nil_ if not defined
    def version
      @version
    end
    
    def version=(value)
      @version = value
    end

    private
    def parse_version
      begin
        @xspf.version
      rescue NoMethodError
        return nil
      end
    end

 end
class XSPF
     # Encoding of the XML document or _nil_ if not defined
    def encoding
      @encoding
    end
    
    def encoding=(value)
      @encoding = value
    end

    private
    def parse_encoding
      begin
        @xspf.encoding
      rescue NoMethodError
        return nil
      end
    end

 end
class XSPF
       # Creates a .m3u playlist from the XSPF document. This method makes use of the official XSPF to M3U XSLT transformation by Lucas Gonze.
      def to_m3u
        xslt = XML::XSLT.new
        xslt.xml = self.to_xml
        xslt.xsl = REXML::Document.new( File.new( './lib/xspf2m3u.xsl' ) )
        xslt.serve
      end

 end
class XSPF
       # Outputs the playlist as an HTML page. This method makes use of the official XSPF to HTML XSLT transformation by Lucas Gonze.
      def to_html
        xslt = XML::XSLT.new
        xslt.xml = self.to_xml
        xslt.xsl = REXML::Document.new( File.new( './lib/xspf2html.xsl' ) )
        xslt.serve
      end

 end
class XSPF
       # Creates a .smil playlist from the XSPF document. This method makes use of the official XSPF to SMIL XSLT transformation by Lucas Gonze.
      def to_smil
        xslt = XML::XSLT.new
        xslt.xml = self.to_xml
        xslt.xsl = REXML::Document.new( File.new( './lib/xspf2smil.xsl' ) )
        xslt.serve
      end

 end
class XSPF
       # Creates a RDF feed from the XSPF document. This method makes use of the XSPF to RDF XSLT transformation by Libby Miller.
      def to_rdf
        xslt = XML::XSLT.new
        xslt.xml = self.to_xml
        xslt.xsl = REXML::Document.new( File.new( './lib/xspf2rdf.xsl' ) )
        xslt.serve
      end

 end
class XSPF
       # Creates a SoundBlox playlist from the XSPF document. This method makes use of the official XSPF to SoundBlox XSLT tranformation by Lucas Gonze.
      def to_soundblox
        xslt = XML::XSLT.new
        xslt.xml = self.to_xml
        xslt.xsl = REXML::Document.new( File.new( './lib/xspf2soundblox.xsl' ) )
        xslt.serve
      end

 end
class XSPF::Playlist
     # The XML namespace. It must be http://xspf.org/ns/0/ for a valid XSPF document.
    def xmlns
      @xmlns
    end
    
    def xmlns=(value)
      @xmlns = value
    end

    private
    def parse_xmlns
      begin
        @playlist.root.attributes['xmlns']
      rescue NoMethodError
        return nil
      end
    end

 end
class XSPF::Playlist
     # The XSPF version. It may be 0 or 1, although 1 is strongly advised.
    def version
      @version
    end
    
    def version=(value)
      @version = value
    end

    private
    def parse_version
      begin
        @playlist.root.attributes['version']
      rescue NoMethodError
        return nil
      end
    end

 end
class XSPF::Playlist
     # A human-readable title for the playlist. xspf:playlist elements MAY contain exactly one.
    def title
      @title
    end
    
    def title=(value)
      @title = value
    end

    private
    def parse_title
      begin
        @playlist.elements['title'].text
      rescue NoMethodError
        return nil
      end
    end

 end
class XSPF::Playlist
     # Human-readable name of the entity (author, authors, group, company, etc) that authored the playlist. XSPF::Playlist objects MAY contain exactly one.
    def creator
      @creator
    end
    
    def creator=(value)
      @creator = value
    end

    private
    def parse_creator
      begin
        @playlist.elements['creator'].text
      rescue NoMethodError
        return nil
      end
    end

 end
class XSPF::Playlist
     # A human-readable comment on the playlist. This is character data, not HTML, and it may not contain markup. XSPF::Playlist objects elements MAY contain exactly one.
    def annotation
      @annotation
    end
    
    def annotation=(value)
      @annotation = value
    end

    private
    def parse_annotation
      begin
        @playlist.elements['annotation'].text
      rescue NoMethodError
        return nil
      end
    end

 end
class XSPF::Playlist
     # URL of a web page to find out more about this playlist. Likely to be homepage of the author, and would be used to find out more about the author and to find more playlists by the author. XSPF::Playlist objects MAY contain exactly one.
    def info
      @info
    end
    
    def info=(value)
      @info = value
    end

    private
    def parse_info
      begin
        @playlist.elements['info'].text
      rescue NoMethodError
        return nil
      end
    end

 end
class XSPF::Playlist
     # Source URL for this playlist. XSPF::Playlist objects MAY contain exactly one.
    def location
      @location
    end
    
    def location=(value)
      @location = value
    end

    private
    def parse_location
      begin
        @playlist.elements['location'].text
      rescue NoMethodError
        return nil
      end
    end

 end
class XSPF::Playlist
     # Canonical ID for this playlist. Likely to be a hash or other location-independent name. MUST be a legal URN. XSPF::Playlist objects MAY contain exactly one.
    def identifier
      @identifier
    end
    
    def identifier=(value)
      @identifier = value
    end

    private
    def parse_identifier
      begin
        @playlist.elements['identifier'].text
      rescue NoMethodError
        return nil
      end
    end

 end
class XSPF::Playlist
     # URL of an image to display if XSPF::Playlist#image return nil. XSPF::Playlist objects MAY contain exactly one.
    def image
      @image
    end
    
    def image=(value)
      @image = value
    end

    private
    def parse_image
      begin
        @playlist.elements['image'].text
      rescue NoMethodError
        return nil
      end
    end

 end
class XSPF::Playlist
     # Creation date (not last-modified date) of the playlist, formatted as a XML schema dateTime. XSPF::Playlist objects MAY contain exactly one.
    def date
      @date
    end
    
    def date=(value)
      @date = value
    end

    private
    def parse_date
      begin
        @playlist.elements['date'].text
      rescue NoMethodError
        return nil
      end
    end

 end
class XSPF::Playlist
     # URL of a resource that describes the license under which this playlist was released. XSPF::Playlist objects MAY contain zero or one license element.
    def license
      @license
    end
    
    def license=(value)
      @license = value
    end

    private
    def parse_license
      begin
        @playlist.elements['license'].text
      rescue NoMethodError
        return nil
      end
    end

 end
class XSPF::Playlist
     # An ordered list of URIs. The purpose is to satisfy licenses allowing modification but requiring attribution. If you modify such a playlist, move its XSPF::Playlist#location or XSPF::Playlist#identifier element to the top of the items in the XSPF::Playlist#attribution element. XSPF::Playlist objects MAY contain exactly one attribution element. Please note that currently XSPF for Ruby does not parse the contents of XSPF::Playlist#attribution.
    def attribution
      @attribution
    end
    
    def attribution=(value)
      @attribution = value
    end

    private
    def parse_attribution
      begin
        @playlist.elements['attribution'].text
      rescue NoMethodError
        return nil
      end
    end

 end
class XSPF::Playlist
     # The extension element allows non-XSPF XML to be included in XSPF documents without breaking XSPF validation. The purpose is to allow nested XML, which the meta and link elements do not. XSPF::Playlist objects MAY contain zero or more extension elements but currently XSPF for Ruby returns only the first one.
    def extension
      @extension
    end
    
    def extension=(value)
      @extension = value
    end

    private
    def parse_extension
      begin
        @playlist.elements['extension'].text
      rescue NoMethodError
        return nil
      end
    end

 end
class XSPF::Playlist
     # The link element allows non-XSPF web resources to be included in XSPF documents without breaking XSPF validation. A valid _link_ element has a _rel_ attribute and a _content_ element, obtained with XSPF::Playlist#link_rel and XSPF::Playlist#link_content respectively. XSPF::Playlist objects MAY contain zero or more meta elements, but currently XSPF for Ruby returns only the first one.
    def link_content
      @link_content
    end
    
    def link_content=(value)
      @link_content = value
    end

    private
    def parse_link_content
      begin
        @playlist.elements['link'].text
      rescue NoMethodError
        return nil
      end
    end

 end
class XSPF::Playlist
     # The link element allows non-XSPF web resources to be included in XSPF documents without breaking XSPF validation. A valid _link_ element has a _rel_ attribute and a _content_ element, obtained with XSPF::Playlist#link_rel and XSPF::Playlist#link_content respectively. XSPF::Playlist objects MAY contain zero or more link elements, but currently XSPF for Ruby returns only the first one.
    def link_rel
      @link_rel
    end
    
    def link_rel=(value)
      @link_rel = value
    end

    private
    def parse_link_rel
      begin
        @playlist.elements['link'].attributes['rel']
      rescue NoMethodError
        return nil
      end
    end

 end
class XSPF::Playlist
     # The meta element allows non-XSPF metadata to be included in XSPF documents without breaking XSPF validation. A valid _meta_ element has a _rel_ attribute and a _content_ element, obtained with XSPF::Playlist#meta_rel and XSPF::Playlist#meta_content respectively. XSPF::Playlist objects MAY contain zero or more meta elements, but currently XSPF for Ruby returns only the first one.
    def meta_content
      @meta_content
    end
    
    def meta_content=(value)
      @meta_content = value
    end

    private
    def parse_meta_content
      begin
        @playlist.elements['meta'].text
      rescue NoMethodError
        return nil
      end
    end

 end
class XSPF::Playlist
     # The meta element allows non-XSPF metadata to be included in XSPF documents without breaking XSPF validation. A valid _meta_ element has a _rel_ attribute and a _content_ element, obtained with XSPF::Playlist#meta_rel and XSPF::Playlist#meta_content respectively. XSPF::Playlist objects MAY contain zero or more meta elements, but currently XSPF for Ruby returns only the first one.
    def meta_rel
      @meta_rel
    end
    
    def meta_rel=(value)
      @meta_rel = value
    end

    private
    def parse_meta_rel
      begin
        @playlist.elements['meta'].attributes['rel']
      rescue NoMethodError
        return nil
      end
    end

 end
class XSPF::Track
     # URL of resource to be rendered. Probably an audio resource, but MAY be any type of resource with a well-known duration, such as video, a SMIL document, or an XSPF document. The duration of the resource defined in this element defines the duration of rendering. XSPF::Track objects MAY contain zero or more location elements, but a user-agent MUST NOT render more than one of the named resources. Currently, XSPF for Ruby returns only the first location.
    def location
      @location
    end
    
    def location=(value)
      @location = value
    end

    private
    def parse_location
      begin
        @track.elements['location'].text
      rescue NoMethodError
        return nil
      end
    end

 end
class XSPF::Track
     # Canonical ID for this resource. Likely to be a hash or other location-independent name, such as a MusicBrainz identifier or isbn URN (if there existed isbn numbers for audio). MUST be a legal URN. XSPF::Track objects elements MAY contain zero or more identifier elements, but currently XSPF for Ruby returns only the first one.
    def identifier
      @identifier
    end
    
    def identifier=(value)
      @identifier = value
    end

    private
    def parse_identifier
      begin
        @track.elements['identifier'].text
      rescue NoMethodError
        return nil
      end
    end

 end
class XSPF::Track
     # Human-readable name of the track that authored the resource which defines the duration of track rendering. This value is primarily for fuzzy lookups, though a user-agent may display it. XSPF::Track objects MAY contain exactly one.
    def title
      @title
    end
    
    def title=(value)
      @title = value
    end

    private
    def parse_title
      begin
        @track.elements['title'].text
      rescue NoMethodError
        return nil
      end
    end

 end
class XSPF::Track
     # Human-readable name of the entity (author, authors, group, company, etc) that authored the resource which defines the duration of track rendering. This value is primarily for fuzzy lookups, though a user-agent may display it. XSPF::Track objects MAY contain exactly one.
    def creator
      @creator
    end
    
    def creator=(value)
      @creator = value
    end

    private
    def parse_creator
      begin
        @track.elements['creator'].text
      rescue NoMethodError
        return nil
      end
    end

 end
class XSPF::Track
     # A human-readable comment on the track. This is character data, not HTML, and it may not contain markup. XSPF::Track objects MAY contain exactly one.
    def annotation
      @annotation
    end
    
    def annotation=(value)
      @annotation = value
    end

    private
    def parse_annotation
      begin
        @track.elements['annotation'].text
      rescue NoMethodError
        return nil
      end
    end

 end
class XSPF::Track
     # URL of a place where this resource can be bought or more info can be found.
    def info
      @info
    end
    
    def info=(value)
      @info = value
    end

    private
    def parse_info
      begin
        @track.elements['info'].text
      rescue NoMethodError
        return nil
      end
    end

 end
class XSPF::Track
     # URL of an image to display for the duration of the track. XSPF::Track objects MAY contain exactly one.
    def image
      @image
    end
    
    def image=(value)
      @image = value
    end

    private
    def parse_image
      begin
        @track.elements['image'].text
      rescue NoMethodError
        return nil
      end
    end

 end
class XSPF::Track
     # Human-readable name of the collection from which the resource which defines the duration of track rendering comes. For a song originally published as a part of a CD or LP, this would be the title of the original release. This value is primarily for fuzzy lookups, though a user-agent may display it. XSPF::Track objects MAY contain exactly one.
    def album
      @album
    end
    
    def album=(value)
      @album = value
    end

    private
    def parse_album
      begin
        @track.elements['album'].text
      rescue NoMethodError
        return nil
      end
    end

 end
class XSPF::Track
     # Integer with value greater than zero giving the ordinal position of the media on the XSPF::Track#album. This value is primarily for fuzzy lookups, though a user-agent may display it. XSPF::Track objects MAY contain exactly one. It MUST be a valid XML Schema nonNegativeInteger.
    def tracknum
      @trackNum
    end
    
    def tracknum=(value)
      @tracknum = value
    end

    private
    def parse_tracknum
      begin
        @track.elements['trackNum'].text
      rescue NoMethodError
        return nil
      end
    end

 end
class XSPF::Track
     # The time to render a resource, in milliseconds. It MUST be a valid XML Schema nonNegativeInteger. This value is only a hint -- different XSPF generators will generate slightly different values. A user-agent MUST NOT use this value to determine the rendering duration, since the data will likely be low quality. XSPF::Track objects MAY contain exactly one duration element.
    def duration
      @duration
    end
    
    def duration=(value)
      @duration = value
    end

    private
    def parse_duration
      begin
        @track.elements['duration'].text
      rescue NoMethodError
        return nil
      end
    end

 end
class XSPF::Track
     # The extension element allows non-XSPF XML to be included in XSPF documents without breaking XSPF validation. The purpose is to allow nested XML, which the meta and link elements do not. XSPF::Track objects MAY contain zero or more extension elements, but currently XSPF for Ruby returns only the first one.
    def extension
      @extension
    end
    
    def extension=(value)
      @extension = value
    end

    private
    def parse_extension
      begin
        @track.elements['extension'].text
      rescue NoMethodError
        return nil
      end
    end

 end
class XSPF::Track
     # The link element allows non-XSPF web resources to be included in XSPF documents without breaking XSPF validation. A valid _link_ element has a _rel_ attribute and a _content_ element, obtained with XSPF::Track#link_rel and XSPF::Track#link_content respectively. XSPF::Track objects MAY contain zero or more meta elements, but currently XSPF for Ruby returns only the first one.
    def link_content
      @link_content
    end
    
    def link_content=(value)
      @link_content = value
    end

    private
    def parse_link_content
      begin
        @track.elements['link'].text
      rescue NoMethodError
        return nil
      end
    end

 end
class XSPF::Track
     # The link element allows non-XSPF web resources to be included in XSPF documents without breaking XSPF validation. A valid _link_ element has a _rel_ attribute and a _content_ element, obtained with XSPF::Track#link_rel and XSPF::Track#link_content respectively. XSPF::Track objects MAY contain zero or more link elements, but currently XSPF for Ruby returns only the first one.
    def link_rel
      @link_rel
    end
    
    def link_rel=(value)
      @link_rel = value
    end

    private
    def parse_link_rel
      begin
        @track.elements['link'].attributes['rel']
      rescue NoMethodError
        return nil
      end
    end

 end
class XSPF::Track
     # The meta element allows non-XSPF metadata to be included in XSPF documents without breaking XSPF validation. A valid _meta_ element has a _rel_ attribute and a _content_ element, obtained with XSPF::Track#meta_rel and XSPF::Track#meta_content respectively. XSPF::Track objects MAY contain zero or more meta elements, but currently XSPF for Ruby returns only the first one.
    def meta_content
      @meta_content
    end
    
    def meta_content=(value)
      @meta_content = value
    end

    private
    def parse_meta_content
      begin
        @track.elements['meta'].text
      rescue NoMethodError
        return nil
      end
    end

 end
class XSPF::Track
     # The meta element allows non-XSPF metadata to be included in XSPF documents without breaking XSPF validation. A valid _meta_ element has a _rel_ attribute and a _content_ element, obtained with XSPF::Track#meta_rel and XSPF::Track#meta_content respectively. XSPF::Track objects MAY contain zero or more meta elements, but currently XSPF for Ruby returns only the first one.
    def meta_rel
      @meta_rel
    end
    
    def meta_rel=(value)
      @meta_rel = value
    end

    private
    def parse_meta_rel
      begin
        @track.elements['meta'].attributes['rel']
      rescue NoMethodError
        return nil
      end
    end

 end
