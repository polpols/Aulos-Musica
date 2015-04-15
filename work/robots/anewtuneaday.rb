require "rubygems"
require "open-uri"
require "nokogiri"
require 'active_record'
require 'logger'
require 'yaml'

dbconfig = YAML::load(File.open('database.yml'))
ActiveRecord::Base.establish_connection(dbconfig)
ActiveRecord::Base.logger = Logger.new(STDERR)
 
class Partition < ActiveRecord::Base
end


root="http://www.musicroom.com"
url="http://www.musicroom.com/search/find.aspx?searchtext=a+new+tune+a+day&culture=en-GB&lx_pagesize=60&lx_pagenumber=1"

index_list_css=".listItem"
index_entry_button_css="div.productLink a"

entry_title="h1.productpageTitle span"
entry_prix=".price"
entry_media=""
entry_niveau=""
entry_serie=""
entry_numedit=""
entry_isbn=""
entry_description=""

doc=Nokogiri::HTML(open(url))

doc.css(".listItem").each do |t| 
 n_url=root+t.css(".productLink a").attribute("href").value
 n_doc=Nokogiri::HTML(open(n_url))
 n_partition=Partition.create(
 :title=>n_doc.css(".productpageTitle span")
 :skill=>
 :serie=>
 :catnum=>
 :isbn=>
 :description=>
 :photo 
 ).save!
end
  




  