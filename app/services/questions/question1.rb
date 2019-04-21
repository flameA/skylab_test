# frozen_string_literal: true

module Questions
  # Answer for question 1: Implement bubble sort
  class Question1
    attr_accessor :source, :asc_array, :desc_array
    def initialize(source = nil)
      @source = source || [9, 1, 8, 2, 7, 3, 6, 4, 5, 10, 13]
    end

    def execute
      @asc_array = sort_by_bubble_sort_asc
      @desc_array = sort_by_bubble_sort_desc
      true
    rescue StandardError => e
      message = "Question1 execute got error: #{e}"
      Rails.logger.error message
      puts message
      false
    end

    private

    def sort_by_bubble_sort_asc
      sort_by_bubble_sort
    end

    def sort_by_bubble_sort_desc
      sort_by_bubble_sort(:DESC)
    end

    def sort_by_bubble_sort(sort_by = :ASC)
      result = source.dup
      is_sorted = false
      last_postion_unsorted = result.count - 1
      until is_sorted
        pointer = 0
        is_sorted = true
        while pointer < last_postion_unsorted
          is_sorted = false if process_each_item(result, pointer, pointer + 1, sort_by)
          pointer += 1
        end
        last_postion_unsorted -= 1
      end
      result
    end

    def process_each_item(array, index, next_index, sort_by)
      index, next_index = next_index, index if sort_by == :DESC
      return false if array[index] < array[next_index]

      array[index], array[next_index] = array[next_index], array[index]
      true
    end
  end
end
