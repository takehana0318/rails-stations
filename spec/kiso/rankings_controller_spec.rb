# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RankingsController, type: :controller do
  render_views
  describe 'GET /' do
    let!(:movie) { create(:movie) }
    let!(:ranking) { create(:ranking) }
    before do
      get :index, params: {}, session: {}
    end

    it 'rankingに対応するレコードの情報が含まれていること' do
      expect(response.body).to include(ranking.count.to_s)
    end
  end
end
