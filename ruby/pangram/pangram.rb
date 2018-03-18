module BookKeeping
  VERSION = 2
end

class Pangram
  def self.is_pangram? str
    ('a'..'z').all?{ |c| str.match /#{c}/i }
  end
end
