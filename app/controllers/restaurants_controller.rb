class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
 def index
   @restaurants = Restaurant.all
 end

 def show; end

 def new
   @restaurant = Restaurant.new
 end

 def create
   @restaurant = Restaurant.new(restaurant_params)
  if @restaurant.save
   redirect_to restaurant_path(@restaurant)
  end
 end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

 def update
  @restaurant = Restaurant.find(params[:id])
   if @restaurant.update(restaurant_params)
     redirect_to restaurant_path(@restaurant)
   else
     render :edit, status: :unprocessable_entity
   end
 end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path, status: :see_other
  end

 private

 def set_restaurant
   @restaurant = Restaurant.find(params[:id])
 end

 def restaurant_params
   params.require(:restaurant).permit(:name, :address, :rating)
 end

end
