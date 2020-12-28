# frozen_string_literal: true

module MineSweeper
  class Solve < ApplicationService
    def initialize(map = [])
      @map = map.freeze
      @last_row = @map.size - 1
      @last_col = @map.first.size - 1
    end

    def call
      (0..@last_row).each_with_object(@map.dup.map(&:dup)) do |j, solved_map|
        @adj_rows = ([j - 1, 0].max..[j + 1, @last_row].min).to_a
        (0..@last_col).each do |k|
          next if solved_map[j][k].present?

          solved_map[j][k] = mine_counter(k)
        end
      end
    end

    private

    def adj_cols
      (0..@last_col).index_with do |j|
        ([j - 1, 0].max..[j + 1, @last_col].min).to_a
      end
    end

    def mine_counter(col_index)
      @adj_rows.product(adj_cols[col_index]).count do |r, c|
        @map[r][c] == '*'
      end.to_s
    end
  end
end
