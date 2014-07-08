class TrianglesController < ApplicationController
  def index
    respond_with Triangle.all_or_some(params[:ids])
  end

  def show
    respond_with Triangle.find(params[:id])
  end
end
