module Enumerable
    def my_each
      sizeOf = self.length
      sizeOf.times do |i|
        yield(self[i])
      end
    end
  
    def my_each_with_index
      sizeOf = self.length
      index = 0
      sizeOf.times do |i|
        yield(self[i],index)
        index += 1
      end
    end
  
    def my_select
      accepted = []
      self.my_each { |x| accepted << x if yield(x)}
      accepted
    end 
    
    def my_all?
      self.my_each { |x| return false unless yield(x)}
      true
    end
  
    def my_any?
      self.my_each{ |x| return true if yield(x)}
      false
    end
  
    def my_none?
      self.my_each {|x| return false if yield(x)}
      true
    end
  
    def my_count?
      count = 0
      self.my_each { |x| count+=1 if yield(x)}
      count
    end
  
    # the map method will take a block or proc
    def my_map(&prock)
      new_array = []
      self.my_each {|x| 
      new_array << prock.call(x) if  prock != nil 
      new_array << yield(x)  if prock.nil? && block_given?
      }
      new_array
    end
  
    def my_inject(val = 0)
      for i in self
        val = yield(val, i)
      end
      val
    end
  
  end
  
  def multiple_els(arr)
    arr.my_inject(1) {|currentTotal, nextMultiple| currentTotal * nextMultiple }
  end
  
  
  arr = [2,4,6,7]
  
  puts multiple_els(arr)