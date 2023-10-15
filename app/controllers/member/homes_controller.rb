class Member::HomesController < ApplicationController
  # before_action :set_user, only: [:goods]

  def top
    @recipes = Recipe.all
  end

  def my_recipe
    if member_signed_in?
      @recipes = current_member.recipes.page(params[:page]).per(7)
    else
      redirect_to root_path
    end
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to my_recipe_path
  end


# private
#   def set_user
#     @member = Member.find(params[:id])
#   end

end
