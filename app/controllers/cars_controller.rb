class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]

  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
  end

  def show
  end

  def edit
  end
  
  def create
    @car = Car.new(car_params)
    @car.save
    redirect_to cars_path,
      notice: "#{@car.year} #{@car.make} #{@car.model} created"
  end
  
  def update
    @car.update(car_params)
    redirect_to cars_path,
      notice: "#{@car.year} #{@car.make} #{@car.model} updated"
  end

  def destroy
    @car.destroy
    redirect_to cars_path,
      notice: "#{@car.year} #{@car.make} #{@car.model} was destroyed"
  end

  private
  def set_car
    @car = Car.find(params[:id])
  end
  
  def car_params
    params.require(:car).permit(:make, :year, :model, :price)
  end
end
