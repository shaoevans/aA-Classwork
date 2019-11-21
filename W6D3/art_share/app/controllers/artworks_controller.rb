class ArtworksController < ApplicationController
  def index
    artworks = Artwork.joins(:shared_artworks).where("artist_id = ? OR viewer_id = ?", params[:user_id], params[:user_id]).distinct
    render json: artworks
  end

  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages
    end
  end

  def show
    artwork = Artwork.find(params[:id])
    render json: artwork
  end

  def update
    artwork = Artwork.find(params[:id])
    artwork.update(artwork_params)
    render json: artwork 
  end

  def destroy
    artwork = Artwork.find(params[:id])
    artwork.destroy
    render json: artwork
  end

  private
  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end
end