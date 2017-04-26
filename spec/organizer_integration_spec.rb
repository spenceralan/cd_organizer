require "capybara/rspec"
require "./app"

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("the phrase parser path", {:type => :feature}) do
  it("Adds a CD to the collection based on user inputted artist and title") do
    visit("/")
    fill_in("title", :with => "Love")
    fill_in("artist", :with => "Lana Del Rey")
    click_button("Add CD")
    expect(page).to have_content("Love, by Lana Del Rey")
  end
end
