HTML_COLOR_NAMES = { 'gold' => 'ForestGreen',
                     'khaki' => 'LimeGreen',
                     'lemonchiffon' => 'PaleGreen',
                     'lightgoldenrodyellow' => 'SpringGreen',
                     'lightyellow' => 'MintCream',
                     'palegoldenrod' => 'LightGreen',
                     'yellow' => 'Lime' }.freeze

def yellow_be_gone(color_name_or_code)
  if HTML_COLOR_NAMES.key?(color_name_or_code.downcase)
    return HTML_COLOR_NAMES[color_name_or_code.downcase]
  end

  if color_name_or_code.include?('#')
    rgb = color_name_or_code.scan(/\w{2}/)
    if rgb[0] > rgb[2] && rgb[1] > rgb[2]
      sorted_hex = rgb.sort { |a, b| a.hex <=> b.hex }
      rgb = sorted_hex[0] + sorted_hex[2] + sorted_hex[1]
      return '#' + rgb
    end
  end

  return color_name_or_code
end


p yellow_be_gone("lemonchiffon") == "PaleGreen"
p yellow_be_gone("GOLD") == "ForestGreen"
p yellow_be_gone("pAlEgOlDeNrOd") == "LightGreen"
p yellow_be_gone("BlueViolet") == "BlueViolet"
p yellow_be_gone("#000000") == "#000000"
p yellow_be_gone("#b8860b") == "#0bb886"
p yellow_be_gone("#8FBC8F") == "#8FBC8F"
p yellow_be_gone("#C71585") == "#C71585"
