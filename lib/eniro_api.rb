class EniroApi
  #http://api.eniro.com/partnerapi/cs/search/basic?profile=Oodls.io&key=1325023846608000432&country=se&version=1.1.3&search_word=Thomas&Ochman
  BASE_URL = 'http://api.eniro.com/partnerapi/cs/'
  PROFILE = 'Oodls.io'
  API_KEY = '1325023846608000432'
  API_VERSION = '1.1.3'

  def initialize(query, country)
    @query = query
    @country = country
  end

  def query
    @results = JSON.parse(open(build_query).read)
    @results['adverts']
  end

  def build_query
    BASE_URL + 'search/basic?' + {
        profile: PROFILE,
        key: API_KEY,
        country: @country,
        version: API_VERSION,
        search_word: @query
    }.to_query
  end
end

class Array
  def names
    results_names = []
    self.each do |result|
      results_names << result['companyInfo']['companyName']
    end
    results_names
  end
end