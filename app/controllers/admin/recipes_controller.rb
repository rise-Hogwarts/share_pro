class Admin::RecipesController < ApplicationController
  def index
    if params[:latest]
     @recipes = Recipe.latest.page(params[:page]).per(7)
    elsif params[:old]
     @recipes = Recipe.old.page(params[:page]).per(7)
    elsif params[:many_protein]
     @recipes = Recipe.many_protein.page(params[:page]).per(7)
    elsif params[:few_protein]
     @recipes = Recipe.few_protein.page(params[:page]).per(7)
    else
     @recipes = Recipe.page(params[:page]).per(7).search(params[:search])
    end

    @genres = Genre.all
    if params[:genre_id].present?
      #presentメソッドでparams[:genre_id]に値が含まれているか確認 => trueの場合下記を実行
      @genre = Genre.find(params[:genre_id])
      @recipes = @genre.recipes.page(params[:page]).per(7)
    end
  end

  def show
    @recipe =Recipe.find(params[:id])
  end
end
