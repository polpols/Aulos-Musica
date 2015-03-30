require 'rubygems'
require 'csv'
require 'nokogiri'

myfile="Paradise2013_53.4DB.xml"

csv_string = <<EOF
"4D_id","4D_name","PG_name"
"1","Boolean","boolean"
"3","Integer","smallint"
"4","Long Integer","integer"
"5","Integer 64 Bits","bigint"
"6","Real","real"
"7","Float","double precision"
"8","Date","date"
"9","Time","time"
"10","Alpha","varchar"
"10","Text","text"
"12","Picture","blob"
"18","BLOB","blob"
EOF

$my_csv=CSV::parse(csv_string,:headers=>true)
f=File.open myfile
doc=Nokogiri::XML(f)

$sql=""

doc.xpath("//table").each do |table|
  $sql+= "CREATE TABLE" +" "+ table.xpath("@name").to_s+ " ("
  table.xpath("field").each do |field|
    if field.xpath("@type")=="10"
      if field.has_attribute?("limiting_length")
        $sql+= " varchar "
      else
        $sql+= " text "
      
    else
      $sql +=field.xpath("@name").to_s+" "+ 
    end
  end
  end
  
  $sql+=")\n"
end


puts $sql