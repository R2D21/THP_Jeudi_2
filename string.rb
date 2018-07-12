# !/usr/bin/env ruby

def     parse_string(news_links)
  i = 0;
  code = []
  news_links.each do |link|
    code[i] = link.split('.')[0]
    i +=1
  end
  return code
end

def create_hash(country, code)
  my_hash = {}
  country.each_with_index do |elem, index|
    my_hash[elem] = code[index]
  end
  return my_hash
end
