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
		array_record = record.split(//).to_a
		index = 0
  	(record.size - 2).times do
  		break if array_record[index].match(/\d/) && array_record[index + 1].match(/\d/)
  		index += 1
  	end
  	record[index + 1], record[index] = record[index], record[index + 1]
  	record
  end

end