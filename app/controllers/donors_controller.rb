class DonorsController < ApplicationController
  def index
    @donors = Donor.all
    respond_to do |format|
      format.html
      format.json { render json: @donors }
    end
  end

  def show
    @donor = Donor.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @donor }
    end
  end

  def update
    if params[:donor][:password].blank? && params[:user][:password_confirmation].blank?
      params[:donor].delete(:password)
      params[:donor].delete(:password_confirmation)
      super
    end
  end
end
