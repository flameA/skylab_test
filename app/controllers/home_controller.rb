# frozen_string_literal: true

class HomeController < ApplicationController
  def question1
    services = Questions::Question1.new(array_input)
    if services.execute
      @array_input = services.array
      @array_ascending = services.asc_array
      @arrray_descending = services.desc_array
    else
      @errors = 'Fail execute sort with your params'
    end
  end

  def question2; end

  def question3; end

  def question4; end

  def question5; end

  def question6; end

  private

  def array_input
    if params[:array_input]
      params[:array_input].split(',').map(&:to_i)
    else
      [9, 1, 8, 2, 7, 3, 6, 4, 5, 10, 13]
    end
  end
end
