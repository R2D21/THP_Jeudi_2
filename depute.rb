require "nokogiri"
require "open-uri"

@page_url = "http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"

def     gets_deputes()
  links = []
  i = 0;
  j = 0
  page = Nokogiri::HTML(open(@page_url))
  news_links = page.css("ul[class=col3]").css("li").css("a")
  news_links.each do |link|
    links[i] = link.text
    i +=1;
  end
  return links
end
gets_deputes.each do |word|
  puts word
end
