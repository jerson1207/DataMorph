require 'rails_helper'

RSpec.describe "Page", type: :request do
  describe "GET /" do
    it "renders the home page" do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end
end
