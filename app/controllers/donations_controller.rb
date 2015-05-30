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
    @donation_claims = @donation.donation_claims.all
    @donation_claim = @donation.donation_claims.build
  end

  def save_claim
    unless @donation_claim.save
      flash[:notice] = 'All good'
    else
      flash[:notice] = 'No good'
    end
    
  end

  def donation_params
    params.require(:donation).permit(:title,
                                     :description,
                                     :from_date,
                                     :will_deliver,
                                     :donor_id)
  end
end
