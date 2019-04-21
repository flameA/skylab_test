# frozen_string_literal: true

module Questions
  # Count the number of the character in a String after that
  # Sort the character by the number from highest to lowest and lowest to highest:
  class Question4
    attr_accessor :source, :output1, :output2
    def initialize(source = nil)
      @source = source || 'zyabcdabcac'
    end

    def execute
      counted_hash = create_hash_count_number_of_character
      sorted_array = sort_for_hash(counted_hash)
      @output1 = array_to_string_hash(sorted_array, :DESC)
      @output2 = array_to_string_hash(sorted_array)
      true
    rescue StandardError => e
      message = "Question4 execute got error: #{e}"
      Rails.logger.error message
      puts message
      false
    end

    private

    def create_hash_count_number_of_character
      result = {}
      source.split('').each do |item|
        item = item.to_sym
        if result[item]
          result[item] += 1
        else
          result[item] = 1
        end
      end
      result
    end

    def sort_for_hash(hash)
      array_from_hash = hash.to_a
      is_sorted = false
      last_postion_unsorted = array_from_hash.count - 1
      until is_sorted
        pointer = 0
        is_sorted = true
        while pointer < last_postion_unsorted

          if process_each_item(array_from_hash, pointer, pointer + 1)
            is_sorted = false
          end
          pointer += 1
        end
        last_postion_unsorted -= 1
      end
      array_from_hash
    end

    def process_each_item(array, index, next_index)
      if array[index][1] < array[next_index][1] ||
         array[index][1] == array[next_index][1] && array[index][0] > array[next_index][0]
        return false
      end

      array[index], array[next_index] = array[next_index], array[index]
      true
    end

    def array_to_string_hash(source_array, sort_by = :ASC)
      array = source_array.dup
      if sort_by == :ASC
        result = array.to_h
      else
        result = {}
        while array.present?
          last_element = array.pop
          result[last_element[0]] = last_element[1]
        end
      end
      result
    end
  end
end
