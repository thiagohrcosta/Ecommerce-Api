require 'rails_helper'

RSpec.describe "Admin V1 License as :client", type: :request do
  let(:user) { create(:user, profile: :client) }
  let(:game) { create(:game) }
  let!(:licenses) { create_list(:license, 10, game: game, user: user) }

  context "GET /license" do
    let(:url) { "/admin/v1/licenses" }

    before(:each) { get url, headers: auth_header(user) }

    include_examples "forbidden access"
  end

  context "POST /license" do
    let(:url) { "/admin/v1/licenses" }

    before(:each) { post url, headers: auth_header(user) }
    include_examples "forbidden access"
  end

  context "PATCH /license" do
    let(:url) { "/admin/v1/licenses/#{license.id}" }
    let(:license) { create(:license, game: game, user: user) }

    before(:each) { patch url, headers: auth_header(user) }
    include_examples "forbidden access"
  end
  context "DELETE /license" do
    let(:url) { "/admin/v1/licenses/#{license.id}" }
    let(:license) { create(:license, game: game, user: user) }

    before(:each) { delete url, headers: auth_header(user) }
    include_examples "forbidden access"
  end

end
