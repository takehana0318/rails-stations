# frozen_string_literal: true

# for movie
class SheetsController < ApplicationController
  def index
    all_count = Sheet.count
    row_count = Sheet.where(row: 'a').count
    times = all_count / row_count - 1
    @yoko = row_count - 1
    @array = []
    (0..times).each do |x|
      @array << x * row_count
    end
    @sheets = Sheet.all.to_a
  end
end
