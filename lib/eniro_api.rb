class EniroApi
  # Usage:
  # EniroApi.new('[company name]', 'se').query.sanitize_api_response
  # Works with 'se', 'no' & 'dk'

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
  def sanitize_api_response
    results_names = []
    self.each do |r|
      results_names << {companyName: r['companyInfo']['companyName'],
                        orgNumber: r['companyInfo']['orgNumber'],
                        eniroId: r['eniroId'],
                        streetName: r['address']['streetName'],
                        postCode: r['address']['postCode'],
                        city: r['address']['postArea'],
                        website: get_url(r['homepage']),
                        latitude: r['location']['coordinates'][0]['latitude'].to_f,
                        longitude: r['location']['coordinates'][0]['longitude'].to_f}

    end
    results_names
  end

  def get_url(url)
    response = open(url).read
    response.match(/meta http-equiv="REFRESH" content="0;url=(.+)">/)[1]
  rescue
    'nil'
  end
end