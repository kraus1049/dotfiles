#!/usr/bin/env ruby
require 'cgi'
$KCODE="u"

data=""
f=open(ARGV[0],"r")
data=f.read
f.close

data.gsub!(/^\+(.*)$/){"<font color='green'>+#{CGI::escapeHTML($1)}</font>"}
data.gsub!(/^-(.*)$/){"<font color='red'>-#{CGI::escapeHTML($1)}</font>"}
data.gsub!(/\r\n|\n|\r/,"<br />\n")

html=<<-HTML
<html>
<head><title>diff2html</title></head>
<body>
#{data}
</body>
</html>
HTML
puts html
