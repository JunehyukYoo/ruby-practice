# caesar.rb

# Caesar chipher with a right shift of x amount
# Only shifts alphanumeric characters
def caesar_cipher_r(string, x)
  encodedString = string.chars.map do |char|
    if char.ord < 65 || char.ord > 122
      # If not alphnum return itself
      char
    else
      # If alphnum, make sure it does not go past upper bound (< "z" == 122) when shifting
      shifted_char_ord = char.ord + x
      shifted_char_ord > 122 ? (64 + shifted_char_ord % 122).chr : shifted_char_ord.chr
    end
  end
  encodedString.join("")
end

a = "hello za"
raise "Doesnt work" unless caesar_cipher_r(a, 1) == "ifmmp Ab"
raise "Doesnt work" unless caesar_cipher_r(a, 2) == "jgnnq Bc"
raise "Doesnt work" unless caesar_cipher_r(a, 58) == "hello za"