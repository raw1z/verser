# encoding : utf-8

module Verser
  class Reference
    attr_reader :book, :chapter, :from, :to, :input

    def initialize(input)
      @input = input
      parse
    end

    def valid?
      @valid ||= false
    end

    def parse
      @input.downcase.gsub(/\s/,'').match /(\d)?([a-zéèïëô]+)\s*(\d+)([.,:](\d+)-?(\d+)?)?/

      @book = $1.nil? ? $2 : $1+$2
      @chapter = $3.to_i == 0 ? nil : $3.to_i
      
      if $5.to_i > 0
        @from = $5.to_i
        @to = $6.to_i > 0 ? $6.to_i : nil
      else
        @from = @to = nil
      end

      validate!
    end

    def validate!
      @valid = true
      @valid = false if @book.nil? or @book.empty?
      @valid = false if @chapter.nil?

      unless @from.nil? or @to.nil?
        @valid &&= (@from < @to)
      end

      @valid
    end
  end
end
