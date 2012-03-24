#!/usr/local/bin/ruby
def square_list(startnum, endnum)
  startnum.upto(endnum) do |i|
    puts "#{i} squared is #{i * i}"
  end
  #yield
end

square_list(10,20) 
