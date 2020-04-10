require 'rails_helper'

RSpec.describe "Destinations API" do
  before(:each) do
    @destination1 = Destination.create!(name: "Broomfield", zip: "80020", description: "Small town", image_url: "https://www.colorado.com/sites/default/files/styles/1000x685/public/Broomfield-Interlocken0569.jpg?itok=UtTS4PEW")
    @destination2 = Destination.create!(name: "Westminster", zip: "80234", description: "Small town in CO", image_url: "https://www.colorado.com/sites/default/files/styles/1000x685/public/Broomfield-Interlocken0569.jpg?itok=UtTS4PEW")
  end

  it "can get info on all destinations" do
    get "/api/v1/destinations/#{@destination1.id}"
    expect(response).to be_successful

    destinations = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(destinations[:id].to_i).to eq(@destination1.id)
  end
end
