class DrawingsController < ApplicationController
  def index
    respond_with Drawing.all
  end

  def show
    respond_with Drawing.find(params[:id])
  end
end
