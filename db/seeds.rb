require 'open-uri'
require 'nokogiri'

url = "http://www.languagedaily.com/learn-german/vocabulary/common-german-words"
doc = Nokogiri::HTML(open(url))

doc.css("tr")[1..-1].each do |tr|
  unless (tr.css("td")[1].nil?) || (tr.css("td")[2].nil?)
    Card.create!( original_text: tr.css("td")[1].content,
    translated_text: tr.css("td")[2].content,
    review_date: (DateTime.now + 3).try(:strftime, '%d/%m/%Y'))
  end
end
