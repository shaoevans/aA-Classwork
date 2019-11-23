class CatrentalrequestsController < ApplicationController
  def new
    @request = CatRentalRequest.new
    render :new
  end

  def create
    @request = CatRentalRequest.new(request_params)
    if @request.save
      redirect_to catrentalrequest_url(@request)
    else
      redirect_to new_catrentalrequest_url
    end
  end

  def show
    @request = CatRentalRequest.find_by(id: params[:id])
    render :show
  end

  def index
    @requests = CatRentalRequest.all.where("status = 'APPROVED'").order(:start_date)
    render :index

  end

  private
  def request_params
    params.require(:catrentalrequest).permit(:cat_id, :start_date, :end_date)
  end
end