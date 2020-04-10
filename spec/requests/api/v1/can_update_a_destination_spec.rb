require 'rails_helper'

RSpec.describe "Destinations API" do
  before(:each) do
    @destination1 = Destination.create!(name: "Broomfield", zip: "80020", description: "Small town", image_url: "https://www.colorado.com/sites/default/files/styles/1000x685/public/Broomfield-Interlocken0569.jpg?itok=UtTS4PEW")
    @destination2 = Destination.create!(name: "Westminster", zip: "80234", description: "Small town in CO", image_url: "https://www.colorado.com/sites/default/files/styles/1000x685/public/Broomfield-Interlocken0569.jpg?itok=UtTS4PEW")
  end

  it "can update a destination" do
    destination_params = { name: "Denver" }

    put "/api/v1/destinations/#{@destination1.id}", params: destination_params
    updated_destination = Destination.find_by(id: @destination1.id)

    expect(response).to be_successful
    expect(updated_destination.name).to_not eq("Broomfield")
    expect(updated_destination.name).to eq("Denver")
  end
end
