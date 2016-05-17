def caesar_cipher (input, shift)
  shift = shift.to_i
  letters = ('a'..'z').to_a
  input_letters = input.split(//)
  out = []
  input_letters.each do |x|
    if (x =~ /\W|\d/)
      out.push(x)
      next
    else
      uppercase = ('A'..'Z').include?(x) ? true : false
      x.downcase!
      resulting_index = letters.index(x) + shift
      resulting_index -= letters.length if (resulting_index >= letters.length)
      if uppercase
        out.push(letters[resulting_index].upcase!)
      else
        out.push(letters[resulting_index])
      end
    end
  end
  return out.join
end

# puts "Enter your message."
# usr_input = gets.chomp
# puts "Enter desired shift value"
# usr_shift = gets.chomp
# puts "Encrypted message: #{caesar_cipher(usr_input, usr_shift)}"