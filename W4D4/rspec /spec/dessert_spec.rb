require 'rspec'
require 'dessert'

describe Dessert do
  let(:chef) { double("chef", name: "Tucker") }
  let(:brownie) { Dessert.new("brownie", 100, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(brownie.type).to_eq("brownie")
    end

    it "sets a quantity" do
      expect(brownie.quantity).to_eq(100)
    end

    it "starts ingredients as an empty array" do
      expect(brownie.ingredients).to be_empty?
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cake", "tons", :chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      brownie.add_ingredient("chocolate")
      expect(brownie.ingredients).to_include?("chocolate")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["chocolate", "flour", "egg", "sugar", "butter"]

      ingredients.each do |ingredient|
        brownie.add_ingredient(ingredient)
      end
    
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      brownie.eat(20)
      expect(brownie.quantity).to eq(80)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { brownie.eat(120)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Tucker the Great Baker")
      expect(brownie.serve).to eq("Chef Tucker the Great Baker has made 100 brownies!")
    end
  end

end
