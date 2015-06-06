module DonationsHelper
  require 'res_robot'

  def directions_info(from, to)
    route = ResRobot.new.get_traffic_info(from, to)
    html = ''
    route.each_with_index do |segments, i|
      segments = segments['segment'].is_a?(Array) ? segments['segment'] : [segments['segment']]

      html << content_tag(:div, class: 'small-8 columns') do
        concat content_tag(:h5, "Rutt #{i+1}, avgång om: #{calculate_departure(segments).to_i} minuter, restid: #{calculate_time(segments).to_i} minuter.")
      end
      html << '<div class="panel">'
      segments.each do |segment_part|
        html << content_tag(:div, class: 'row') do
          concat content_tag(:div, build_segment_part(segment_part).html_safe, class: 'small-12 columns')
        end
      end
      html << '</div>'
    end
    return html.html_safe
  end

  def build_segment_part(segment_part)
    part = localize(segment_part['departure']['datetime'].to_datetime, format: :hours)
    part << " #{segment_part['departure']['location']['name']}"
    part << " ( #{segment_part['segmentid']['mot']['#text']} "
    if segment_part['segmentid']['distance']
      part << " #{segment_part['segmentid']['distance']} meter ) -> "
    else
      part << " #{segment_part['segmentid']['carrier']['number']} i riktning mot #{segment_part['direction'].gsub!(/\([^()]*\)/,'')}) -> "
    end
    part << [segment_part['arrival']['location']['name'], localize(segment_part['arrival']['datetime'].to_datetime, format: :hours)].join(' ')
  end

  def calculate_time(route)
    start_time = route.first['departure']['datetime']
    end_time = route.last['arrival']['datetime']
    (Time.parse(end_time) - Time.parse(start_time)) / 60
  end

  def calculate_departure(route)
    current_time = Time.now
    departure_time = route.first['departure']['datetime']
    (Time.parse(departure_time) - current_time) / 60
  end
end
