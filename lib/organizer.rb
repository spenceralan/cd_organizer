require('uuid')

class Collection
    @@collection = []

    def self.all_cds
      @@collection
    end

    def add_cd(cd)
      @@collection.push(cd) unless cd.title.empty? && cd.artist.empty?
    end

    def empty_collection
      @@collection = []
    end

    def self.find_cd(id)
      @@collection.find {|cd| cd.id == id}
    end

    def self.find_artist(artist)
      cds = @@collection.clone
      cds.keep_if {|cd| cd.artist.downcase == artist.downcase}
    end

    def self.delete_cd(id)
      @@collection.delete(self.find_cd(id))
    end

end

class CD

  attr_accessor :title
  attr_accessor :artist
  attr_accessor :id

  def initialize(title, artist)
    self.title = title
    self.artist = artist
    self.id = UUID.new.generate
  end

  def update_attribute(attribute, new_attr)
    send("#{attribute}=", new_attr) unless new_attr.empty?
  end

end
