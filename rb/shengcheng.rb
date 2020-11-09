def get_dict(source)
  File.read("../#{source}.txt")
end

def generate_format(source, f)
  out, header, footer = 3.times.map { "" }
  dict = get_dict(source)
  header = format_header(source, f)
  footer = format_footer(source, f)
  dict.each_line do |line|
    x, y = line.chomp.split("\t")
    out << out_pattern(x, y, f)
  end
  out.gsub!(/\},\Z/, "}")
  header + out + footer
end

def out_pattern(x, y, f)
  if f == "sed"
    "s/#{x}/#{y}/g\n"
  elsif f == "json"
    "{\"i\":\"#{x}\",\"o\":\"#{y}\"},"
  end
end

def format_header(source, f)
  if f == "json"
    "["
  else
    ""
  end
end

def format_footer(source, f)
  if f == "json"
    "]"
  else
    ""
  end
end

def generate_all(sources, formats)
  formats.each do |fo|
    sources.each do |so|
      out_content = generate_format(so, fo)
      save_format(out_content, so, fo)
    end
  end
end

def save_format(out_content, so, fo)
  dir = "../dist/#{fo}/"
  filename = "#{so}.#{fo}"
  path = dir + filename
  File.open(path, "w") { |f| f << out_content }
end

sources = [ "fanjian", "jianfan" ]
formats = [ "sed", "json" ]

generate_all(sources, formats)
