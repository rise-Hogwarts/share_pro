class Member::HomesController < ApplicationController
  before_action :set_user, only: [:goods]

  def top
  end

  def my_recipe
    @recipes = Recipe.all
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to my_recipe_path
  end


private
  def set_user
    @member = Member.find(params[:id])
  end

end
