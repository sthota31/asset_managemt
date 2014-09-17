class LocationsController < ApplicationController
	before_filter :authenticate_user!
	before_filter :find_location ,:except=>[:index,:new]

  def index
  	 @floors = Location.floors
  end

  def new
  	@location = Location.new()
  end

  def create
  	@location = Location.new(params[:location])
  	respond_to do |format|
      if @location.save
        format.html { redirect_to locations_url, notice: 'Location was successfully created.' }
        format.json { render action: 'show', status: :created, location: @location }
      else
        format.html { render action: 'new' }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  
  end

  def update
  end

  def edit
  end

  def show
  end

  private

  def find_location
  	@location= Location.find_by_id(params[:id])
  end

end
