module Scrapers::GoteborgCharities
  extend self
  include HTTParty

  def search(charity_name)
    query_string_normalizer proc { |query|
      query.map do |key, value|
        "#{key}=#{value.to_s.encode("ISO-8859-1")}"
      end.join('&')
    }

    search_response = post('http://www.bok.goteborg.se/SubmitSearchClient.action', body: {
      freetext: charity_name,
      "method:searchbyfreetext" => ''
    })
    parser = Nokogiri::HTML(search_response.body)
    rows = parser.css("table.clientinfotable tr + tr")
    return if rows.empty? or rows.text.include? "emptylist"

    org_id = rows[0].css('td.col2 a').attr('href').value.match(/\?clientid=(\d+)/)[1]

    org_id if org_id.present?
  end
end
