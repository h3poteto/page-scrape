require "open-uri"
require "nokogiri"
require "pry"

page = Nokogiri.HTML(URI.open("https://herlipto.jp/products/1243305090"))

if page.xpath("//product-meta/div[1]/div[2]/span[1]").text == "Sold out"
  puts "Sold out"
else
  puts "Now on sale"
end
