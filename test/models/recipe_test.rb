require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "should not save Recipe without name" do
  recipe = Recipe.new
  assert_not recipe.save, "Saved the Recipe without a Name"
end

 test "a recipe is created with name, and category" do 
    recipe = Recipe.new :name => "Zucchinisalat"
                         
    assert recipe.save
end
end
