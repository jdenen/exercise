class Hamming
  def self.compute strand1, strand2
    new(strand1, strand2).compute
  end

  attr_reader :s1, :s2

  def initialize strand1, strand2
    raise ArgumentError unless strand1.size == strand2.size
    @s1, @s2 = [strand1, strand2].map(&:chars)
  end

  def compute
    return 0 if empty?
    diff = s1.each_with_object([]).with_index{ |(c, arr), i| arr.push(c == s2[i] ? 0 : 1) }
    diff.inject(:+)
  end

  private

  def empty?
    [s1, s2].all?(&:empty?)
  end
end

module BookKeeping
  VERSION = 3
end
