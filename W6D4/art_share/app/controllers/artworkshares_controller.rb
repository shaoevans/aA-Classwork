class ArtworksharesController < ApplicationController

  def index
    shares = ArtworkShare.all
    render json: shares
  end
  def create
    share = ArtworkShare.new(share_params)
    if share.save
      render json: share
    else
      render json: share.errors.full_messages
    end
  end

  def destroy
    share = ArtworkShare.find(params[:id])
    share.destroy
    render json: share
  end

  private
  def share_params
    params.require(:share).permit(:artwork_id, :viewer_id)
  end
end