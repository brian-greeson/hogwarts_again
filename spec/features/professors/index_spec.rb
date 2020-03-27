require "rails_helper"

RSpec.describe "When a user" do
  it "Visits /professors, I see a list of all profressor's name age specialty" do
    snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    hagarid = Professor.create(name: "Rubus Hagarid", age: 38 , specialty: "Care of Magical Creatures")

    visit "/professors"

    expe
    binding.pry

  end

end
