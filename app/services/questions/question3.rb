# frozen_string_literal: true

module Questions
  # Find the first non-repeated character in a String 'abcdabcdabcdabcdeabcdcba'
  class Question3
    attr_accessor :source
    def initialize(source = nil)
      @source = source || 'abcdabcdabcdabcdeabcdcba'
    end

    def execute
      index_hash = create_index_hash
      find_first_element_in_hash(index_hash)
    rescue StandardError => e
      message = "Question3 execute got error: #{e}"
      Rails.logger.error message
      puts message
      false
    end

    private

    def create_index_hash
      index_hash = {}
      (0...source.length).each do |index|
        character = source[index]
        next if index_hash[character] && index_hash[character] == -1

        index_hash[character] = index_hash[character] ? -1 : index
      end
      index_hash
    end

    def find_first_element_in_hash(index_hash)
      first_non_repeated = {}
      index_hash.each do |key, value|
        next if value == -1

        if first_non_repeated.blank? || first_non_repeated.values.first > value
          first_non_repeated = { key => value }
        end
      end
      first_non_repeated
    end
  end
end
