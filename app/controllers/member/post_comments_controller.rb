class PostCommentsController < ApplicationController
  def create
    recipe = Recipe.find(params[:recipe_id])
    comment = current_member.post_comments.new(post_comment_params)
    comment.recipe_id = recipe.id
    comment.save
    redirect_to recipe_path(recipe)
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
