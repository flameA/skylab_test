# frozen_string_literal: true

module Questions
  # Answer for question 1: Implement bubble sort
  class Question1
    attr_accessor :array, :asc_array, :desc_array
    def initialize(array = nil)
      @array = array || [9, 1, 8, 2, 7, 3, 6, 4, 5, 10, 13]
    end

    def execute
      @asc_array = sort_by_bubble_sort_asc
      @desc_array = sort_by_bubble_sort_desc
      true
    rescue StandardError => e
      message = "Question1 execute got error: #{e}"
      Rails.logger.error message
      false
    end

    private

    def sort_by_bubble_sort_asc
      result = array.dup
      is_sorted = false
      last_postion_unsorted = result.count - 1
      until is_sorted
        pointer = 0
        is_sorted = true
        while pointer < last_postion_unsorted
          is_sorted = false if process_each_item(result, pointer, pointer + 1)
          pointer += 1
        end
        last_postion_unsorted -= 1
      end
      result
    end

    def sort_by_bubble_sort_desc
      result = array.dup
      is_sorted = false
      first_postion_unsorted = 0
      until is_sorted
        pointer = result.count - 1
        is_sorted = true
        while pointer > first_postion_unsorted
          is_sorted = false if process_each_item(result, pointer, pointer - 1)
          pointer -= 1
        end
        first_postion_unsorted += 1
      end
      result
    end

    def process_each_item(array_input, index, next_index)
      return false if array_input[index] < array_input[next_index]

      array_input[index], array_input[next_index] = array_input[next_index], array_input[index]
      true
    end
  end
end
