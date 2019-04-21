# frozen_string_literal: true

module Questions
  # Given 2 integer arrays, find the common elements between 2 arrays
  class Question2
    attr_accessor :array1, :array2, :result_array
    def initialize(array1 = nil, array2 = nil)
      @array1 = array1 || [3, 4, 6, 3, 7, 8, 5, 9]
      @array2 = array2 || [5, 4, 1, 2, 3]
    end

    def execute
      hash_for_input1 = convert_array_to_hash(array1)
      @result_array = get_common_element_from_array2(hash_for_input1)
      true
    rescue StandardError => e
      message = "Question2 execute got error: #{e}"
      Rails.logger.error message
      puts message
      false
    end

    private

    def convert_array_to_hash(array)
      array.map { |item| [item, true] }.to_h
    end

    def get_common_element_from_array2(hash_for_input)
      result_array = []
      array2.each { |item| result_array << item if hash_for_input[item] }
      result_array
    end
  end
end
