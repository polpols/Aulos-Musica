require "csv"

$string = <<EOF
"1","boolean","bool"
"2","integer","int"
"3","serial","num"
"5","bl","blob"
"10","bigInt","big integer"
"12","picture","blob"
"12","bigblob","blob"
EOF
puts $string
csv=CSV::parse($string)