class Member::MembersController < ApplicationController
  before_action :set_member, only: [:goods]


  def goods
    @member = Member.find(params[:id])
    goods = Good.where(Member_id: @member.id).pluck(:recipe_id)
    @good_recipes = Recipe.find(goods)
  end

private
  def set_member
    @member = Member.find(params[:id])
  end
end
