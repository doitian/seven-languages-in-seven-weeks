#/usr/bin/env ruby

File.foreach("ex2.rb").each_with_index do |line, index|
  if line =~ /do/
    print "#{index}\t#{line}"
  end
end
