class Admin::RecipesController < ApplicationController
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
    @recipe =Recipe.find(params[:id])
  end
end
