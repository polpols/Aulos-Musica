require 'rubygems'
require 'nokogiri'

f= File.open "test-db-structure.xml"
doc=Nokogiri::XML(f)
sql=""
doc.xpath("//table") do |table|
  sql =+ "CREATE TABLE "+table.xpath("@name") +"("
  table.xpath("field") do |field|
    sql =+ field.xpath("@name")+" "+field.xpath("@type")
    end
    sql=+")"
  end
puts sql
