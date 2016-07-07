class TravelCitiesController < ApplicationController
  before_action :set_travel_city, only: [:show, :edit, :update, :destroy]

  # GET /travel_cities
  # GET /travel_cities.json
  def index
    @travel_cities = TravelCity.all
  end

  # GET /travel_cities/1
  # GET /travel_cities/1.json
  def show
  end

  # GET /travel_cities/new
  def new
    @travel_city = TravelCity.new
  end

  # GET /travel_cities/1/edit
  def edit
  end

  # POST /travel_cities
  # POST /travel_cities.json
  def create
    @travel_city = TravelCity.new(travel_city_params)

    respond_to do |format|
      if @travel_city.save
        format.html { redirect_to @travel_city, notice: 'Travel city was successfully created.' }
        format.json { render :show, status: :created, location: @travel_city }
      else
        format.html { render :new }
        format.json { render json: @travel_city.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /travel_cities/1
  # PATCH/PUT /travel_cities/1.json
  def update
    respond_to do |format|
      if @travel_city.update(travel_city_params)
        format.html { redirect_to @travel_city, notice: 'Travel city was successfully updated.' }
        format.json { render :show, status: :ok, location: @travel_city }
      else
        format.html { render :edit }
        format.json { render json: @travel_city.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /travel_cities/1
  # DELETE /travel_cities/1.json
  def destroy
    @travel_city.destroy
    respond_to do |format|
      format.html { redirect_to travel_cities_url, notice: 'Travel city was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_travel_city
      @travel_city = TravelCity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def travel_city_params
      params.require(:travel_city).permit(:from_city, :to_city, :started_on, :reache_on, :how_id, :trip_id)
    end
end
