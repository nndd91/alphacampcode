def yellow_be_gone(color_name_or_code)
  GreenLantern.new(color_name_or_code).be_gone
end

class GreenLantern
  HTML_COLOR_NAMES = { 'gold' => 'ForestGreen', 'khaki' => 'LimeGreen',
                       'lemonchiffon' => 'PaleGreen', 'lightgoldenrodyellow' => 'SpringGreen',
                       'lightyellow' => 'MintCream', 'palegoldenrod' => 'LightGreen',
                       'yellow' => 'Lime' }.freeze

  def initialize(color_name)
    @color_name = color_name
  end

  def be_gone
    return HTML_COLOR_NAMES[@color_name.downcase] if HTML_COLOR_NAMES.key?(@color_name.downcase)
    return hex_sorted if @color_name.include?('#')
    @color_name
  end

  def hex_sorted
    rgb =  @color_name.scan(/\w{2}/)

    return @color_name if rgb[0] < rgb[2] || rgb[1] < rgb[2]

    sorted_hex = rgb.sort { |a, b| a.hex <=> b.hex }

    '#' + sorted_hex[0] + sorted_hex[2] + sorted_hex[1]
  end
end


p yellow_be_gone("lemonchiffon") == "PaleGreen"
p yellow_be_gone("GOLD") == "ForestGreen"
p yellow_be_gone("pAlEgOlDeNrOd") == "LightGreen"
p yellow_be_gone("BlueViolet") == "BlueViolet"
p yellow_be_gone("#000000") == "#000000"
p yellow_be_gone("#b8860b") == "#0bb886"
p yellow_be_gone("#8FBC8F") == "#8FBC8F"
p yellow_be_gone("#C71585") == "#C71585"
