require 'erubis'

EMOJI_PATH="./emojis/*.png"

emoticons = Dir[EMOJI_PATH].map do |emoji|
  emoji.split("/").last.split(".").first
end

puts "found #{emoticons.count} emoji"

templates = ["emoticons.css.erb", "emoticons.plist.erb", "menu.plist.erb"]

templates.each do |template|
  result_filename = template.match(/(.*)\.erb/)[1]
  File.open(result_filename, "w") do |f| 
    f.write(Erubis::Eruby.new(File.read(template)).result({:emoticons => emoticons}))
  end
  puts "wrote #{result_filename}"
end


