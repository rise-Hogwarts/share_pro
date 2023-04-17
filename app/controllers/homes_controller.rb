class HomesController < ApplicationController
def guest
    user          = User.new(user_params)
    user.email    = SecureRandom.alphanumeric(15) + "@email.com"
    user.password = SecureRandom.alphanumeric(10)
    user.save
    sign_in user
    redirect_to recipes_path
end

  private

  def user_params
    params.permit(:name, :email, :password)
  end

end