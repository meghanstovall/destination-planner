require 'rails_helper'

RSpec.describe "Destinations API" do
  before(:each) do
    @destination1 = Destination.create!(name: "Broomfield", zip: "80020", description: "Small town", image_url: "https://www.colorado.com/sites/default/files/styles/1000x685/public/Broomfield-Interlocken0569.jpg?itok=UtTS4PEW")
    @destination2 = Destination.create!(name: "Westminster", zip: "80234", description: "Small town in CO", image_url: "https://www.colorado.com/sites/default/files/styles/1000x685/public/Broomfield-Interlocken0569.jpg?itok=UtTS4PEW")
  end

  it "can destroy a destination" do
    delete "/api/v1/destinations/#{@destination1.id}"

    expect(Destination.all.count).to eq(1)

    expect(response).to be_successful
    expect{Destination.find(@destination1.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
end
