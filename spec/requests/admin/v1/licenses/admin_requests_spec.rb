require 'rails_helper'

RSpec.describe "Admin V1 Licenses as :admin", type: :request do
  let(:user) { create(:user, profile: :admin) }
  let(:game) { create(:game) }
  let!(:licenses) { create_list(:license, 10, game: game, user: user) }

  context "GET /licenses" do
    let(:url) { "/admin/v1/licenses" }

    it "returns a list of licenses" do
      get url, headers: auth_header(user)
      expect(licenses.count).to eq(10)
    end

    it "should return status 200 success" do
      get url, headers: auth_header(user)
      expect(response).to have_http_status(:ok)
    end

    it "should return status 401 unauthorized" do
      get url
      expect(response).to have_http_status(:unauthorized)
    end
  end

  context "GET /licenses/:id" do
    let(:url) { "/admin/v1/licenses/#{licenses.first.id}" }

    it "returns a license" do
      get url, headers: auth_header(user)
      expect(response).to have_http_status(:ok)
    end

    it "should return status 200 success" do
      get url, headers: auth_header(user)
      expect(response).to have_http_status(:ok)
    end

    it "should return status 401 unauthorized" do
      get url
      expect(response).to have_http_status(:unauthorized)
    end
  end

  context "POST /licenses" do
    let(:url) { "/admin/v1/licenses" }

    context "with valid params" do
      let(:license_params) { { license: attributes_for(:license, game_id: game.id, user_id: user.id) }.to_json }

      it "adds a new License" do
        expect do
          post url, headers: auth_header(user), params: license_params
        end.to change(License, :count).by(1)
      end

      it "returns last added License" do
        post url, headers: auth_header(user), params: license_params
        expected_license = License.last.as_json(only: %i(id game_id user_id key))
        expect(body_json['license']).to eq expected_license
      end
    end

    context "with invalid params" do
      let(:license_invalid_params) do
        { license: attributes_for(:license, key: nil) }.to_json
      end

      it 'does not add a new License' do
        expect do
          post url, headers: auth_header(user), params: license_invalid_params
        end.to_not change(License, :count)
      end

      it 'returns error message' do
        post url, headers: auth_header(user), params: license_invalid_params
        expect(body_json['errors']['fields']).to have_key('key')
      end

      it 'returns unprocessable_entity status' do
        post url, headers: auth_header(user), params: license_invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
