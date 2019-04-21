# frozen_string_literal: true

class HomeController < ApplicationController
  def question1
    services = Questions::Question1.new(question1_params[:array_input])
    if services.execute
      @array_input = services.source
      @array_ascending = services.asc_array
      @arrray_descending = services.desc_array
    else
      @errors = 'Fail execute sort with your params'
    end
  end

  def question2
    services = Questions::Question2.new(question2_params[:array1], question2_params[:array2])
    if services.execute
      @array1 = services.array1
      @array2 = services.array2
      @result_array = services.result_array
    else
      @errors = 'Fail execute question2'
    end
  end

  def question3; end

  def question4; end

  def question5; end

  def question6; end

  private

  def question1_params
    @question1_params ||= params.tap do |p|
      p[:array_input] = p[:array_input].split(',').map(&:to_i) if p[:array_input]
    end
  end

  def question2_params
    @question2_params ||= params.tap do |p|
      p[:array1] = p[:array1].split(',').map(&:to_i) if p[:array1]
      p[:array2] = p[:array2].split(',').map(&:to_i) if p[:array2]
    end
  end
end
