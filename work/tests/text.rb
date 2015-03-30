require 'rubygems'
require "nokogiri"

f= File.open "test-db-structure.xml"
doc=Nokogiri::XML(f)

doc.xpath("//table").each do |t|
    t.xpath("field") do |f|
      if exists f.xpath("@limited_length")
      puts f
      end
    end
  end
