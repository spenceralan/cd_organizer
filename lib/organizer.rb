# @@collection = []
#
# class Cd
#   define_method(:initialize) do |title, artist|
#     @title = title
#     @artist  = artist
#   end
#
#   define_method(:list_collection) do
#     @@collection
#   end
#
# end

class Collection
    @@collection = []

    def self.all_cds
      @@collection
    end

    def add_cd(cd)
      @@collection.push(cd)
    end

    def empty_collection
      @@collection = []
    end

    def find_cd(id)
      @@collection.find {|cd| cd.id == id}
    end

end

class CD

  attr_accessor :title
  attr_accessor :artist
  attr_accessor :id

  def initialize(title, artist)
    self.title = title
    self.artist = artist
    self.id = Collection.all_cds.length + 1
  end

  def update_attribute(attribute, new_attr)
    send("#{attribute}=", new_attr)
  end

end
