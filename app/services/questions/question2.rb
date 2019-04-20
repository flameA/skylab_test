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
      hash_array1 = {}
      @result_array = []
      array1.each { |item| hash_array1[item] = true }
      array2.each { |item| @result_array << item if hash_array1[item] }
      @result_array
    rescue StandardError => e
      message = "Question2 execute got error: #{e}"
      Rails.logger.error message
    end
  end
end
