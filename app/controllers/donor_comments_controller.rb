class DonorCommentsController < ApplicationController
  def create
    @donor = Donor.find(params[:donor_id])
    @donor_comment = @donor.donor_comments.build(donor_comment_params.merge(charity_id: charity_id))
    if @donor_comment.save
      flash[:notice] = 'Comment successfully added'
    else
      flash[:alert] = 'Oops! something went wrong'
    end
    redirect_to @donor
  end

  private

  def donor_comment_params
    params.require(:donor_comment).permit(:charity_id, :donor_id, :body)
  end

  def charity_id
    current_charity.id if current_charity.present?
  end
end
