# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Ranking exits?' do
  describe 'Does movies have a ranking?' do
    it 'Rankingモデルが作成されていること' do
      expect(defined?(Ranking)).to eq 'constant'
    end
  end
end
