module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    self.each do |item|
      yield item
    end
  end
  def my_each_with_index
    index=0
    self.each do |item|
      yield item,index
      index +=1
    end
  end
  def my_all?
    self.each do |item|
      return false unless yield(item)
    end
    return true
  end
  def my_any?
    self.each do |item|
      return true if yield(item)
    end
    return false
  end
  def my_count
    if block_given?
      count=0
      self.each do |item|
        count+=1 if yield item
      end
      return count
    else
      return self.size
    end
  end
  def my_inject(initial_value)
    self.each do |item|
      initial_value = yield initial_value, item
    end
    return initial_value
  end
  def my_map
    result=[]
    self.each do |item|
      result.append(yield item) 
    end
    return result   
  end
  def my_none?
    self.each do |item|
      return false if yield item
    end
    return true
  end
  def my_select
    result=[]
    self.each do |item|
      result.append(item) if yield item
    end
    return result
  end
end
