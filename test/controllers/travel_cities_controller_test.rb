require 'test_helper'

class TravelCitiesControllerTest < ActionController::TestCase
  setup do
    @travel_city = travel_cities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:travel_cities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create travel_city" do
    assert_difference('TravelCity.count') do
      post :create, travel_city: { from_city: @travel_city.from_city, how_id: @travel_city.how_id, reache_on: @travel_city.reache_on, started_on: @travel_city.started_on, to_city: @travel_city.to_city, trip_id: @travel_city.trip_id }
    end

    assert_redirected_to travel_city_path(assigns(:travel_city))
  end

  test "should show travel_city" do
    get :show, id: @travel_city
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @travel_city
    assert_response :success
  end

  test "should update travel_city" do
    patch :update, id: @travel_city, travel_city: { from_city: @travel_city.from_city, how_id: @travel_city.how_id, reache_on: @travel_city.reache_on, started_on: @travel_city.started_on, to_city: @travel_city.to_city, trip_id: @travel_city.trip_id }
    assert_redirected_to travel_city_path(assigns(:travel_city))
  end

  test "should destroy travel_city" do
    assert_difference('TravelCity.count', -1) do
      delete :destroy, id: @travel_city
    end

    assert_redirected_to travel_cities_path
  end
end
