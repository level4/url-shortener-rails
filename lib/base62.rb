# inspired by https://github.com/jtzemp/base62/blob/master/lib/base62.rb

class Base62
  PRIMITIVES = (0..9).collect { |i| i.to_s } + ('A'..'Z').to_a + ('a'..'z').to_a

  # add 1000 to the PK & base-62 it
  def self.id_to_short(id)
    new.encode(id + 1000)
  end

  # decode the shorturl string and minus 1000, giving the record ID
  def self.short_to_id(str)
    new.decode(str) - 1000
  end

  def decode(str)
    out = 0
    str.chars.reverse.each_with_index do |char, index|
      place = PRIMITIVES.size ** index
      out += PRIMITIVES.index(char) * place
    end
    out
  end

  def encode(int)
    raise ArgumentError, "Can't Base62 encode negative number (#{int} given)" if int < 0
    return "0" if int == 0

    result = ''
    while int > 0
      result.prepend PRIMITIVES[int % PRIMITIVES.size]
      int /= PRIMITIVES.size
    end

    result
  end
end

