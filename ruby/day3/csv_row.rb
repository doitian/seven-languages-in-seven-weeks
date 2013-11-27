#!/usr/bin/env ruby

class CsvRow
  def initialize(headers, columns)
    @headers = headers
    @columns = columns
  end

  def respond_to?(m)
    return true if @headers.include?(m.to_s)
    super
  end

  def method_missing(m, *args, &block)
    if (index = @headers.index(m.to_s))
      (class << self; self; end).instance_eval do
        define_method m do
          @columns[index]
        end
      end
      @columns[index]
    else
      super
    end
  end
end


row = CsvRow.new(['foo', 'bar'], [1, 2])
p row.foo
p row.bar
p row.foo
