require "organizer"
require "rspec"
require "pry"



describe 'CD' do
  let(:collection) { Collection.new }

  before do
    collection.empty_collection
  end

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

  # ponder how to test this
  describe("#initialize") do
    it "Adds an ID to the CD based on the number of previous entries" do
      love = CD.new("Love", "Lana Del Rey")
      expect(love.id).to be_a(String)
    end
  end

end

describe 'Collection' do
  let(:love) { CD.new("Love", "Lana Del Rey") }
  let(:collection) { Collection.new }

  before do
    collection.empty_collection
  end

  describe('#add_cd') do
    it 'Adds a CD to the collection' do
      collection.add_cd(love)
      expect(Collection.all_cds).to eq [love]
    end
  end

  describe('#empty_collection') do
    it 'Empties the collection' do
      collection.add_cd(love)
      collection.empty_collection
      expect(Collection.all_cds).to eq []
    end
  end

  describe("#find_cd") do
    it "Finds a CD based on id and returns the object" do
      collection.add_cd(love)
      id = love.id
      expect(Collection.find_cd(id)).to eq love
    end
  end

  describe("#delete_cd") do
    it "Deletes a CD based on id and returns the object" do
      collection.add_cd(love)
      id = love.id
      expect(Collection.delete_cd(id)).to eq love
    end

    it "Deletes a CD based on id and returns the object" do
      collection.add_cd(love)
      id = love.id
      Collection.delete_cd(id)
      expect(Collection.all_cds).to eq []
    end
  end




end
