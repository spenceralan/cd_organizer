require "organizer"
require "rspec"
require "pry"



describe 'Cd' do
  let(:collection) { Collection.new }


  describe("#list_collection") do
    it "returns an empty array for a collection that is empty" do
      love = CD.new("Love", "Lana Del Rey")
      collection.add_cd(love)
      expect(Collection.all_cds).to eq [love]
    end
  end

  describe("#update_artist") do
    it "Updates the artist atttribute" do
      love = CD.new("Love", "Lana Del Rey")
      love.update_artist("Justin Timberlake")
      expect(love.artist()).to eq "Justin Timberlake"
    end
  end

  describe("#update_title") do
    it "Updates the title atttribute" do
      love = CD.new("Love", "Lana Del Rey")
      love.update_title("Hate")
      expect(love.title()).to eq "Hate"
    end
  end

end
