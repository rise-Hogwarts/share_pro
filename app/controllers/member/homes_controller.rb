class Member::HomesController < ApplicationController
  before_action :check_sign_in, only: [:my_recipe]

  def top
    @recipes = Recipe.all
  end

  def my_recipe
      @recipes = current_member.recipes.page(params[:page]).per(7)
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to my_recipe_path
  end


private

  def check_sign_in
    unless member_signed_in?
      redirect_to root_path
    end
  end

end
