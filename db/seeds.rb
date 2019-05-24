require 'open-uri'
require 'json'

Ingredient.destroy_all
url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
drink_serialized = open(url).read
data = JSON.parse(drink_serialized)
p data['drinks'].first
data["drinks"].each do |liquor|
  Ingredient.create!(name: liquor["strIngredient1"])
end

