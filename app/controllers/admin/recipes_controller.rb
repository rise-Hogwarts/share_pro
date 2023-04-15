class Admin::RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
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
