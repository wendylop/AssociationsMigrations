require 'test_helper'

class ProfessionalRecipesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @professional_recipe = professional_recipes(:one)
  end

  test "should get index" do
    get professional_recipes_url
    assert_response :success
  end

  test "should get new" do
    get new_professional_recipe_url
    assert_response :success
  end

  test "should create professional_recipe" do
    assert_difference('ProfessionalRecipe.count') do
      post professional_recipes_url, params: { professional_recipe: { description: @professional_recipe.description, nombre: @professional_recipe.nombre, reviews: @professional_recipe.reviews } }
    end

    assert_redirected_to professional_recipe_url(ProfessionalRecipe.last)
  end

  test "should show professional_recipe" do
    get professional_recipe_url(@professional_recipe)
    assert_response :success
  end

  test "should get edit" do
    get edit_professional_recipe_url(@professional_recipe)
    assert_response :success
  end

  test "should update professional_recipe" do
    patch professional_recipe_url(@professional_recipe), params: { professional_recipe: { description: @professional_recipe.description, nombre: @professional_recipe.nombre, reviews: @professional_recipe.reviews } }
    assert_redirected_to professional_recipe_url(@professional_recipe)
  end

  test "should destroy professional_recipe" do
    assert_difference('ProfessionalRecipe.count', -1) do
      delete professional_recipe_url(@professional_recipe)
    end

    assert_redirected_to professional_recipes_url
  end
end
