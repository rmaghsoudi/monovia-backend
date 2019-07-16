class PropertiesController < ApplicationController
  before_action :set_property, only: %i[show update destroy]

  def index
    render json: Property.all
  end

  def show
    render json: @property
  end

  def create
    property = Property.new(property_params)
    if property.save
      render json: property, status: :created
    else
      render json: property.errors, status: :unprocessable_entity
    end
  end

  def update
    if @property.update(property_params)
      render json: @property
    else
      render json: @property.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @property.destroy
  end

  private
  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:name, :value, :game_id, :user_id)
  end

end