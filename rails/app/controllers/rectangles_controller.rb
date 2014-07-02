class RectanglesController < ApplicationController
  def index
    respond_with Rectangle.all_or_some(params[:ids])
  end

  def show
    respond_with Rectangle.find(params[:id])
  end
end
