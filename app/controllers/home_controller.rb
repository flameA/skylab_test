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

  def question3
    services = Questions::Question3.new(question_params[:source])
    result = services.execute
    @source = services.source
    if result.present?
      @character = result.first[0]
      @index = result.first[1]
    else
      @errors = 'Fail execute question3'
    end
  end

  def question4
    services = Questions::Question4.new(question_params[:source])
    if services.execute
      @source = services.source
      @output1 = services.output1
      @output2 = services.output2
    else
      @errors = 'Fail execute question4'
    end
  end

  def question5; end

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

  def question_params
    @question_params ||= params.tap do |p|
      p[:source] = p[:source].strip if p[:source]
    end
  end
end
