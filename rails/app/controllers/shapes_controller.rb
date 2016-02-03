class ShapesController < ApplicationController
  def index
    respond_with Shape.all_or_some(params[:ids])
  end

  def show
    respond_with Shape.find(params[:id])
  end
end
