#!/usr/local/bin/ruby
require 'openssl'

i = 0
lowerCase = 97
upperCase = 65
d = []
e = 0

# This is just for reference. It prints out lowercase letters and uppercase letters, alongside their ASCII values.

while i <= 25
  print lowerCase.chr + " "
  print lowerCase.to_s + "      "
  print upperCase.chr + "  "
  print upperCase.to_s + " \n"
  upperCase = upperCase + 1
  lowerCase = lowerCase + 1
  i = i + 1
end

# Removes whitespace
puts "\n Please enter a word to translate"
word = gets.strip

# Shifts each byte along by the length of the initial word
word.each_byte do |c|
  d[e] = c + word.length
  e = e + 1
end

print "\n"

i = 0
arlen = d.count

# Writes to a plaintext file
open('postCeaser.txt', 'w') do |f|
    while i != arlen
        f << d[i].chr
        i = i + 1
    end
    f << i
    puts "\n"
end
