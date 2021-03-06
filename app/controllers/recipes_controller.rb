class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:show, :index]
  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    @recipe_category = @recipe.categoryrecipes
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new

    @all_categories = Category.all

    @recipe_category = @recipe.categoryrecipes.build
  end

  # GET /recipes/1/edit
  def edit

    @all_categories = Category.all

    @recipe_category = @recipe.categoryrecipes.build
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)

    params[:categories][:id].each do |category|
      if !category.empty?
        @recipe.categoryrecipes.build(:category_id => category)
      end
    end

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)

        @recipe.categories =[]
        params[:categories][:id].each do |category|
          if !category.empty?
            @recipe.categories << Category.find(category)
          end
        end

        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def recipe_params
    params.require(:recipe).permit(:user_id, :name)
  end

  def authorize
    if current_user.nil?
      redirect_to login_url, alert: "Not authorized! Please log in."
    #else ---> wenn unsere Cookbuch mit Rezept-user funtion wäre
    # if @recipe != current_user
    #   redirect_to root_path, alert: "Not authorized! Only #{@current_user} has access to this post."
    #  end
    end
  end

end
