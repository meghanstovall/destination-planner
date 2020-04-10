require 'rails_helper'

RSpec.describe "Destinations API" do
  it "can create a destination" do
    destination_params = { name: "Denver", zip: "80215", description: "City", image_url: "https://www.colorado.com/sites/default/files/styles/1000x685/public/Broomfield-Interlocken0569.jpg?itok=UtTS4PEW" }

    post "/api/v1/destinations", params: destination_params

    destination = JSON.parse(response.body, symbolize_names: true)[:data]
    last = Destination.last

    expect(last.name).to eq(destination_params[:name])
  end
end
