require "rspec"
require_relative "../lib/caesar_cipher.rb"

describe "caesar_cipher" do
  it "shifts by a given value" do
    expect(caesar_cipher("abcd", 1)).to eq("bcde")
  end
  
  it "shifts from z to the beginning" do
    expect(caesar_cipher("xyz", 3)).to eq("abc")
  end
  
  it "ignores punctuation and digits" do
    expect(caesar_cipher("0123-=;", 2)).to eq("0123-=;")
  end
  
  it "handles negative shifts" do
    expect(caesar_cipher("badge", -1)).to eq("azcfd") 
  end
  
  it "handles null shift" do
    expect(caesar_cipher("badge", 0)).to eq("badge")
  end
  
  it "keep the case" do
    expect(caesar_cipher("BadGe", 1)).to eq("CbeHf")
  end
end