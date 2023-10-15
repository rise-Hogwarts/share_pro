class Admin::MembersController < ApplicationController
  before_action :check_sign_in
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

  def check_sign_in
    unless admin_signed_in?
      redirect_to root_path
    end
  end

end
