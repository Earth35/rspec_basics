module Enumerable
  def my_each
    i = 0
    while i < self.length
      yield(self[i])
      i += 1
    end
    return self
  end
  
  def my_each_with_index
    i = 0
    while i < self.length
      yield(self[i], i)
      i += 1
    end
    return self
  end
  
  def my_select
    result = []
    self.my_each { |x| result.push(x) if yield(x) }
    return result
  end
  
  def my_all?
    result = true
    self.my_each { |x| result = false if !yield(x) }
    return result
  end
  
  def my_any?
    result = false
    self.my_each { |x| result = true if yield(x) }
    return result
  end
  
  def my_none?
    result = true
    self.my_each { |x| result = false if yield(x) }
    return result
  end
  
  def my_count (arg=false)
    count = 0
    if arg
      self.my_each { |x| count += 1 if x == arg }
    elsif !block_given?
      count = self.length
    else
      self.my_each { |x| count += 1 if yield(x)}
    end
    return count
  end
  
  def my_map
    result = []
    self.my_each { |x| result << yield(x) }
    return result
  end
  
  def my_inject (init = self[0])
    result = init
    if result == self[0] 
      self[1..self.length].my_each { |x| result = yield(result, x) }
    else
      self.my_each { |x| result = yield(result, x) }
    end
    return result
  end
  
  def my_map_v2 (proc)
    result = []
    self.my_each { |x| result << proc.call(x) }
    return result
  end
  
  def my_map_v3 (proc=nil)
    result = []
    if block_given?
      self.my_each { |x| result << yield(x) }
    else
      self.my_each { |x| result << proc.call(x) }
    end
    return result
  end
end

def multiply_els (array)
  array.my_inject { |sum, el| sum * el }
end

# tests
# array = [2,3,4]
# my_proc = Proc.new { |x| x ** 2 }
# # my_each
# print("#{array.my_each { |x| puts x }}\n")
# # my_each_with_index
# print(array.my_each_with_index { |x, index| puts "#{index}: #{x}"})
# # my_select
# print("\n#{array.my_select { |x| x > 2 }}\n")
# # my_all?
# print("#{array.my_all? { |x| x > 2 }}\n")
# print("#{array.my_all? { |x| x > 0 }}\n")
# # my_any?
# print("#{array.my_any? { |x| x > 10}}\n")
# print("#{array.my_any? { |x| x > 2}}\n")
# # my_none?
# print("#{array.my_none? { |x| x > 1}}\n")
# print("#{array.my_none? { |x| x > 8}}\n")
# # my_count
# print("#{array.my_count}\n")
# print("#{array.my_count(3)}\n")
# print("#{array.my_count { |x| x > 2 }}\n")
# # my_map
# print("#{array.my_map { |x| x ** 2 }}\n")
# # my_map_v2
# print("#{array.my_map_v2(my_proc)}\n")  # proc same as block above, i.e. x ** 2
# # my_map_v3
# print("#{array.my_map_v3(my_proc) { |x| x ** 3 }}\n")  # proc: x ** 2
# # my_inject
# print("#{array.my_inject { |sum, x| sum + x }}")
# # my_inject via multiply_els
# print("\n#{multiply_els(array)}")