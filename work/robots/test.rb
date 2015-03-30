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
doc=Nokogiri::HTML(open(url))
t=doc.css(".listItem")[1].css(".productLink a").attribute("href").value 
 n_url=root+t
 n_doc=Nokogiri::HTML(open(n_url))
 n_doc.xpath("div.productPageTopBoxRight > div:nth-child(2) > div:nth-child(3) > table:nth-child(1) > tbody:nth-child(1) > tr:nth-child(5) > td:nth-child(3)")