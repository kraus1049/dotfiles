#! /usr/bin/ruby
data_col = 2

prev = nil
while line=gets do
  line = line.split(",")
  if line[data_col]!=prev and prev!=nil then
    puts ""
  end
  puts line.join(",")
  prev=line[data_col]
end
