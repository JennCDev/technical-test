class ListingsController < ApplicationController
  def index
    @listings = Listing.all
    render json: { listings: @listings.as_json(only: [:id, :num_rooms]) }
  end

  def show
    @listing = Listing.find(params[:id])
    render json: { listing: @listing.as_json(only: [:id, :num_rooms]) }
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      render json: { listing: @listing.as_json(only: [:id, :num_rooms]), status: :created }
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])

    if @listing.update(listing_params)
      redirect_to listing_path(@listing)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    redirect_to listings_path, status: :see_other
  end

  def listing_params
    params.require(:listing).permit(:num_rooms)
  end
end
