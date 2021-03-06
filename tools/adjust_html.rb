require "nokogiri"
require 'byebug'

Dir["./*.html"].each do |filename|
  html = File.open(filename) { |f| Nokogiri::HTML(f) }
  
  # add class to tables
  # html.xpath("//html//body//table").each_with_index do |table, index|
  # 	  table["class"] = "parameters"
  # end

  # remove custom styles
  #html.xpath('//@style').remove

  # update a meta tag
  html.xpath("//meta[@name='viewport']").each_with_index do |meta, index|
   	  meta["content"] = "width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, minimal-ui"
   end
  File.write(filename, html.inner_html)
end
