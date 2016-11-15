class ProfessionalRecipesController < ApplicationController
  before_action :set_professional_recipe, only: [:show, :edit, :update, :destroy]

  # GET /professional_recipes
  def index
    @professional_recipes = ProfessionalRecipe.all
  end

  # GET /professional_recipes/1
  def show
  end

  # GET /professional_recipes/new
  def new
    @professional_recipe = ProfessionalRecipe.new
  end

  # GET /professional_recipes/1/edit
  def edit
  end

  # POST /professional_recipes
  def create
    @professional_recipe = ProfessionalRecipe.new(professional_recipe_params)

    if @professional_recipe.save
      redirect_to @professional_recipe, notice: 'Professional recipe was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /professional_recipes/1
  def update
    if @professional_recipe.update(professional_recipe_params)
      redirect_to @professional_recipe, notice: 'Professional recipe was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /professional_recipes/1
  def destroy
    #@professional_recipe.destroy
    #redirect_to professional_recipes_url, notice: 'Professional recipe was successfully destroyed.'
  
   @professional_recipe.destroy
   
   respond_to do |format|
      format.html { redirect_to professional_recipe_url, notice: 'Professional recipe was successfully destroyed.' }
      format.json { head :no_content }
      format.js   { render :layout => false }
   end  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_professional_recipe
      @professional_recipe = ProfessionalRecipe.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def professional_recipe_params
      params.require(:professional_recipe).permit(:nombre, :description, :reviews)
    end
    
    def Search_by_reviews
      professional_recipe = Professional_recipe.select("id, nombre, description").where(:reviews => params[:reviews])
      render :json => professional_recipe[0]
end

end
