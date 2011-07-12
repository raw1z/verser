# encoding : utf-8

module Verser
  class Reference
    attr_reader :book, :from_chapter, :to_chapter, :from_verse, :to_verse, :input

    def initialize(input)
      @input = input
      parse
    end

    def valid?
      @valid ||= false
    end

    def parse
      @input.downcase.gsub(/\s/,'').match /(\d)?([a-zéèïëô]+)\s*(\d+)([.,:](\d+)-?((\d+)[.,:])?(\d+)?)?/

      @book = $1.nil? ? $2 : $1+$2
      @from_chapter = $3.to_i == 0 ? nil : $3.to_i
      @to_chapter = $7.to_i == 0 ? nil : $7.to_i
      
      if $5.to_i > 0
        @from_verse = $5.to_i
        @to_verse = $8.to_i > 0 ? $8.to_i : nil
      else
        @from_verse = @to_verse = nil
      end

      validate!
    end

    def validate!
      @valid = true
      @valid = false if @book.nil? or @book.empty?
      @valid = false if @from_chapter.nil?

      if @to_chapter.nil?
        unless @from_verse.nil? or @to_verse.nil?
          @valid &&= (@from_verse < @to_verse)
        end
      end
      

      @valid
    end
  end
end
