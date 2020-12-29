# frozen_string_literal: true

class MineSweepersController < ApplicationController
  def resolved
    sweeper_generator = Faraday.get 'https://mine-sweeper-generator.herokuapp.com/solver'
    minefield = Oj.load(sweeper_generator.body, mode: :compat, object_class: OpenStruct)

    minefield_solved = MineSweeper::Solve.call(minefield)

    response = {
      "problem": minefield,
      "solution": minefield_solved
    }

    render json: response
  end
end
