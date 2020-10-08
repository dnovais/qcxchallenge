require 'rails_helper'

RSpec.describe "Disciplines", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/disciplines"
      expect(response).to have_http_status(:success)
    end
  end

end
