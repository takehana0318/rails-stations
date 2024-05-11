class SheetsController < ApplicationController
  def index
    all_count = Sheet.count
    row_count = Sheet.where(row: 'a').count
    times = all_count / row_count - 1
    @yoko = row_count - 1
    @array = []
    for x in 0..times
      @array << x * row_count
    end
    @sheets = Sheet.all.to_a
  end
end
