module CharitiesHelper
  def verified_logo_for(charity)
    if charity.city == "Göteborg" or charity.city == "Gothenburg"
      "/images/goteborg-full-#{I18n.locale.to_s}.png"
    end
  end
end
