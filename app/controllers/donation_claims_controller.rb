class DonationClaimsController < ApplicationController
  def create
    @donation = Donation.find(params[:donation_id])
    charity_id = current_charity.id if current_charity.present?
    @donation_claim = @donation.donation_claims.build(donation_claim_params.merge({charity_id: charity_id}))
    if @donation_claim.save
      flash[:notice] = 'All good'
      redirect_to :back
    else
      flash[:notice] = 'No good'
      redirect_to donation_path(params[:donation_id])
    end
  end

  def accept_claim
    @donation_claim = DonationClaim.find(params[:id])
    @donation_claim.update_attribute(:accepted, true)
    redirect_to donation_path(params[:donation_id])
  end

  def unaccept_claim
    @donation_claim = DonationClaim.find(params[:id])
    @donation_claim.update_attribute(:accepted, false)
    redirect_to donation_path(params[:donation_id])
  end

  def destroy
    @donation_claim = DonationClaim.find(params[:id])
    @donation_claim.destroy!
    redirect_to donation_path(params[:donation_id])
  end

  private

  def donation_claim_params
    params.require(:donation_claim).permit(:charity_id,
                                           :donation_id,
                                           :comment,
                                           :pick_up_date,
                                           :accepted)
  end
end
