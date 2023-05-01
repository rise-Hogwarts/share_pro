class Member::HomesController < ApplicationController
  before_action :set_user, only: [:goods]

  def top
  end


private
  def set_user
    @member = Member.find(params[:id])
  end

end
