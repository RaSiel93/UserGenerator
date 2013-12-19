module Damage
  def self.execute record, probability
  	if Random.rand(10000) < probability * 10000
  	  case Random.rand 5
  	  when 0
  	  	record = permutation_of_two_adjacent_digits record
  	  when 1
  	  	record = permutation_of_two_adjacent_digits record
  	  when 2
  	  	record = permutation_of_two_adjacent_digits record
  	  when 3
  	  	record = permutation_of_two_adjacent_digits record
  	  when 4
  	  	record = permutation_of_two_adjacent_digits record
  	  end
  	end
  	record
  end


  def self.permutation_of_two_adjacent_digits record
    p record.frozen?
    if record.size >= 2
  		index = 0
      array_record = record.split(//).to_a
    	(record.size - 1).times do
    		if array_record[index].match(/\d/) && array_record[index + 1].match(/\d/)
          #record[index + 1], record[index] = record[index], record[index + 1]
          break
        end
    		index += 1
    	end
    end
  	record
  end

end