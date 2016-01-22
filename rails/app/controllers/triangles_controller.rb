class TrianglesController < ApplicationController
  def index
    respond_with Triangle.all_or_some(params[:ids])
  end

  def show
    respond_with Triangle.find(params[:id])
  end

  def update
    respond_with Triangle.find(params[:id]).update(triangle_params)
  end

  def create
    respond_with Triangle.create(triangle_params)
  end

  private

  def triangle_params
    params.require(:triangle).permit(%i(x y width height fill drawing_id))
  end
end
