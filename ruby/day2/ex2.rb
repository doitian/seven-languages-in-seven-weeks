# -*- coding: utf-8 -*-
class Tree
  attr_accessor :children, :node_name
  def initialize(name, children=[])
    @children = children
    @node_name = name
  end

  def self.from_hash(name, h)
    children = h.collect do |k, v|
      from_hash(k, v)
    end
    new name, children
  end

  def visit_all(&block)
    visit(&block)
    children.each {|c| c.visit_all(&block)}
  end

  def visit(&block)
    block.call self
  end
end

p Tree.from_hash nil, 'grandpa'=>{'dad'=>{'child1'=>{},'child2'=>{}}},'uncle'=>{'child3'=>{},'child4'=>{}}
