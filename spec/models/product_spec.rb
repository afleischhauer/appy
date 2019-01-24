require 'rails_helper'

describe Product do
   let(:product) {Product.create!(name:"bike", description:"I am a description" )}

   let(:user) {User.create!(email:"user@gmail.com", password:"password")}
   before do
     product.comments.create!(rating:1, user:user, body:"Awful !")
     product.comments.create!(rating:3, user:user, body:"Ok !")
     product.comments.create!(rating:5, user:user, body:"Great !")
end

  it "returns the average rating of all comments" do
    expect(product.average_rating).to eq 3
    expect(Product.new(description: "I am a description")).not_to be_valid
  end

  it "is not valid without a name" do
    Product.new(description: "Nice bike")
    expect(Product.new(description: "Nice bike")).not_to be_valid
  end
end
