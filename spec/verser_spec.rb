# encoding : utf-8

require "spec_helper"

describe Verser::Reference do
  it "reads the format : <book>[ ]<chapter>[:.,]<verse>[-<chapter>[:.,]<verse>]" do
    r = Verser::Reference.new 'genèse 1.1-6'
    r.should be_valid
    r.book.should == 'genèse'
    r.from_chapter.should == 1
    r.to_chapter.should be_nil
    r.from_verse.should == 1
    r.to_verse.should == 6
    
    r = Verser::Reference.new 'genèse 1.1-2.6'
    r.should be_valid
    r.book.should == 'genèse'
    r.from_chapter.should == 1
    r.from_verse.should == 1
    r.to_chapter.should == 2
    r.to_verse.should == 6
    
    r = Verser::Reference.new 'genèse 1:1-6'
    r.should be_valid
    r.book.should == 'genèse'
    r.from_chapter.should == 1
    r.to_chapter.should be_nil
    r.from_verse.should == 1
    r.to_verse.should == 6
    
    r = Verser::Reference.new 'genèse 1:7-2:6'
    r.should be_valid
    r.book.should == 'genèse'
    r.from_chapter.should == 1
    r.from_verse.should == 7
    r.to_chapter.should == 2
    r.to_verse.should == 6
    
    r = Verser::Reference.new "genèse\t1,1"
    r.should be_valid
    r.book.should == 'genèse'
    r.from_chapter.should == 1
    r.to_chapter.should be_nil
    r.from_verse.should == 1
    r.to_verse.should be_nil
    
    r = Verser::Reference.new 'genèse1,1'
    r.should be_valid
    r.book.should == 'genèse'
    r.from_chapter.should == 1
    r.to_chapter.should be_nil
    r.from_verse.should == 1
    r.to_verse.should be_nil
  end
  
  it "reads the format : <number>[ ]<book> <chapter>[:.,]<verse>[-<chapter>[:.,]<verse>]" do
    r = Verser::Reference.new '1 jean 1.1-6'
    r.should be_valid
    r.book.should == '1jean'
    r.from_chapter.should == 1
    r.to_chapter.should be_nil
    r.from_verse.should == 1
    r.to_verse.should == 6
    
    r = Verser::Reference.new '1 jean 1.1-2.6'
    r.should be_valid
    r.book.should == '1jean'
    r.from_chapter.should == 1
    r.from_verse.should == 1
    r.to_chapter.should == 2
    r.to_verse.should == 6
    
    r = Verser::Reference.new '2rois 1:1-6'
    r.should be_valid
    r.book.should == '2rois'
    r.from_chapter.should == 1
    r.to_chapter.should be_nil
    r.from_verse.should == 1
    r.to_verse.should == 6
    
    r = Verser::Reference.new '2rois 1:1-2:6'
    r.should be_valid
    r.book.should == '2rois'
    r.from_chapter.should == 1
    r.from_verse.should == 1
    r.to_chapter.should == 2
    r.to_verse.should == 6
    
    r = Verser::Reference.new '1 Samuel 1,1'
    r.should be_valid
    r.book.should == '1samuel'
    r.from_chapter.should == 1
    r.to_chapter.should be_nil
    r.from_verse.should == 1
    r.to_verse.should be_nil
  end
  
  it "reads the format : <book>[ ]<chapter>" do
    r = Verser::Reference.new 'genèse1'
    r.should be_valid
    r.book.should == "genèse"
    r.from_chapter.should == 1
    r.to_chapter.should be_nil
    r.from_verse.should be_nil
    r.to_verse.should be_nil
    
    r = Verser::Reference.new 'genèse 1'
    r.should be_valid
    r.book.should == "genèse"
    r.from_chapter.should == 1
    r.to_chapter.should be_nil
    r.from_verse.should be_nil
    r.to_verse.should be_nil
  end
  
  it "reads the format : <number>[ ]<book> <chapter>" do
    r = Verser::Reference.new '1samuel 1'
    r.should be_valid
    r.book.should == "1samuel"
    r.from_chapter.should == 1
    r.to_chapter.should be_nil
    r.from_verse.should be_nil
    r.to_verse.should be_nil
    
    r = Verser::Reference.new '1 samuel 1'
    r.should be_valid
    r.book.should == "1samuel"
    r.from_chapter.should == 1
    r.to_chapter.should be_nil
    r.from_verse.should be_nil
    r.to_verse.should be_nil
  end
end