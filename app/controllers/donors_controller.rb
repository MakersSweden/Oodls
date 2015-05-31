class DonorsController < ApplicationController
  def index
    @donors = Donor.all
  end

  def show
    @donor = Donor.find(params[:id])
  end

  def update
    if params[:donor][:password].blank? && params[:user][:password_confirmation].blank?
      params[:donor].delete(:password)
      params[:donor].delete(:password_confirmation)
      super
    end
  end
end
