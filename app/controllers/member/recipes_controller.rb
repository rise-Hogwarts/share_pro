class Member::RecipesController < ApplicationController

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
    @recipe = Recipe.find(params[:id])
    @post_comment = PostComment.new
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.member_id = current_member.id
    if @recipe.save
      redirect_to recipes_path
    else
      render :new
    end
  end


  private

  def recipe_params
    params.require(:recipe).permit(:member_id, :image, :name, :genre_id, :explanation, :ingredients, :protein)
  end

end
