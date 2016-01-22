class RectanglesController < ApplicationController
  def index
    respond_with Rectangle.all_or_some(params[:ids])
  end

  def show
    respond_with Rectangle.find(params[:id])
  end

  def update
    respond_with Rectangle.find(params[:id]).update(rectangle_params)
  end

  def create
    respond_with Triangle.create(rectangle_params)
  end

  private

  def rectangle_params
    params.require(:rectangle).permit(%i(x y width height fill drawing_id))
  end
end
