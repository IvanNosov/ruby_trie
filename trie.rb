class Node
  attr_accessor :med
  attr_reader :data, :children
  def initialize(data)
    @data = data
    @children = []
    @med = false
  end

  def key?(key)
    @children.each { |k| return true if k.data == key }
    false
  end

  def search(key)
    @children.each{ |k| return k if k.data == key}
  end

  def insert(key)
    return search(key) if key? key
    child = Node.new(key)
    @children << child
    child
  end

end

class Trie
  attr_reader :root
  def initialize
    @root = Node.new(nil)
  end

  def insert(word)
    node = @root
    word.to_s.each_char do |i|
      child = node.insert(i)
      node = child
    end
    node.med = true
  end

  def have?(word)
    node = @root
    word.to_s.each_char do |i|
      return false unless node.search i
      node = node.search i
    end
    node.med
  end
end


