note=<<EOF
place de neuve : 297914745
place de neuve : 1588234221
Cirque : 1568217912
Cirque :  297910640
EOF
note.lines.each do |l|
  puts l.split(":")[1]
end