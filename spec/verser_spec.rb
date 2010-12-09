# encoding : utf-8

require "spec_helper"

describe Verser::Reference do
  it "reads the format : <book>[ ]<chapter>[:.,]<verse>[-<verse>]" do
    r = Verser::Reference.new 'genèse 1.1-6'
    r.should be_valid
    r.book.should == 'genèse'
    r.chapter.should == 1
    r.from.should == 1
    r.to.should == 6
    
    r = Verser::Reference.new 'genèse 1:1-6'
    r.should be_valid
    r.book.should == 'genèse'
    r.chapter.should == 1
    r.from.should == 1
    r.to.should == 6
    
    r = Verser::Reference.new "genèse\t1,1"
    r.should be_valid
    r.book.should == 'genèse'
    r.chapter.should == 1
    r.from.should == 1
    r.to.should == 0
    
    r = Verser::Reference.new 'genèse1,1'
    r.should be_valid
    r.book.should == 'genèse'
    r.chapter.should == 1
    r.from.should == 1
    r.to.should == 0
  end
  
  it "reads the format : <number>[ ]<book> <chapter>[:.,]<verse>[-<verse>]" do
    r = Verser::Reference.new '1 jean 1.1-6'
    r.should be_valid
    r.book.should == '1jean'
    r.chapter.should == 1
    r.from.should == 1
    r.to.should == 6
    
    r = Verser::Reference.new '2rois 1:1-6'
    r.should be_valid
    r.book.should == '2rois'
    r.chapter.should == 1
    r.from.should == 1
    r.to.should == 6
    
    r = Verser::Reference.new '1 Samuel 1,1'
    r.should be_valid
    r.book.should == '1samuel'
    r.chapter.should == 1
    r.from.should == 1
    r.to.should == 0
  end
  
  it "reads the format : <book>[ ]<chapter>" do
    r = Verser::Reference.new 'genèse1'
    r.should be_valid
    r.book.should == "genèse"
    r.chapter.should == 1
    
    r = Verser::Reference.new 'genèse 1'
    r.should be_valid
    r.book.should == "genèse"
    r.chapter.should == 1
  end
  
  it "reads the format : <number>[ ]<book> <chapter>" do
    r = Verser::Reference.new '1samuel 1'
    r.should be_valid
    r.book.should == "1samuel"
    r.chapter.should == 1
    
    r = Verser::Reference.new '1 samuel 1'
    r.should be_valid
    r.book.should == "1samuel"
    r.chapter.should == 1
  end
end