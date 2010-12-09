# encoding : utf-8

module Verser
  class Reference
    attr_reader :book, :chapter, :from, :to

    def initialize(input)
      @input = input
      parse
    end

    def valid?
      @valid ||= false
    end

    def parse
      @input.downcase.gsub(/\s/,'').match /(\d)?([a-zéèïëô]+)\s*(\d+)([.,:](\d+)-?(\d+)?)?/

      if $1.nil?
        @book = $2
      else
        @book = "#{$1}#{$2}"
      end

      @chapter = $3.to_i
      @from = $5.to_i
      @to = $6.to_i

      validate!
    end

    def validate!
      @valid = true
      @valid = false if @book.nil? or @book.empty?

      unless @to.zero?
        @valid &&= (@from < @to)
      end

      @valid
    end
  end
end
