class Member::GoodsController < ApplicationController
  def create
    recipe = Recipe.find(params[:recipe_id])
    good = current_member.goods.new(recipe_id: recipe.id)
    good.save
    redirect_to recipe_path(recipe)
  end

  def destroy
    recipe = Recipe.find(params[:recipe_id])
    good = current_member.goods.find_by(recipe_id: recipe.id)
    good.destroy
    redirect_to recipe_path(recipe)
  end
end
