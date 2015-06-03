class ResRobot

  def get_traffic_info(from, to)
    route = JSON.parse(open(build_query(from, to)).read)
    get_segment(route)
  end

  private

  def build_query(from, to)
    api_key = 'YMMJblEkgocOWmXcA3p8JxoYvNlo5jU8'
    api_url = 'https://api.trafiklab.se/samtrafiken/resrobot/'
    api_module = 'Search.json'
    api_version = '2.1'
    api_coord_sys = 'WGS84'

    "#{api_url}#{api_module}?key=#{api_key}&from=#{sanitize(from.full_address)}&to=#{sanitize(to.full_address)}&fromX=#{from.longitude}&fromY=#{from.latitude}&toX=#{to.longitude}&toY=#{to.latitude}&coordSys=#{api_coord_sys}&apiVersion=#{api_version}"
  end

  def get_segment(hash)
    hash['timetableresult']['ttitem']
  end

  def sanitize(string)
    string.gsub(' ', '+')
  end

end