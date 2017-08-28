require 'rails_helper'

RSpec.describe 'Responses', type: :request do
  describe 'GET /responses' do
    it 'works!' do
      resp = Response.first
      get response_path(resp, slug: resp.slug)
      expect(response).to have_http_status(200)
    end
  end
end
