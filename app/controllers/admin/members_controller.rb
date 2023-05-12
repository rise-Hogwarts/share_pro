class Admin::MembersController < ApplicationController
  def index
    @members = Member.all.page(params[:page]).per(20)
  end

  def show
    @member = Member.find(params[:id])
    @recipes = @member.recipes.page(params[:page]).per(7)
  end

  def update
    @member = Member.find(params[:id])
    @member.update(member_params)
    redirect_to admin_member_path(@member.id)
  end

  private

  def member_params
    params.require(:member).permit(:is_deleted)
  end

end
