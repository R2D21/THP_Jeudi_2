# coding: utf-8
require "nokogiri"
require "open-uri"

@page_url = "http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"

def     deputes_names()
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

def     deputes_url()
  links = []
  i = 0;
  j = 0
  page = Nokogiri::HTML(open(@page_url))
  news_links = page.css("ul[class=col3]").css("li").css("a").select{|link| link['href']}
  news_links.each do |link|
    links[i] =  @url + link['href']
    i +=1;
  end
  return   links
end

@url = "http://www2.assemblee-nationale.fr"

def     get_email(url)
  email = []
  page = Nokogiri::HTML(open(url))
  page.css('a[@href ^="mailto:"]').each do |element|
    email << element["href"]
    email[0][0..6] = ''
    break
  end
  return email
end

def     create_array_hash(first_name,last_name,emails)
  array = []
  my_hash = {}
  i = 0;
  while i < first_name.size
    my_hash = {:first_name => first_name[i],:last_name => last_name[i],:email => emails[i]}
    array.push(my_hash);
    i +=1
  end
  return array
end

def     perform

  # last_name = ["Manuel", "Laurence", "Pierre", "Michèle", "Olivier", "Francis", "Patrice", "Marie-Christine", "Charles"]
  # first_name = ["Jean-Pierre", "Jeanine", "Jacqueline", "Marianne", "Christelle", "Coralie", "Nicole", "Virginie", "Audrey"]
  # emails = "cecile.rilhac@assemblee-nationale.fr", "veronique.riotton@assemblee-nationale.fr", "stephanie.rist@assemblee-nationale.fr", "marie-pierre.rixain@assemblee-nationale.fr", "mireille.robert@assemblee-nationale.fr", "vincent.rolland@assemblee-nationale.fr", "laetitia.romeirodias@assemblee-nationale.fr", "xavier.roseren@assemblee-nationale.fr", "laurianne.rossi@assemblee-nationale.fr"
  links = []
  last_name = []
  first_name = []
  emails = []
  my_hash_array = []
  i = 0;
  deputes_names.each do |word|
    last_name[i] = word.split(' ')[2]
    first_name[i] = word.split(' ')[1]
    i +=1
  end
  i = 0;
  deputes_url.each do |word|
    emails[i] = get_email(word)
    i +=1
  end
  my_hash_array = create_array_hash(first_name,last_name,emails)
  my_hash_array.each do |array|
    puts "#{array}"
  end
end
# ["cecile.rilhac@assemblee-nationale.fr"], ["veronique.riotton@assemblee-nationale.fr"], ["stephanie.rist@assemblee-nationale.fr"], ["marie-pierre.rixain@assemblee-nationale.fr"], ["mireille.robert@assemblee-nationale.fr"], ["vincent.rolland@assemblee-nationale.fr"], ["laetitia.romeirodias@assemblee-nationale.fr"], ["xavier.roseren@assemblee-nationale.fr"], ["laurianne.rossi@assemblee-nationale.fr"]
# Jean-Pierre", "Jeanine", "Jacqueline", "Marianne", "Christelle", "Coralie", "Nicole", "Virginie", "Audrey",

perform
