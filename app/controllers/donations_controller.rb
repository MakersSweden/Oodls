class DonationsController < ApplicationController
  def new
    @donation = Donation.new
  end

  def create
    @donation = Donation.create(donation_params)
    if @donation.save
      redirect_to donations_path
    else
      render 'new'
    end
  end

  def update
  end

  def index
    @donations = Donation.all
    render 'index'
  end

  def show
    @donation = Donation.find(params[:id])
    render 'show'
  end

  def donation_params
    params.require(:donation).permit(:title,
                                     :description,
                                     :from_date,
                                     :will_deliver,
                                     :donor_id)
  end
end
