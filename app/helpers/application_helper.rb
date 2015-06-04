module ApplicationHelper
  require 'res_robot'

  def directions_info(from, to)
    route = ResRobot.new.get_traffic_info(from, to)
    html = ''
    html << '<div class="row">'
    html << '<h3>Res med kollektivtrafik</h3>'
    route.each_with_index do |segment, i|
      html << content_tag(:div, class: 'small-8 columns') do
        concat content_tag(:strong, "Rutt #{i+1}, restid: #{calculate_time(route, i).to_i} minuter.")
      end
      segment['segment'].each do |segment_part|
        html << content_tag(:div, class: 'row') do
          concat content_tag(:div, build_segment_part(segment_part).html_safe, class: 'small-12 columns')
        end
      end
    end

    html << '</div>'
    return html.html_safe
  end

  def build_segment_part(segment_part)
    part = '<p>'
    part << localize(segment_part['departure']['datetime'].to_datetime, format: :hours)
    part << " #{segment_part['departure']['location']['name']}"
    part << " (#{segment_part['segmentid']['mot']['#text']} "
    if segment_part['segmentid']['distance']
      part << " #{segment_part['segmentid']['distance']} meter) -> "
    else
      #binding.pry
      part << " #{segment_part['segmentid']['carrier']['number']} riktning: #{segment_part['direction']}) -> "
    end
    part << [segment_part['arrival']['location']['name'], localize(segment_part['arrival']['datetime'].to_datetime, format: :hours)].join(' ')
    part << '</p>'
  end

  def calculate_time(route, i)
    #binding.pry
    start_time = route[i]['segment'].first['departure']['datetime']
    end_time = route[i]['segment'].last['arrival']['datetime']
    (Time.parse(end_time) - Time.parse(start_time)) / 60
  end
end

