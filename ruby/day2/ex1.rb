#!/usr/bin/env ruby

arr = (1..16).to_a

buffer = []
arr.each do |e|
  if buffer.size == 4
    puts buffer.inspect
    buffer = []
  end
  buffer << e
end

puts buffer.inspect unless buffer.empty?
