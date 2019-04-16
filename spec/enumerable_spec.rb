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

  describe "#my_select" do 
    it "returns an array of all even numbers in the array passed to it" do
      expect(array.my_select {|n| n.even? }).to eql([10,12,6])
    end
    it "it returns an array of strings that are less than 5" do
      expect(["thief","fox","pen","umbrella","pencil"].my_select {|w| w.length < 5}).to eql(["fox","pen"])
    end
  end

  describe "#my_all?" do
    it "it passes the my_all? method a block and evalutes to true if the block passes or false if not" do
      answer = array.my_all? {|n| n < 30}
      expect(answer).to be true
    end
  end

  describe "#my_none?" do 
    it "returns true if none of the elements meet the block condition" do
      answer = array.my_none? { |element| element == 100 }
      expect(answer).to be true
    end
  end

  describe "#my_count" do
    it "returns a count of how many elements meet the block condition" do
      answer = array.my_count? { |element| element <= 12 }
      expect(answer).to eq(3)
    end
  end

  describe "#my_any?" do
    it "returns true if at least one of the elements meets the block condition" do
      answer = array.my_any? { |element| element == 2 }
      expect(answer).to be false
    end
  end

  describe "#my_map" do
		it "returns a new array with the elements modified by the block" do
			answer = array.my_map { |element| element + 2 }
			expect(answer).to eq([12,27,14,8,15,19])
		end
	end

	describe "#my_inject" do
		it "takes a parameter and yields to the block and returns the modified parameter" do
			answer = array.my_inject(0) { |sum, element| sum += element }
			expect(answer).to eq(83)
		end
	end

end