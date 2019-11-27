class BandsController < ApplicationController

    def new
        render :new
    end

    def index
        render :index
    end

    def create
        @band = Band.new(band_params)
        if @band.save
            redirect_to bands_url
        else
            redirect_to new_band_url
        end
    end

    def destroy
        @band = Band.find_by(id: params[:id])
        @band.destroy
        redirect_to bands_url
    end

    private
    def band_params
        params.require(:band).permit(:name)
    end
end
