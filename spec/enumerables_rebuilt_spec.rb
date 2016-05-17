require 'enumerables_rebuilt'

describe "Enumerable" do
  let(:array) { [2,3,4] }
  
  describe "#my_each" do
    it "returns items from enumerable" do
      expect(array.my_each { |i| i }).to eq(array)
    end
    it "doesn't change items" do
      expect(array.my_each { |i| i = i**2 }).to eq(array)
    end
  end
  
  describe "#my_select" do
    it "returns an array of desired items" do
      expect(array.my_select { |i| i > 3 }).to eq([4])
    end
    
    it "returns an empty array if no matches" do
      expect(array.my_select { |i| i > 99 }).to eq([])
    end
  end
  
  describe "#my_all?" do
    it "returns true if each element matches" do
      expect(array.my_all? { |i| i > 0 }).to be_true
    end
    
    it "returns false if none matches" do
      expect(array.my_all? { |i| i < 0 }).to be_false
    end
    
    it "returns false if at least one doesn't match" do
      expect(array.my_all? { |i| i < 4 }).to be_false
    end
  end
  
  describe "#my_any?" do
    it "returns true if all items match" do
      expect(array.my_any? { |i| i > 0 }).to be_true
    end
    
    it "returns true if at least one item matches" do
      expect(array.my_any? { |i| i == 3 }).to be_true
    end
    
    it "returns false if all items don't match" do
      expect(array.my_any? { |i| i < 0 }).to be_false
    end
  end
  
  describe "#my_count" do    
    it "returns 2 if two elements match" do
      expect(array.my_count { |i| i > 2 }).to eq(2)
    end
    
    it "returns 0 if no matches" do
      expect(array.my_count { |i| i < 0 }).to eq(0)
    end
    
    it "returns array length if all items match" do
      expect(array.my_count { |i| i > 0 }).to eq(array.length)
    end
    
    it "matches to argument if no block" do
      expect(array.my_count(3)).to eq(1)
    end
    
    it "returns own length if no argument or block" do
      expect(array.my_count).to eq(array.length)
    end
  end
  
  describe "#my_map" do
    it "returns array of modified elements" do
      expect(array.my_map { |i| i**2 }).to eq([4, 9, 16])
    end
  end
  
  describe "#my_inject" do
    it "adds items" do
      expect(array.my_inject { |new, i| new + i }).to eq(9)
    end
    
    it "adds items with initial value" do
      expect(array.my_inject(100) { |new, i| new + i }).to eq(109)
    end
    
    it "doesn't repeat first element" do
      expect(array.my_inject { |new, i| new + i }).not_to eq(11)
    end
  end
end