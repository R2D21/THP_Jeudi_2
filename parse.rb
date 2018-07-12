# !/usr/bin/env ruby

def     get_uri(page_url)
  links = []
  i = 0;
  page = Nokogiri::HTML(open(page_url))
  news_links = page.css("a").select{|link| link['href']}
  news_links.each do |link|
    links[i] = link['href']
    i +=1;
  end
  return links
end

def     get_uri_code(page_url)
  links = []
  i = 0;
  page = Nokogiri::HTML(open(page_url))
  news_links = page.css("a").select{|link| link['title']}
  news_links.each do |link|
    links[i] = link['title']
    i +=1;
  end
  return links
end

def create_hash(country, code)
  my_hash = {}
  country.each_with_index do |elem, index|
    my_hash[elem] = code[index]
  end
  return my_hash
end

def     get_address(mairie)
  links = []
  i = 0;
  page = Nokogiri::HTML(open(page_url))
  news_links = page.css("a").select{|link| link['href']}
  news_links.each do |link|
    links[i] = link['href']
    i +=1;
  end
  return links
end

def     check_country(links)
  i = 0;
  links.each do |word|
    # word.each_char do |number|
    if word.include?("val-d-oise")
      return (i);
    end
    i +=1
  end
end

def     aff(array)

  array.each do |word|
    puts word
  end
end

def get_all_mails(links)
  j = 0
  emails = []
  links.each do |link|
    emails[j] = get_email(link)
    puts emails[j]
    j +=1
  end
  return emails
end

 def get_email(url)

        page = Nokogiri::HTML(open(url))
        page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
 end
