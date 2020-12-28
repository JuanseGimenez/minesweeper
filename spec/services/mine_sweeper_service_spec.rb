# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'MineSweeperService' do
  describe 'Resolve map of Minesweeper' do
    let(:minefield) do
      [
        ['+', '-', '-', '-', '-', '-', '-', '-'],
        ['|', '*', '*', ' ', ' ', '*', ' ', ' '],
        ['|', ' ', '*', '*', '*', '*', ' ', ' '],
        ['|', '*', ' ', '*', ' ', ' ', ' ', ' '],
        ['|', '*', '*', ' ', ' ', '*', ' ', ' '],
        ['|', '*', ' ', ' ', ' ', '*', ' ', '*'],
        ['|', ' ', ' ', ' ', ' ', ' ', '*', ' ']
      ]
    end

    let(:second_minefield) do
      [
        ['+', '-', '-', '-', '-', '-', '-', '-'],
        ['|', '*', '*', ' ', ' ', '*', ' ', '|'],
        ['|', ' ', '*', '*', '*', '*', ' ', '|'],
        ['|', '*', ' ', '*', ' ', ' ', ' ', '|'],
        ['|', '*', '*', ' ', ' ', '*', ' ', '|'],
        ['|', '*', ' ', ' ', ' ', '*', ' ', '|'],
        ['|', ' ', ' ', ' ', ' ', ' ', '*', '|'],
        ['+', '-', '-', '-', '-', '-', '-', '+']
      ]
    end

    let(:third_minefield) do
      [
        [' ', ' ', ' ', ' ', '*', ' ', '*', '*'],
        [' ', ' ', '*', ' ', ' ', '*', ' ', ' '],
        [' ', ' ', '*', '*', '*', '*', ' ', ' '],
        ['*', '*', ' ', '*', ' ', ' ', ' ', '*'],
        [' ', '*', '*', ' ', ' ', '*', ' ', ' '],
        [' ', '*', ' ', ' ', ' ', '*', ' ', ' '],
        [' ', ' ', ' ', ' ', ' ', ' ', '*', '*'],
        ['*', '*', '*', '*', ' ', ' ', '*', '*']
      ]
    end

    it 'returns minefield(without bottom bound) completed' do
      response = [
        ['+', '-', '-', '-', '-', '-', '-', '-'],
        ['|', '*', '*', '4', '4', '*', '2', '0'],
        ['|', '4', '*', '*', '*', '*', '2', '0'],
        ['|', '*', '6', '*', '5', '3', '2', '0'],
        ['|', '*', '*', '2', '3', '*', '3', '1'],
        ['|', '*', '3', '1', '2', '*', '4', '*'],
        ['|', '1', '1', '0', '1', '2', '*', '2']
      ]

      expect(MineSweeper::Solve.call(minefield)).to match_array(response)
    end

    it 'returns minefield(with bounds) with values of mines' do
      response = [
        ['+', '-', '-', '-', '-', '-', '-', '-'],
        ['|', '*', '*', '4', '4', '*', '2', '|'],
        ['|', '4', '*', '*', '*', '*', '2', '|'],
        ['|', '*', '6', '*', '5', '3', '2', '|'],
        ['|', '*', '*', '2', '3', '*', '2', '|'],
        ['|', '*', '3', '1', '2', '*', '3', '|'],
        ['|', '1', '1', '0', '1', '2', '*', '|'],
        ['+', '-', '-', '-', '-', '-', '-', '+']
      ]

      expect(MineSweeper::Solve.call(second_minefield)).to match_array(response)
    end

    it 'returns minefield(without bounds) with values of mines' do
      response = [
        ['0', '1', '1', '2', '*', '3', '*', '*'],
        ['0', '2', '*', '5', '5', '*', '4', '2'],
        ['2', '4', '*', '*', '*', '*', '3', '1'],
        ['*', '*', '6', '*', '5', '3', '3', '*'],
        ['4', '*', '*', '2', '3', '*', '3', '1'],
        ['2', '*', '3', '1', '2', '*', '4', '2'],
        ['3', '4', '4', '2', '2', '3', '*', '*'],
        ['*', '*', '*', '*', '1', '2', '*', '*']
      ]

      expect(MineSweeper::Solve.call(third_minefield)).to match_array(response)
    end
  end
end
