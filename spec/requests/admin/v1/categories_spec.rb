require 'rails_helper'

RSpec.describe "Admin V1 Categories", type: :request do
  let(:user) { create(:user) }

  context "GET /categories" do
    let!(:categories) { create_list(:category, 5) }
    let(:url) { "/admin/v1/categories" }

    it "should return all Categories" do
      get url, headers: auth_header(user)
      expect(body_json['categories']).to contain_exactly *categories.as_json(only: %i(id name))
    end

    it "should return status 200 success" do
      get url, headers: auth_header(user)
      expect(response).to have_http_status(:ok)
    end
    
  end
end
