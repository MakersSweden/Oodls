require 'rails_helper'

describe ApplicationController do
  describe 'Callbacks - before' do
    it { is_expected.to use_before_filter :set_current_charity }
    it { is_expected.to use_before_filter :set_current_donor }
    it { is_expected.to use_before_action :set_locale }
    it do
      allow(controller).to receive(:devise_controller?).and_return(true)
      is_expected.to use_before_filter :configure_permitted_parameters
    end
    it do
      allow(controller).to receive(:devise_controller?).and_return(false)
      binding.pry
      is_expected.to_not use_before_filter :configure_permitted_parameters
    end


  end

  describe 'Callbacks - after' do

  end

  describe 'Routes' do

  end
end


