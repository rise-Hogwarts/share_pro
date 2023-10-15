class Admin::GenresController < ApplicationController
  before_action :check_sign_in

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to admin_genres_path
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to admin_genres_path

  end

  def destroy
    genre = Genre.find(params[:id])
    genre.destroy
    redirect_to admin_genres_path
  end


  private

  def genre_params
    params.require(:genre).permit(:name)
  end

  def check_sign_in
    unless admin_signed_in?
      redirect_to root_path
    end
  end


end
