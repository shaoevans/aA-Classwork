class LikesController < ApplicationController
  def create
    like = Like.new(like_params)
    if like.save
      render json: like
    else
      render json: like.errors.full_messages
    end
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy
    render json: like
  end

  def index
    if params[:artwork_id]
      likes = Like.where("liked_id = ? AND liked_type = 'Artwork'", params[:artwork_id])
    elsif params[:comment_id]
      likes = Like.where("liked_id = ? AND liked_type = 'Comment'", params[:comment_id])
    elsif params[:user_id]
      likes = Like.where("liker_id = ?", params[:user_id])
    end
    render json: likes
  end
  private
  def like_params
    params.require(:like).permit(:liker_id, :liked_type, :liked_id)
  end
end