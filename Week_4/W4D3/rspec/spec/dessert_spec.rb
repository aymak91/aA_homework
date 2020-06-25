require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Alex") }
  let(:brownie) { Dessert.new("brownie", 100, chef) }

  describe "#initialize" do
    it "sets a type"
    expect(brownie.type).to eq("brownie")
    it "sets a quantity"
    expect(brownie.quantity).to eq(100)
    it "starts ingredients as an empty array"
    expect(brownie.ingredients).to be_empty
    it "raises an argument error when given a non-integer quantity"
    expect { Dessert.new("cake", "tons", chef) }.to raise_error(ArgumentError)
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array"
      brownie.add_ingredient("chocolate")
      expect(brownie.ingredients).to include("chocolate") 
  end

  describe "#mix!" do
    it "shuffles the ingredient array"
      ingredients = ["chocolate", "flour", "egg", "sugar", "butter"]

      ingredients.each do |ingredient|
        brownie.add_ingredient(ingredient)
      end

      expect(brownie.ingredients).to eq(ingredients) #checks they're same
      brownie.mix! #shuffle them
      expect(brownie.ingredients).not_to eq(ingredients) #should not be exact
      expect(brownie.ingredients.sort).to eq(ingredients.sort) #but items same
  end

  describe "#eat" do
    it "subtracts an amount from the quantity"
      brownie.eat(20) #eat 20 away from 100
      expect(brownie.quantity).to eq(80)
    it "raises an error if the amount is greater than the quantity"
      expect { brownie.eat(101)}.to raise_error("not enough left!")

  end

  describe "#serve" do
    it "contains the titleized version of the chef's name"
      allow(chef).to receive(:titleize).and_return("Chef Alex the Great Baker")
      expect(brownie.serve).to eq("Chef Alex the Great Baker has made 100 brownies!")
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in"
      expect(chef).to receive(:bake).with(brownie)
      brownie.make_more
  end
end
