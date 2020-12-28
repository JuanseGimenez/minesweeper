# frozen_string_literal: true

class MineSweepersController < ApplicationController
  def resolved
    response_hardcode = {
      "problem": [],
      "solution": []
    }

    render json: response_hardcode
  end
end
