# frozen_string_literal: true

class Member::SessionsController < Devise::SessionsController
  before_action :member_state, only: [:create]



  protected

    def after_sign_in_path_for(resource)
      root_path
    end

    def member_state
      @member = Member.find_by(email: params[:member][:email])
      return if !@member
      if @member.valid_password?(params[:member][:password]) && (@member.is_deleted == true)
        flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
         redirect_to new_member_registration_path
      end
    end

    def member_sign_in
      member = Member.guest
      sign_in member
      redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
    end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
