class Node
  attr_reader :data, :children
  attr_accessor :med
  def initialize(data)
    @data = data
    @children = []
    @med = false
  end

  def key?(key)
    @children.each { |k| return true if k == key }
    false
  end

  def get_key(key)
    @children.each{ |k| return k if k == key}
  end

  def insert(key)
    return get_key(key) if key? key
    @children << Node.new(key) unless key? key
  end
end

class Trie
  attr_reader :root
  def initialize
    @root = Node.new('')
  end

  def insert(word)
    node = @root
    word.size.times do |i|
      child = node.insert(word[i])
      node = child
    end
    node.med = true
  end

  def have?(word)
    node = @root
    word.size.times do |i|
      return false unless node.have?(word[i])
      node = node.get(word[i])
    end
    node.term
  end
end
