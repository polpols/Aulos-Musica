$my_csv = <<EOF
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
$my_csv=CSV::parse($my_csv)s