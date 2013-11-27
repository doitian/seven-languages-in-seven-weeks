#!/usr/bin/env ruby

target = rand(100)

def get_integer(prompt)
  $stdout.print prompt
  $stdin.gets.to_i
end

while (answer = get_integer("Guess the number (0~99): ")) != target
  if answer < target
    puts "Too low"
  else
    puts "Too high"
  end
end
puts "Bingo!!!"
