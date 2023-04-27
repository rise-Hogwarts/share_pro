class Admin::PostCommentsController < ApplicationController

  def destroy
    recipe = Recipe.find(params[:recipe_id])
    PostComment.find(params[:id]).destroy
    redirect_to admin_recipe_path(recipe)
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
