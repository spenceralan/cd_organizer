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
end

class CD

  attr_accessor :title
  attr_accessor :artist

  def initialize(title, artist)
    self.title = title
    self.artist = artist
  end

  def update_artist(new_artist)
    self.artist = new_artist
  end

end
