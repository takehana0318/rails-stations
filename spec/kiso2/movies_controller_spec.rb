require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  render_views
  describe 'Station6 GET /movies/:id' do
    let!(:movie) { create(:movie) }
    let!(:theater) { create(:theater) }
    before do
      get :show, params: { id: movie.id }, session: {}
    end

    it 'movies(:id)に対応するレコードの情報が含まれていること' do
      expect(response.body).to include(theater.name)
    end

  end
end
