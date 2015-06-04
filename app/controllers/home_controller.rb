class HomeController < ApplicationController

	def index
		@charities_for_map = Charity.format_for_map
		@donors_for_map = Donor.format_for_map
	end

end
