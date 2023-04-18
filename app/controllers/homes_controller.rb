class HomesController < ApplicationController
def guest
    member          = Member.new(member_params)
    member.name     = "ゲストユーザー"
    member.email    = SecureRandom.alphanumeric(15) + "@email.com"
    member.password = SecureRandom.alphanumeric(10)
    member.save
    sign_in member
    redirect_to recipes_path
end

  private

  def member_params
    params.permit(:name, :email, :password)
  end

end