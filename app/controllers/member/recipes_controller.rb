class Member::RecipesController < ApplicationController

  def index
    if params[:latest]
     @recipes = Recipe.latest
    elsif params[:old]
     @recipes = Recipe.old
    elsif params[:many_protein]
     @recipes = Recipe.many_protein
    elsif params[:few_protein]
     @recipes = Recipe.few_protein
    else
     @recipes = Recipe.all.search(params[:search])
    end

    @genres = Genre.all
    if params[:genre_id].present?
      #presentメソッドでparams[:genre_id]に値が含まれているか確認 => trueの場合下記を実行
      @genre = Genre.find(params[:genre_id])
      @recipes = @genre.recipes
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
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
    params.require(:recipe).permit(:member_id, :image, :name, :genre_id, :explanation, :ingredients, :protein)
  end

end
