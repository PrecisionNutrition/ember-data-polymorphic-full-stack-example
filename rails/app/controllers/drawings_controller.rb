class DrawingsController < ApplicationController
  def index
    render json: Drawing.all
  end

  def show
    render json: Drawing.find(params[:id])
  end
end
