require 'rails_helper'

RSpec.describe "Open Weather Map API" do
  before(:each) do
    @destination = Destination.create!(name: "Broomfield", zip: "80020", description: "Small town", image_url: "https://www.colorado.com/sites/default/files/styles/1000x685/public/Broomfield-Interlocken0569.jpg?itok=UtTS4PEW")
  end

  it "can see a destinations info" do
    visit "/"

    within ".row" do
      click_on "Show"
    end
    expect(current_path).to eq("/destinations/#{@destination.id}")

    expect(page).to have_content(@destination.name)
    expect(page).to have_content(@destination.zip)
    expect(page).to have_content(@destination.description)

    within ".current-weather" do
      expect(first('#date').text).to_not be_empty
      expect(first('#current').text).to_not be_empty
      expect(first('#max_temp').text).to_not be_empty
      expect(first('#min_temp').text).to_not be_empty
      expect(first('#summary').text).to_not be_empty
    end
  end

  it "can see an image relating to the weather at a destination" do
    visit "/"

    within ".row" do
      click_on "Show"
    end
    expect(current_path).to eq("/destinations/#{@destination.id}")

    expect(page).to have_css("img[src*='.giphy.com']")
  end
end
