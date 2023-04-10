class Member::RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def new
    @recipe = Recipe.new
    @genres = Genre.all
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.member_id = current_member.id
    @recipe.save
    redirect_to recipes_path
  end


  private

  def recipe_params
    params.require(:recipe).permit(:member_id, :image, :name, :jenre_id, :explanation, :ingredients, :protein)
  end

end
