require "open-uri"
require "nokogiri"
require "pry"
require "net/http"

url = "https://herlipto.jp/products/1243305090"
page = Nokogiri.HTML(URI.open(url))
webhook = ENV["DISCORD_WEBHOOK"]

target = page.xpath("//product-meta/div[1]/div[2]/span[1]")

if target && target.text == "Sold out"
  puts "Sold out"
else
  puts "Now on sale"
  Net::HTTP.post_form(
    URI.parse(webhook),
    {
      username: "PageWatcher",
      content: "入荷したかも？ #{url}"
    })
end
