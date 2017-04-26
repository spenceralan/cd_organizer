require "organizer"
require "rspec"
require "pry"



describe 'CD' do
  let(:collection) { Collection.new }

  describe("#list_collection") do
    it "returns an empty array for a collection that is empty" do
      love = CD.new("Love", "Lana Del Rey")
      collection.add_cd(love)
      expect(Collection.all_cds).to eq [love]
    end
  end

  describe("#update_attribute") do
    it "Updates any atttribute of the CD" do
      love = CD.new("Love", "Lana Del Rey")
      love.update_attribute("title","Hate")
      expect(love.title).to eq "Hate"
    end
  end

end

describe 'Collection' do
  let(:love) { CD.new("Love", "Lana Del Rey") }
  let(:collection) { Collection.new }

  describe('#add_cd') do
    it 'Adds a CD to the collection' do
      collection.empty_collection
      collection.add_cd(love)
      expect(Collection.all_cds).to eq [love]
    end
  end

end
