module DonorsHelper
  def claimed_by(donation)
    claims = donation.donation_claims.each.map {|claim| claim.charity.organisation}
    claims.join(' ')
  end

  def delivered_to(donation)
    if accepted_charity(donation)
      donation.donation_claims.where(accepted: true).map {|d|d.charity.organisation}
    elsif donation.donation_claims.where(accepted: [false, nil]).any?
      'not accepted'
    end
  end

  private
  def accepted_charity(donation)
    donation.donation_claims.where(accepted: true).any? ? true : false
  end

end
