class LocationsController < ApplicationController
	before_filter :authenticate_user!
	before_filter :find_location ,:except=>[:index,:new]

  def index
  	 @floors = Location.floors
  end

  def sublocations
     @sublocations = Location.sublocations
  end

  def new
    if params[:location_id].present?
      @location = Location.new(:location_id => params[:location_id])
    else
      @location = Location.new()
    end
  end

  def create
  	@location = Location.new(params[:location])
  	respond_to do |format|
      if @location.save
        format.html { redirect_to sublocations_locations_url, notice: 'Location was successfully created.' }
        format.json { render action: 'show', status: :created, location: @location }
      else
        format.html { render action: 'new' }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  
  end

  def import
    if !request.get?
       Location.import(params[:file])
       redirect_to sublocations_locations_url, notice: "Locations imported."
    end
     end
   def update

    respond_to do |format|
      
      if @location.update_attributes(params[:location])
        format.html { redirect_to sublocations_locations_url, notice: 'Location was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
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
