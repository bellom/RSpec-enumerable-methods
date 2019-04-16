require "./enumerable.rb"

describe Enumerable do
  array = [10,25,12,6,13,17] 
  answer = []
  describe "#my_each" do
    it "returns each of the items of the array" do
      array.my_each {|n| answer << n}
      expect(answer).to eql([10,25,12,6,13,17]) 
    end
  end

  describe "#my_each_with_index" do
    it "returns array with the element and the index after it" do
      answer = []
      array.my_each_with_index { |element,index | answer << element ; answer << index}
      expect(answer).to eql([10,0,25,1,12,2,6,3,13,4,17,5])
    end
  end
end