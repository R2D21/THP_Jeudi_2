# !/usr/bin/env ruby

require 'rubygems'
require 'nokogiri'
require 'open-uri'
require './parse'
require './string'

@PAGE_URL = "http://annuaire-des-mairies.com"

def     perform()
  list = {}
  i = 0;
  j = 0;
  names = []
  link = []
  news_links = get_uri(@PAGE_URL)
  country = []
  links = []
  emails = []
  tmp = []
  temp = ""
  link = @PAGE_URL + '/'
  link += news_links[check_country(news_links)]
  get_uri(link).each do |lin|
    tmp[i] = lin.split('.')[1]
    if tmp[i][0] == '/'
      temp = @PAGE_URL + tmp[i]
      links[j] = temp
      j +=1
    end
    i +=1
    end
  list = create_hash(get_all_mails(links),links)
  i = 6
  tmp = parse_string(names)
  i = 0
  j = 0
  while i < tmp.size - 15
    names[j] = tmp[i]
    i +=1
    j +=1
  end
  my_hash = create_hash(links, get_all_mails(links))
  puts "#{my_hash}"
end
perform
