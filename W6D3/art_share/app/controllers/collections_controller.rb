class CollectionsController < ApplicationController
  def create
    collection = Collection.new(collection_params)
    if collection.save
      render json: collection
    else
      render json: collection.errors.full_messages
    end
  end



  private
  def collection_params
    params.require(:collection).permit(:owner_id)
  end
end


